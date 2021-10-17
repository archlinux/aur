# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=hilbish-git
pkgver=0.5.1.r64.gb97e1ef
pkgrel=1
pkgdesc="The flower shell for Lua users"
arch=('x86_64' 'aarch64')
url="https://github.com/rosettea/hilbish"
license=('MIT')
depends=('readline' 'lua-lunacolors' 'lua-succulent')
makedepends=('git' 'go>=1.16')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="$pkgname.install"
options=('!emptydirs')
source=("$pkgname::git+$url?signed")
sha256sums=('SKIP')
validpgpkeys=('098F50DFBCEEC71A4EAB6DA450EE40A2809851F5')

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
	cd "$pkgname"
	sed -i '\|/etc/shells|d' Makefile
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "$pkgname"
	make dev
}

package() {
	cd "$pkgname"
	DESTDIR="$pkgdir/" make install
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
