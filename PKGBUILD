# Contributer: Paramvir Likhari <plikhari at gmail dot com>
# Maintainer: Paramvir Likhari <plikhari at gmail dot com>

# This PKGBUILD creates conky for tolua++_5.3 lua + cairo + imlib2 + nvidia

# The git version has built in tolua++_5.3 lua

# to create NON NVIDIA package - remove following
# in makedepends 'libxnvctrl'
# in build  section remove line containing -D BUILD_NVIDIA=ON \
# For non-cairo conky - install stock version from Arch repos

# the covert.lua utility is also put in the /usr/bin folder
# as an executable conky-convert.lua - so can be called anywhere.
# I prefer to give the new files a .lua extension - easier to edit.
# the config section uses -- as comment and text section uses # for comment

# 'Lightweight system monitor for X. conky 1.11.1 has integrated lua - this build includes lua-cairo, lua-imlib2, nvidia and other bindings. Read this PKGBUILD for added comments re installing Audacious etc or disabling nvidia. Visit http://conky.sourceforge.net/docs.html for conky help and https://github.com/brndnmtthws/conky/issues for conky issues.'

# There are many packages that can be added like xenirama - if you have more than
# one display - add it in the depends and build section. Like wise - the docs are
# NOT included here - when was the last time you had a look at the built in docs
# if you need them - just add the 'docbook2x' 'docbook-xml' 'docbook-xsl'
# 'perl-xml-libxml' 'perl-xml-sax-expat' in makedepends

pkgname=conky-cairo
pkgver=1.11.1
pkgrel=1
pkgdesc='conky - built for nvidia n (tolua++_5.3 in AUR) - See this PKGBUILD source - Just change one variable to build the git version - defaults to release version.'
url='https://github.com/brndnmtthws/conky'
license=('GPL3' 'BSD')
arch=('i686' 'x86_64')

replaces=('torsmo' 'conky')
conflicts=('conky')
provides=('conky')


makedepends=( 'cmake' 'git' )



### change _myopts=0 to use git version
_myopts=1

case ${_myopts} in
0)  ### _myopts=0 for git version #####################################
	### we now have tolua++ 5.3 support built in !!!
	depends=( 'alsa-lib' 'libxml2' 'curl' 'cairo' 'wireless_tools' 'libxft' 'librsvg' 'glib2' 'libxdamage' 'imlib2' 'lua' 'libxnvctrl' 'libxinerama' )

	_pkgname=conky

	source=("git+${url}.git" )

	pkgver() {
		cd "${srcdir}/${_pkgname}"
		git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
	}
	md5sums=('SKIP')
    ;;
1)  ### _myopts=1 for release version #################################

	### NOTE: Install tolua++_5.3 from AUR - one of my other packages besides conkywx weather program

	depends=( 'alsa-lib' 'libxml2' 'curl' 'cairo' 'wireless_tools' 'libxft' 'librsvg' 'glib2' 'libxdamage' 'imlib2' 'lua' 'libxnvctrl' 'libxinerama' 'tolua++_5.3' )

	_pkgname="conky-${pkgver}"

	source=(${url}/archive/v${pkgver}.tar.gz)
	md5sums=('SKIP')

esac


build() {

	cd "${srcdir}/${_pkgname}"

case ${_myopts} in
1)  ### to link to tolua++ 5.3 - See my package tolua++ in AUR #####
	sed -i 's|-Werror||' cmake/ConkyBuildOptions.cmake

	sed -i \
	       -e 's|\(LUA REQUIRED\) lua5.1 lua-5.1 lua51 lua|\1 lua>=5.3|' \
	       -e 's|\(NOT LUA_VERSION VERSION_LESS\) 5.2.0|\1 5.4.0|' \
	    cmake/ConkyPlatformChecks.cmake

	sed -i \
	       -e 's|#include <string>|#include <string>\n#include <functional>|' \
	    src/luamm.hh
	;;
esac

################################################################

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
		-D BUILD_WEATHER_METAR=OFF \
		-D BUILD_WEATHER_XOAP=OFF \
		-D BUILD_LUA_CAIRO=ON \
		-D BUILD_LUA_IMLIB2=ON \
		-D BUILD_LUA_RSVG=ON \
		-D BUILD_NVIDIA=ON \
		.

	make

}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}" install
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm755 extras/convert.lua "${pkgdir}"/usr/bin/conky-convert.lua
	install -Dm644 extras/vim/syntax/conkyrc.vim "${pkgdir}"/usr/share/vim/vimfiles/syntax/conkyrc.vim
	install -Dm644 extras/vim/ftdetect/conkyrc.vim "${pkgdir}"/usr/share/vim/vimfiles/ftdetect/conkyrc.vim
	install -Dm644 extras/nano/conky.nanorc "${pkgdir}"/usr/share/nano/conky.nanorc
	install -Dm644 extras/gedit/conky.lang "${pkgdir}"/usr/share/gtksourceview-3.0/language-specs/conky.lang
}
