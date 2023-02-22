# Maintainer: Xavier (sapphirus at azorium dot net)
# Original Maintainer: Ossi Saukko <osaukko at gmail dot com>

_pkgbase=ocp
pkgname=('ocp-git' 'ocp-sdl2-git')
pkgver=0.2.102.r40.3e1a320
pkgrel=1
pkgdesc="Open Cubic Player (GIT Version)"
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
	     'libvorbis')

source=(${_pkgbase}::git+https://github.com/mywave82/opencubicplayer.git)
sha256sums=('SKIP')

pkgver() {
    	cd $_pkgbase
	echo "$(git describe --tags | sed 's/^v//; s/-/.r/; s/-g/./')"
}

prepare() {
	echo -e "\033[1;31m##!! NOTICE !!##\033[0m"
	echo -e "\033[0;33mStarting with ocp 0.2.103, the ocp-git package has been split into two meta packages."
	echo "Depending upon which features you use, no action will need to be taken."
	echo -e "X11/SDL2 functionality is now provided by the ocp-sdl2-git meta package.\033[0m"
	echo  "Thanks for flying ocp-git in the AUR! :)"
        cd $_pkgbase
	git submodule init
	git submodule update --init --recursive
}

build() {
  	cd $_pkgbase	
	./configure --prefix=/usr --sysconfdir=/etc --with-builtin=core cross_compiling=yes\
	    	    --without-update-desktop-database\
		    --without-update-mime-database\
		    --with-unifontdir=/usr/share/fonts/Unifont\
		    --with-unifont-ttf=/usr/share/fonts/Unifont/Unifont.ttf\
		    --with-unifont-csur-ttf=/usr/share/fonts/Unifont/Unifont_CSUR.ttf\
		    --with-unifont-upper-ttf=/usr/share/fonts/Unifont/Unifont_Upper.ttf
	make DESTDIR="$pkgdir" subdirs ocp ocp.hlp 
}

package_ocp-sdl2-git() {
	provides=(${_pkgbase}=${pkgver}
		  ${_pkgbase}-sdl2=${pkgver})
	conflicts=('ocp' 'ocp-sdl2' 'ocp-curses')
	install=${_pkgbase}.install	
	depends=('alsa-lib'
		 'bzip2'
		 'cjson'
		 'freetype2'
		 'hicolor-icon-theme'
		 'ncurses'
	   	 'sdl2'
	 	 'shared-mime-info'
		 'zlib'
		 'libancient'
		 'libdiscid'
		 'libjpeg-turbo' 
	 	 'libpng'
		 'ttf-unifont')
	cd $_pkgbase
	./configure --prefix=/usr --sysconfdir=/etc --with-builtin=core cross_compiling=yes\
		    --without-sdl --without-x11\
		    --without-update-desktop-database\
                    --without-update-mime-database\
                    --with-unifontdir=/usr/share/fonts/Unifont\
                    --with-unifont-ttf=/usr/share/fonts/Unifont/Unifont.ttf\
                    --with-unifont-csur-ttf=/usr/share/fonts/Unifont/Unifont_CSUR.ttf\
                    --with-unifont-upper-ttf=/usr/share/fonts/Unifont/Unifont_Upper.ttf
	make DESTDIR="$pkgdir" libocp.so
	make DESTDIR="$pkgdir" install
}

package_ocp-git() {
	provides=(${_pkgbase}=${pkgver}
		  ${_pkgbase}-curses=${pkgver})
	conflicts=('ocp-curses' 'ocp-sdl2')
	depends=('alsa-lib'
	         'bzip2'
                 'cjson'
		 'ncurses'
		 'zlib'
		 'libancient'
		 'libdiscid')
	cd $_pkgbase
	./configure --prefix=/usr --sysconfdir=/etc --with-builtin=core\
		    --without-x11 --without-sdl --without-sdl2\
		    --without-update-desktop-database\
                    --without-update-mime-database
	make DESTDIR="$pkgdir" libocp.so
	make DESTDIR="$pkgdir" install
}
