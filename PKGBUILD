# Maintainer: Viech <viech unvanquished net>
# Contributor: Baptiste Jonglez
# Contributor: Gereon Schomber
# Contributor: Martin F. Schumann

pkgname=unvanquished-git
pkgver=0.53.1.r18.g7810f3453
pkgrel=1
pkgdesc='A team-based, fast-paced, fps/rts hybrid game which pits aliens against humans. Git version.'
arch=('x86_64')
url='https://www.unvanquished.net'
license=('GPL3')
makedepends=('cmake' 'git')
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
_unvanquished="Unvanquished"

# NaCL SDK is a buildtime dependency of Dæmon.
# NOTE: Due to enormous compile times, we use a binary distribution.
_naclsdk_base_ver=6
_naclsdk_ver="linux64-${_naclsdk_base_ver}"
_naclsdk="${_naclsdk_ver}"

source=("unvanquished.install"
        "unvanquished.sh"
        "unvanquished-tty.sh"
        "unvanquished.conf"
        "unvanquished.desktop"
        "unvanquished.service"
        "${_unvanquished}::git+https://github.com/Unvanquished/Unvanquished.git#${_type}=${_checkout}"
        "naclsdk_${_naclsdk_ver}.tar.bz2::https://dl.unvanquished.net/deps/${_naclsdk_ver}.tar.bz2")

md5sums=('6d9430b5b06b93a43a1cb79e14637f0b'
         '8d89d015e13f39f1849dfa40146dbfb6'
         '705d8ad238356cd8fc97f63060f9b2e9'
         'fd69458c8aa7fa8e71cea6a5993fdcbc'
         '6d0c7f32cb46e2a3a3901f0ad745fa39'
         'acf733d3389af8806edc54c872212e53'
         'SKIP'
         '8e3e08ca8797e45e8dc01cdadf938676')

pkgver() {
	cd "${srcdir}/${_unvanquished}"
	git describe --match 'v*' --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_unvanquished}"

	git submodule update --init --recursive

	cd "${srcdir}"

	ln -sfr "${_naclsdk}" "${_unvanquished}/daemon/external_deps/${_naclsdk}"
}

build() {
	cd "${srcdir}/${_unvanquished}"

	mkdir -p build
	cd build

	cmake \
		-D BUILD_CGAME=OFF \
		-D BUILD_SGAME=OFF \
		-D USE_BREAKPAD=ON \
		..
	make
}

package() {
	cd "${pkgdir}"

	# Create installation directories.
	install -d -m 755 \
		etc/conf.d \
		etc/unvanquished \
		usr/bin \
		usr/lib/systemd/system \
		usr/lib/unvanquished \
		usr/share/applications \
		usr/share/licenses/unvanquished \
		usr/share/unvanquished/pkg \
		var/lib/unvanquished-server/config \
		var/lib/unvanquished-server/game

	# Install content.
	cd "${srcdir}"

	install -m 755 unvanquished.sh         "${pkgdir}/usr/bin/unvanquished"
	install -m 755 unvanquished-tty.sh     "${pkgdir}/usr/bin/unvanquished-tty"
	install -m 644 unvanquished.conf       "${pkgdir}/etc/conf.d/"
	install -m 644 unvanquished.service    "${pkgdir}/usr/lib/systemd/system/"
	install -m 644 unvanquished.desktop    "${pkgdir}/usr/share/applications/"

	cd "${srcdir}/${_unvanquished}"

	install -m 644 COPYING.txt             "${pkgdir}/usr/share/licenses/unvanquished/"

	cd "${srcdir}/${_unvanquished}/build"

	install -m 755 daemon                  "${pkgdir}/usr/lib/unvanquished/"
	install -m 755 daemonded               "${pkgdir}/usr/lib/unvanquished/"
	install -m 755 daemon-tty              "${pkgdir}/usr/lib/unvanquished/"
	install -m 755 crash_server            "${pkgdir}/usr/lib/unvanquished/"
	install -m 755 irt_core-x86*.nexe      "${pkgdir}/usr/lib/unvanquished/"
	install -m 755 nacl_helper_bootstrap   "${pkgdir}/usr/lib/unvanquished/"
	install -m 755 nacl_loader             "${pkgdir}/usr/lib/unvanquished/"

	cd "${srcdir}/${_unvanquished}/dist/configs"

	install -m 644 game/maprotation.cfg    "${pkgdir}/etc/unvanquished/"
	install -m 644 config/server.cfg       "${pkgdir}/etc/unvanquished/"

	cd "${srcdir}/${_unvanquished}/dist/icons"

	for resolution in $(ls -c1); do
		icondir="${pkgdir}/usr/share/icons/hicolor/${resolution}/apps"
		install -d -m 755 "${icondir}"
		install -m 644 "${resolution}/unvanquished.png" "${icondir}"
	done

	# setup server home directory
	cd "${pkgdir}/var/lib/unvanquished-server/config"

	ln -s ../../../../etc/unvanquished/server.cfg .

	cd "${pkgdir}/var/lib/unvanquished-server/game"

	ln -s ../../../../etc/unvanquished/maprotation.cfg .
}
