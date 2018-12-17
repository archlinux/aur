# Maintainer  : Yiannis A Ginis <drxspace[at]gmail[dot]com>
# Contributor : Chris Sakalis <chrissakalis[at]gmail[dot]com>

pkgname=conky-lua-archers-git
_pkgname=conky
pkgver=3333.616d3af6
pkgrel=1
pkgdesc="A free, light-weight system monitor for X with lua enabled for Arch based distros"
arch=('i686' 'x86_64')
url="https://github.com/brndnmtthws/conky/"
license=('GPL3' 'BSD')
replaces=('torsmo' 'conky')
provides=('conky')
conflicts=('conky' 'conky-lua' 'conky-lua-arch' 'conky-lua-nv' 'conky-lua-archers')
depends=(
	'alsa-lib'
	'cairo'
	'curl'
	'glib2'
	'imlib2'
	'libxnvctrl'
	'librsvg'
	'libxdamage'
	'libxft'
	'libxinerama'
	'libxml2'
	'lua51'
	'tolua++'
	'wireless_tools'
)
makedepends=(
	'cmake'
	'docbook2x'
	'docbook-xml'
	'docbook-xsl'
	'git'
	'perl-xml-libxml'
	'perl-xml-sax-expat'
)
source=("git://github.com/brndnmtthws/${_pkgname}.git")
sha1sums=('SKIP')
options=('strip' '!debug' '!emptydirs')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	mkdir -p build/               # as @afaikifreedom recommended
}

build() {
	cd "${srcdir}/${_pkgname}/build"

	cmake \
		-D CMAKE_BUILD_TYPE=Release \
		-D CMAKE_INSTALL_PREFIX=/usr \
		-D MAINTAINER_MODE=ON \
		-D BUILD_BUILTIN_CONFIG=ON \
		-D BUILD_APCUPSD=ON \
		-D BUILD_ARGB=ON \
		-D BUILD_CURL=ON \
		-D BUILD_I18N=ON \
		-D BUILD_IBM=OFF \
		-D BUILD_IMLIB2=ON \
		-D BUILD_IOSTATS=ON \
		-D BUILD_IPV6=ON \
		-D BUILD_LUA_CAIRO=ON \
		-D BUILD_LUA_IMLIB2=ON \
		-D BUILD_LUA_RSVG=ON \
		-D BUILD_MOC=OFF \
		-D BUILD_MPD=OFF \
		-D BUILD_NVIDIA=ON \
		-D BUILD_OLD_CONFIG=ON \
		-D BUILD_PULSEAUDIO=ON \
		-D BUILD_WLAN=ON \
		-D BUILD_X11=ON \
		-D BUILD_XDAMAGE=ON \
		-D BUILD_XDBE=ON \
		-D BUILD_XFT=ON \
		-D BUILD_XINERAMA=ON \
		-D DEFAULTNETDEV=enp7s4 \
		-D OWN_WINDOW=ON \
		..
	make
}

package() {
	cd "${srcdir}/${_pkgname}/build"
	make DESTDIR=${pkgdir} install
	cd ..
	install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	install -D -m644 LICENSE.BSD ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.BSD
	install -D -m644 extras/vim/syntax/conkyrc.vim "${pkgdir}"/usr/share/vim/vimfiles/syntax/conkyrc.vim
	install -D -m644 extras/vim/ftdetect/conkyrc.vim "${pkgdir}"/usr/share/vim/vimfiles/ftdetect/conkyrc.vim
}
