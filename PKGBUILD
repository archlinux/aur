# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=knit
pkgver=1.1.0
pkgrel=1
pkgdesc='A simple and flexible build too using Lua, similar to make/mk'
arch=(x86_64)
url="https://github.com/zyedidia/$pkgname"
license=(MIT)
depends=(glibc)
makedepends=(go)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('ab92b240adc1f63502bd1de7f1d3eb64f508aa1e2ca7955d648d0a7351bbf37f')

build() {
	cd "$_archive"
	export CGO_CPPFLAGS="$CPPFLAGS"
	export CGO_CFLAGS="$CFLAGS"
	export CGO_CXXFLAGS="$CXXFLAGS"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	set -x
	go build \
		-ldflags "-linkmode external -extldflags '$LDFLAGS'" \
		-o $pkgname \
		./cmd/$pkgname
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" $pkgname
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

