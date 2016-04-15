# Maintainer: Viech <viech unvanquished net>
# Contributor: Gereon Schomber
# Contributor: Martin F. Schumann

pkgname=unvanquished
pkgver=0.50.0
pkgrel=1

_gitver="archlinux/${pkgver}-${pkgrel}"
_unvanquished="${pkgname/u/U}-${_gitver/\//-}"

_naclsdkver="4"
if test "$CARCH" == "x86_64"; then
	_naclsdkname=linux64
else
	_naclsdkname=linux32
fi
_naclsdk="${_naclsdkname}-${_naclsdkver}"

pkgdesc='A team-based, fast-paced, fps/rts hybrid game which pits aliens against humans. Monthly alpha release.'
arch=('x86_64' 'i686')
url='http://www.unvanquished.net'
license=('GPL3')

makedepends=('cmake')
depends=("unvanquished-data>=${pkgver}"
         'zlib' 'gmp' 'nettle' 'geoip' 'curl' 'sdl2' 'glew' 'libpng'
         'libjpeg-turbo' 'libwebp>=0.2.0' 'freetype2' 'openal' 'libogg'
         'libvorbis' 'speex' 'libtheora' 'opusfile' 'ncurses' 'xdg-utils'
         'desktop-file-utils' 'shared-mime-info' 'hicolor-icon-theme')
provides=('unvanquished')
conflicts=('unvanquished-git')
options=('emptydirs' '!strip')
backup=('etc/conf.d/unvanquished.conf' 'etc/unvanquished/server.cfg' 'etc/unvanquished/maprotation.cfg')
install='unvanquished.install'
source=("https://github.com/Unvanquished/Unvanquished/archive/${_gitver}.tar.gz"
        'unvanquished.install' "https://dl.unvanquished.net/deps/${_naclsdk}.tar.bz2")

prepare() {
	cd "${srcdir}"

	ln -sfr "${_naclsdk}" -t "${_unvanquished}/daemon/external_deps"
}

build() {
	cd "${srcdir}/${_unvanquished}"

	mkdir -p build
	cd build

	cmake -D BUILD_CGAME=OFF -D BUILD_SGAME=OFF ..
	make
}

package() {
	# create installation directories
	cd "${pkgdir}"

	install -dm755 etc/conf.d \
	               etc/unvanquished \
	               usr/bin \
	               usr/lib/systemd/system \
	               usr/lib/unvanquished \
	               usr/share/applications \
	               usr/share/icons/hicolor/128x128/apps \
	               usr/share/licenses/unvanquished \
	               usr/share/unvanquished/pkg \
	               var/lib/unvanquished-server/config \
	               var/lib/unvanquished-server/game

	# install content
	cd "${srcdir}/${_unvanquished}"

	install -m 644 debian/unvanquished.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/"
	install -m 644 COPYING.txt             "${pkgdir}/usr/share/licenses/unvanquished/"

	cd "${srcdir}/${_unvanquished}/build"

	install -m 755 daemon                  "${pkgdir}/usr/lib/unvanquished/"
	install -m 755 daemonded               "${pkgdir}/usr/lib/unvanquished/"
	install -m 755 daemon-tty              "${pkgdir}/usr/lib/unvanquished/"
	install -m 755 irt_core-x86*.nexe      "${pkgdir}/usr/lib/unvanquished/"
	install -m 755 nacl_helper_bootstrap   "${pkgdir}/usr/lib/unvanquished/"
	install -m 755 nacl_loader             "${pkgdir}/usr/lib/unvanquished/"

	# install starters and dedicated server config
	cd "${srcdir}/${_unvanquished}/archlinux"

	install -m 755 unvanquished.sh         "${pkgdir}/usr/bin/unvanquished"
	install -m 755 unvanquished-tty.sh     "${pkgdir}/usr/bin/unvanquished-tty"
	install -m 644 unvanquished.conf       "${pkgdir}/etc/conf.d/"
	install -m 644 unvanquished.service    "${pkgdir}/usr/lib/systemd/system/"
	install -m 644 unvanquished.desktop    "${pkgdir}/usr/share/applications/"
	install -m 644 configs/maprotation.cfg "${pkgdir}/etc/unvanquished/"
	install -m 644 configs/server.cfg      "${pkgdir}/etc/unvanquished/"

	# setup server home directory
	cd "${pkgdir}/var/lib/unvanquished-server/config"

	ln -s ../../../../etc/unvanquished/server.cfg .

	cd "${pkgdir}/var/lib/unvanquished-server/game"

	ln -s ../../../../etc/unvanquished/maprotation.cfg .
}

md5sums=('2b38424398807b73acc18eefbbb6a3ef'
         'a5246cf3bed53798ddc4d95c6b8c1b37')
if test "$CARCH" == "x86_64"; then
	md5sums+=('2ba12c71625919ddc282172b74fa4887')
else
	md5sums+=('dd2cb5419bac9a1b81a8a996312e33ff')
fi
