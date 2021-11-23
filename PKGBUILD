# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=hilbish
pkgver=0.7.1
pkgrel=1
pkgdesc="The flower shell for Lua users"
arch=('x86_64' 'aarch64')
url="https://github.com/rosettea/hilbish"
license=('MIT')
depends=('readline' 'lua-lunacolors' 'lua-succulent' 'lua-inspect')
makedepends=('go')
install="$pkgname.install"
options=('!emptydirs')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('694e8b341bdca140d9624e95cc0226606bbacc8e67c3d981e56f52cb67b8e1a4')

prepare() {
	cd "Hilbish-$pkgver"
	sed -i '\|/etc/shells|d' Makefile
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "Hilbish-$pkgver"
	make build
}

package() {
	cd "Hilbish-$pkgver"
	DESTDIR="$pkgdir/" make install
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
