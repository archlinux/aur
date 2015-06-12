# Maintainer: Sebastian Wolf <fatmike303 at gmail dot com>
# Contributor: grimi <grimi at poczta dot fm>

pkgname=vice-sdl
_pkgname=vice
pkgver=2.4
pkgrel=3
pkgdesc="The Versatile Commodore 8-bit Emulator, SDL version"
arch=('i686' 'x86_64')
license=('GPL')
url="http://vice-emu.sourceforge.net"
depends=('sdl' 'giflib' 'libpng' 'libpcap')
makedepends=('xorg-font-utils')
provides=("vice=$pkgver")
conflicts=('vice' 'vice-gnomeui' 'vice-gtkglext' 'vice-svn')
replaces=('vice')
options=('!makeflags')
install=vice-sdl.install
source=(	http://downloads.sourceforge.net/project/vice-emu/releases/${_pkgname}-${pkgver}.tar.gz
			vice-2.4-x11video.patch
			vice-2.4-no-fc-cache-no-lib64.patch
			vice-2.4-notexi-notxt.patch
			vice-2.4-zlib-1.2.7.patch
            vice-2.4-giflib-5.1.0.patch)
md5sums=(	'b017647a0c159bbe43cdb81762d1c577'
			'99931efcb779734c9df069e94f0b38a5'
			'b0d1392664decd3169740baf90661710'
			'877f93db1550ea81386aae7c3b578442'
			'9d9f62f05a967a5926df496e86404148'
            '94563e3023d804341f1d252c0e6d1384')

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	patch -Np1 -i "${srcdir}/vice-2.4-x11video.patch"
	patch -Np1 -i "${srcdir}/vice-2.4-no-fc-cache-no-lib64.patch"
	patch -Np1 -i "${srcdir}/vice-2.4-notexi-notxt.patch"
	patch -Np1 -i "${srcdir}/vice-2.4-zlib-1.2.7.patch"
    patch -Np1 -i "${srcdir}/vice-2.4-giflib-5.1.0.patch"
	sed -i 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/' configure.in
	autoreconf -vi
}

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	./configure --prefix=/usr --enable-fullscreen --enable-sdlui --with-sdlsound --enable-ethernet --disable-ffmpeg
	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" realdocdir="/usr/share/doc/vice" install
	ln -s /usr/share/doc/vice "${pkgdir}/usr/lib/vice/doc"
}
