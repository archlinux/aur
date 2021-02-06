# Maintainer: Viech <viech unvanquished net>
# Contributor: Baptiste Jonglez
# Contributor: Gereon Schomber
# Contributor: Martin F. Schumann

pkgname=unvanquished-git
pkgver=0.51.1.r108.g33ba53888
pkgrel=1
pkgdesc='A team-based, fast-paced, fps/rts hybrid game which pits aliens against humans. Git version.'
arch=('x86_64')
url='https://www.unvanquished.net'
license=('GPL3')
makedepends=('cmake' 'git' 'python2' 'python2-yaml' 'python2-jinja')
depends=('unvanquished-data'
         'zlib' 'gmp' 'nettle' 'geoip' 'curl' 'sdl2' 'glew' 'libpng'
         'libjpeg-turbo' 'libwebp>=0.2.0' 'freetype2' 'openal' 'libogg'
         'libvorbis' 'speex' 'libtheora' 'opusfile' 'ncurses' 'xdg-utils'
         'desktop-file-utils' 'shared-mime-info' 'hicolor-icon-theme')
provides=('unvanquished')
conflicts=('unvanquished')
options=('emptydirs' '!strip')
backup=('etc/conf.d/unvanquished.conf'
        'etc/unvanquished/server.cfg'
        'etc/unvanquished/maprotation.cfg')
install=unvanquished.install

# Type of target to check out, 'branch' or 'tag'.
_type='branch'

# Either a branch or tag name, depending on _type.
_checkout='master'

# set this to share more text with the non-git version
_unvdir="Unvanquished"

# NaCL SDK is a buildtime dependency of Dæmon.
# Note that due to enormous compile times, we use a binary distribution.
_naclsdkbasever="4"
_naclsdkver="linux64-${_naclsdkbasever}"

source=("git+https://github.com/Unvanquished/Unvanquished.git#${_type}=${_checkout}"
        "naclsdk_${_naclsdkver}.tar.bz2::https://dl.unvanquished.net/deps/${_naclsdkver}.tar.bz2"
        'unvanquished.install')
md5sums=('SKIP'
         '2ba12c71625919ddc282172b74fa4887'
         '6d9430b5b06b93a43a1cb79e14637f0b')

pkgver() {
	cd "${srcdir}/${_unvdir}"
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_unvdir}"

	git submodule update --init --recursive

	cd "${srcdir}"

	ln -sfr "${_naclsdkver}" "${_unvdir}/daemon/external_deps/${_naclsdkver}"
}

build() {
	cd "${srcdir}/${_unvdir}"

	mkdir -p build
	cd build

	cmake -D BUILD_CGAME=OFF -D BUILD_SGAME=OFF ..
	make
}

package() {
	# create installation directories
	cd "${pkgdir}"

	install -dm755 \
		etc/conf.d \
		etc/unvanquished \
		usr/bin \
		usr/lib/systemd/system \
		usr/lib/unvanquished \
		usr/share/applications \
		usr/share/icons/hicolor/{32x32,64x64,128x128,256x256,512x512}/apps \
		usr/share/licenses/unvanquished \
		usr/share/unvanquished/pkg \
		var/lib/unvanquished-server/config \
		var/lib/unvanquished-server/game

	# install content
	cd "${srcdir}/${_unvdir}"

	for size in 32x32 64x64 128x128 256x256 512x512; do
		install -m 644 "dist/icons/${size}/unvanquished.png" \
			"${pkgdir}/usr/share/icons/hicolor/${size}/apps/"
	done

	install -m 644 COPYING.txt             "${pkgdir}/usr/share/licenses/unvanquished/"

	cd "${srcdir}/${_unvdir}/build"

	install -m 755 daemon                  "${pkgdir}/usr/lib/unvanquished/"
	install -m 755 daemonded               "${pkgdir}/usr/lib/unvanquished/"
	install -m 755 daemon-tty              "${pkgdir}/usr/lib/unvanquished/"
	install -m 755 irt_core-x86*.nexe      "${pkgdir}/usr/lib/unvanquished/"
	install -m 755 nacl_helper_bootstrap   "${pkgdir}/usr/lib/unvanquished/"
	install -m 755 nacl_loader             "${pkgdir}/usr/lib/unvanquished/"

	# install starters and dedicated server config
	cd "${srcdir}/${_unvdir}/archlinux"

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
