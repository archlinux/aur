# Maintainer: Xavier (sapphirus at azorium dot net)
# Original Maintainer: Ossi Saukko <osaukko at gmail dot com>

_pkgbase=ocp
pkgname=('ocp-git' 'ocp-sdl2-git')
pkgver=0.2.102.r25.be056b7
pkgrel=1
pkgdesc="Open Cubic Player (GIT Version)"
arch=('i686' 'x86_64')
url="https://stian.cubic.org/project-ocp.php"
license=('GPL')

optdepends=('libvorbis: Vorbis codec support'
	    'libmad: MPEG codec support'
	    'flac: FLAC codec support')

makedepends=('git'
             'xa'
	     'desktop-file-utils'
	     'alsa-lib'  
	     'sdl2'
             'freetype2'
	     'flac'
	     'cjson'
	     'libancient'
	     'libdiscid' 
	     'libmad'
	     'libjpeg-turbo'
	     'libpng'
	     'libvorbis'
	     'ttf-unifont')


source=(${_pkgbase}::git+https://github.com/mywave82/opencubicplayer.git)
sha256sums=('SKIP')

pkgver() {
    	cd $_pkgbase
	echo "$(git describe --tags | sed 's/^v//; s/-/.r/; s/-g/./')"
}

prepare() {
	echo -e "\033[1;31m##!! NOTICE !!##\033[0m"
	echo -e "\033[0;33mStarting with ocp 0.2.103, the ocp-git package have been split into two meta packages."
	echo "Depending upon which features you use, no action will need to be taken."
	echo -e "X11/SDL2 functionality is now provided by the ocp-sdl2-git meta package.\033[0m"
	echo  "Thanks for flying ocp-git in the AUR! :)"
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

package_ocp-sdl2-git() {
	provides=(${_pkgbase}-sdl2=${pkgver})
	conflicts=('ocp' 'ocp-curses')
	install=${_pkgbase}.install	
	depends=('alsa-lib'
		 'cjson'
		 'freetype2'
		 'hicolor-icon-theme'
	   	 'sdl2'
	 	 'shared-mime-info'
	 	 'libancient'
		 'libdiscid'
		 'libjpeg-turbo' 
	 	 'libpng')
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

package_ocp-git() {
	provides=(${_pkgbase}=${pkgver}
		  ${_pkgbase}-curses=${pkgver})
	conflicts=('ocp-curses' 'ocp-sdl2')
	depends=('alsa-lib' 
                 'cjson'
		 'libancient'
		 'libdiscid')
	cd $_pkgbase
	./configure --prefix=/usr --sysconfdir=/etc  --with-builtin=core\
		    --without-x11 --without-sdl2\
		    --without-update-desktop-database\
                    --without-update-mime-database
	make DESTDIR="$pkgdir" libocp.so
	make DESTDIR="$pkgdir" install
}
