# Maintainer: Xavier (sapphirus at azorium dot net)
# Original Contributor: Mikael Eriksson <mikael_eriksson@miffe.org>

_pkgbase=ocp
pkgname=('ocp' 'ocp-sdl2')
pkgver=0.2.103
pkgrel=2
pkgdesc="Open Cubic Player"
arch=('i686' 'x86_64')
url="https://stian.cubic.org/project-ocp.php"
license=('GPL')

optdepends=('libvorbis: Vorbis codec support'
	    'libmad: MPEG codec support'
	    'flac: FLAC codec support')

makedepends=('alsa-lib'
	     'cjson'
	     'desktop-file-utils'
	     'freetype2'
	     'flac'
	     'git'
	     'ncurses'
	     'sdl2'
	     'xa'
	     'libancient'
	     'libdiscid' 
	     'libmad'
	     'libjpeg-turbo'
	     'libpng'
	     'libvorbis'
	     'ttf-unifont')

source=(${_pkgbase}::git+https://github.com/mywave82/opencubicplayer.git#tag=v${pkgver})
sha256sums=('SKIP')

pkgver() {
    	cd $_pkgbase
	echo "$(git describe --tags | sed 's/^v//; s/-/.r/; s/-g/./')"
}

prepare() {
	echo -e "\033[1;31m##!! NOTICE !!##\033[0m"
	echo -e "\033[0;33mStarting with ocp 0.2.103, the ocp package has been split into two meta packages."
	echo "Depending upon which features you use, no action will need to be taken."
	echo -e "X11/SDL2 functionality is now provided by the ocp-sdl2 meta package.\033[0m"
	echo  "Thanks for flying ocp in the AUR! :)"
        cd $_pkgbase
	git submodule init
	git submodule update --init --recursive
}

build() {
  	cd $_pkgbase	
	./configure --prefix=/usr --sysconfdir=/etc --with-builtin=core\
	    	    --without-update-desktop-database\
		    --without-update-mime-database\
		    --with-unifontdir=/usr/share/fonts/Unifont\
		    --with-unifont-ttf=/usr/share/fonts/Unifont/Unifont.ttf\
		    --with-unifont-csur-ttf=/usr/share/fonts/Unifont/Unifont_CSUR.ttf\
		    --with-unifont-upper-ttf=/usr/share/fonts/Unifont/Unifont_Upper.ttf
	make subdirs ocp ocp.hlp DESTDIR="$pkgdir"
}

package_ocp-sdl2() {
	provides=(${_pkgbase}-sdl2=${pkgver})
	conflicts=('ocp' 'ocp-curses')
	install=${_pkgbase}.install	
	depends=('alsa-lib'
		 'cjson'
		 'freetype2'
		 'hicolor-icon-theme'
		 'ncurses'
	   	 'sdl2'
	 	 'shared-mime-info'
	 	 'libancient'
		 'libdiscid'
		 'libjpeg-turbo' 
	 	 'libpng'
		 'ttf-unifont')
	cd $_pkgbase
	./configure --prefix=/usr --sysconfdir=/etc --with-builtin=core\
                    --without-update-desktop-database\
                    --without-update-mime-database\
                    --with-unifontdir=/usr/share/fonts/Unifont\
                    --with-unifont-ttf=/usr/share/fonts/Unifont/Unifont.ttf\
                    --with-unifont-csur-ttf=/usr/share/fonts/Unifont/Unifont_CSUR.ttf\
                    --with-unifont-upper-ttf=/usr/share/fonts/Unifont/Unifont_Upper.ttf
	make DESTDIR="$pkgdir" libocp.so
	make DESTDIR="$pkgdir" install
}

package_ocp() {
	provides=(${_pkgbase}=${pkgver}
		  ${_pkgbase}-curses=${pkgver})
	conflicts=('ocp-curses' 'ocp-sdl2')
	depends=('alsa-lib' 
                 'cjson'
		 'ncurses'
		 'libancient'
		 'libdiscid')
	cd $_pkgbase
	./configure --prefix=/usr --sysconfdir=/etc --with-builtin=core\
		    --without-x11 --without-sdl2\
		    --without-update-desktop-database\
                    --without-update-mime-database
	make DESTDIR="$pkgdir" libocp.so
	make DESTDIR="$pkgdir" install
}
