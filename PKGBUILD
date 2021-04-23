# Maintainer: monosans

pkgname=dwm-monosans-git
pkgver=6.2.r1720.9b87439
pkgrel=1
pkgdesc='dwm with swallowing, systray, holdbar and other features'
url=https://github.com/monosans/dwm
arch=(i686 x86_64)
license=(MIT)
depends=(freetype2 libx11 libxinerama libxft)
optdepends=(
	'libxft-bgra: if dwm crashes when displaying emojis'
	'libxft-bgra-git: if dwm crashes when displaying emojis'
	'dmenu: program launcher'
	'st-monosans-git: default terminal emulator'
	'scrot: default screenshoter')
makedepends=(git)
source=(git://github.com/monosans/dwm)
sha256sums=('SKIP')
provides=(dwm)
conflicts=(dwm)

pkgver() {
	cd dwm
	echo "$(awk '/^VERSION =/ {print $3}' config.mk)".r"$(git rev-list --count HEAD)"."$(git rev-parse --short HEAD)"
}

prepare() {
	cd dwm
	# Respect makepkg.conf CFLAGS
	sed -i "s/CFLAGS = -std=c99 -Os/CFLAGS += -std=c99/" config.mk
}

build() {
	cd dwm
	make PREFIX=/usr X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
	cd dwm
	make PREFIX=/usr X11INC=/usr/include/X11 X11LIB=/usr/lib/X11 DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
