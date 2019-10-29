# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=gammy-git
pkgver=0.9.52.r0.d92e193
pkgrel=1
pkgdesc="Automatic screen brightness tool."
arch=('x86_64')
url="https://getgammy.com"
license=('GPL3')
depends=('mesa' 'qt5-base')
makedepends=('git')
optdepends=('plog: library for debug logging')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/Fushko/gammy.git'
        "${pkgname%-git}.desktop")
sha256sums=('SKIP'
            'ad02735598429f55246969c58fe5ff54db7960e813996d6d642c08fb18687583')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	qmake Gammy.pro
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make INSTALL_ROOT="$pkgdir/" install
	install -d "$pkgdir/usr/bin"
	ln -s "/opt/gammy/bin/${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
	install -Dm644 "$srcdir/${pkgname%-git}.desktop" \
		"$pkgdir/usr/share/applications/${pkgname%-git}.desktop"
}
