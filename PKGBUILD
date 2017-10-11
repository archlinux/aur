# Contributor: Viech <viech unvanquished net>
# Contributor: Gereon Schomber
# Contributor: Martin F. Schumann

# type of target to check out, 'branch' or 'tag'
_type='branch'

# either a branch or tag name, depending on _type
_checkout='master'

pkgname=unvanquished-git
pkgver=v0.50.0.219.gac31a80c1
pkgrel=1

# set this to share more text with the non-git version
_gitdir="${pkgname}"

_depver="4"
if test "$CARCH" == "x86_64"; then
	_depbasename=linux64-${_depver}
else
	_depbasename=linux32-${_depver}
fi
_depname="${_depbasename}.tar.bz2"

pkgdesc='A team-based, fast-paced, fps/rts hybrid game which pits aliens against humans. Bleeding edge version.'
arch=('x86_64' 'i686')
url='http://www.unvanquished.net'
license=('GPL3')

makedepends=('git' 'cmake' 'python2' 'python2-yaml' 'python2-jinja')
depends=('unvanquished-data'
         'zlib' 'gmp' 'nettle' 'geoip' 'curl' 'sdl2' 'glew' 'libpng'
         'libjpeg-turbo' 'libwebp>=0.2.0' 'freetype2' 'openal' 'libogg'
         'libvorbis' 'speex' 'libtheora' 'opusfile' 'ncurses' 'xdg-utils'
         'desktop-file-utils' 'shared-mime-info' 'hicolor-icon-theme')
provides=('unvanquished')
conflicts=('unvanquished')
options=('emptydirs' '!strip')
backup=('etc/conf.d/unvanquished.conf' 'etc/unvanquished/server.cfg' 'etc/unvanquished/maprotation.cfg')
install='unvanquished.install'
source=("${_gitdir}::git+https://github.com/Unvanquished/Unvanquished.git#${_type}=${_checkout}"
        'unvanquished.install' "https://dl.unvanquished.net/deps/${_depname}")

pkgver() {
	cd "${srcdir}/${_gitdir}"

	local ver="$(git describe --long --match "v*")"
	printf "%s" "${ver//-/.}"
}

prepare() {
	cd "${srcdir}"

	cd "${_gitdir}"
	git submodule init
	git submodule update
	cd ..
	ln -sfr "${_depbasename}" -t "${_gitdir}/daemon/external_deps"
}

build() {
	cd "${srcdir}/${_gitdir}"

	#cp -r "${srcdir}/${_depbasename}" external_deps/
	mkdir -p build
	cd build

	cmake -D BUILD_GAME_NACL=OFF -D BUILD_GAME_NATIVE_DLL=OFF -D BUILD_GAME_NATIVE_EXE=OFF ..
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
	cd "${srcdir}/${_gitdir}"

	install -m 644 debian/unvanquished.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/"
	install -m 644 COPYING.txt             "${pkgdir}/usr/share/licenses/unvanquished/"

	cd "${srcdir}/${_gitdir}/build"

	install -m 755 daemon                  "${pkgdir}/usr/lib/unvanquished/"
	install -m 755 daemonded               "${pkgdir}/usr/lib/unvanquished/"
	install -m 755 daemon-tty              "${pkgdir}/usr/lib/unvanquished/"
	install -m 755 irt_core-x86*.nexe      "${pkgdir}/usr/lib/unvanquished/"
	install -m 755 nacl_helper_bootstrap   "${pkgdir}/usr/lib/unvanquished/"
	install -m 755 nacl_loader             "${pkgdir}/usr/lib/unvanquished/"

	# install starters and dedicated server config
	cd "${srcdir}/${_gitdir}/archlinux"

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

md5sums=('SKIP'
         '6d9430b5b06b93a43a1cb79e14637f0b')
if test "$CARCH" == "x86_64"; then
	md5sums+=('2ba12c71625919ddc282172b74fa4887')
else
	md5sums+=('dd2cb5419bac9a1b81a8a996312e33ff')
fi
