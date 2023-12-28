# Contributer: Paramvir Likhari <plikhari at gmail dot com>
# Maintainer: jlaunay

# This conky version has built in tolua++_5.3 lua and only supports lua 5.3

# to create NON NVIDIA package - change #depends below
# in build  section remove line containing change -D BUILD_NVIDIA=OFF to -D BUILD_NVIDIA=ON \

# the covert.lua utility is also put in the /usr/bin folder
# as an executable conky-convert.lua - so can be called anywhere.
# I prefer to give the new files a .lua extension - easier to edit.
# the config section uses -- as comment and text section uses # for comment

pkgname=conky-cairo-wayland-git
_pkgname=conky
pkgver=1.19.6.r47.g5e6db91b
pkgrel=1
pkgdesc='Lightweight system monitor for X, Wayland, console, or file/HTTP output (with Cairo/Cairo-Lua support)'
url='https://github.com/brndnmtthws/conky'
license=('GPL3' 'BSD')
arch=('i686' 'x86_64')

replaces=('torsmo' 'conky')
conflicts=('conky')
provides=('conky')

## nvidia requirements - comment for non-nvidia
#depends=( 'alsa-lib' 'libxml2' 'curl' 'cairo' 'wireless_tools' 'libxft' 'librsvg' 'glib2' 'libxdamage' 'imlib2' 'lua' 'libxnvctrl' 'libxinerama' )

## NON-nvidia requirements - remove comment for non-nvidia
## in the cmake line below change -D BUILD_NVIDIA=ON \ to -D BUILD_NVIDIA=OFF \
depends=( 'alsa-lib' 'libxml2' 'curl' 'cairo' 'wireless_tools' 'libxft' 'librsvg' 'glib2' 'libxdamage' 'imlib2' 'lua' 'libxinerama' )

makedepends=( 'cmake' 'git' )

source=("git+${url}.git" )

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

sha256sums=('SKIP')

build() {
	cd "${srcdir}/${_pkgname}"
	## correction to conky.cc for the git version
	sed -i 's|conky::run_all_callbacks();||' src/conky.cc

	cmake \
		-D CMAKE_BUILD_TYPE=Release \
		-D CMAKE_INSTALL_PREFIX=/usr \
		-D BUILD_WLAN=ON \
		-D BUILD_CURL=ON \
		-D BUILD_RSS=OFF \
		-D BUILD_XDBE=ON \
		-D BUILD_XSHAPE=ON \
		-D BUILD_IMLIB2=ON \
		-D BUILD_ICONV=ON \
		-D BUILD_LUA_CAIRO=ON \
		-D BUILD_LUA_IMLIB2=ON \
		-D BUILD_LUA_RSVG=ON \
		-D BUILD_WAYLAND=ON \
		-D BUILD_DOCS=OFF \
    -D BUILD_NVIDIA=OFF \
		.

	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}" install
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm755 extras/convert.lua "${pkgdir}"/usr/bin/conky-convert.lua
}
