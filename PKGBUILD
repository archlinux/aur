# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=knit
pkgver=1.0.0
pkgrel=2
pkgdesc='A simple and flexible build too using Lua, similar to make/mk'
arch=(x86_64)
url="https://github.com/zyedidia/$pkgname"
license=(MIT)
depends=(glibc)
makedepends=(go)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('18c78e98c4675f765537b332da0dcbb7eac855220c703a81deaa03b2c0e3a092')

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

