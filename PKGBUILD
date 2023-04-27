# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=knit
pkgver=1.1.1
pkgrel=1
pkgdesc='A simple and flexible build too using Lua, similar to make/mk'
arch=(x86_64)
url="https://github.com/zyedidia/$pkgname"
license=(MIT)
depends=(glibc)
makedepends=(go)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('f4a073568ef3b44d4cf80f4acff021368c5a2cc4f047ce7b4c6b5bfa57562e2b')

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

