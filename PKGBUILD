# Maintainer: monosans

pkgname=st-monosans-git
pkgver=0.8.4.r1147.a4b8166
pkgrel=2
pkgdesc='Simple (suckless) terminal with scrollback, ligatures and One Dark color scheme'
url=https://github.com/monosans/st
arch=(i686 x86_64)
license=(MIT)
depends=(libxft harfbuzz ttf-jetbrains-mono)
optdepends=(
	'libxft-bgra: if st crashes when viewing emojis'
	'libxft-bgra-git: if st crashes when viewing emojis')
makedepends=(git libxext ncurses)
source=(git://github.com/monosans/st)
sha256sums=('SKIP')
provides=(st)
conflicts=(st)

pkgver() {
	cd st
	echo "$(awk '/^VERSION =/ {print $3}' config.mk)".r"$(git rev-list --count HEAD)"."$(git rev-parse --short HEAD)"
}

prepare() {
	cd st
	sed -i '/tic /d' Makefile
}

build() {
	cd st
	make PREFIX=/usr X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
	cd st
	make PREFIX=/usr X11INC=/usr/include/X11 X11LIB=/usr/lib/X11 DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
