#Maintainer: lubosz <lubosz@gmail.com>

pkgname=freeimage-qt-git
pkgver=20101223
pkgrel=1
pkgdesc="FreeImage patched to be linkable against Qt"
arch=(i686 x86_64)
url="http://freeimage.sourceforge.net/"
license=('GPL')
depends=('gcc-libs')
provides=('freeimage')
conflicts=('freeimage')
_gitroot="git://github.com/lubosz/FreeImage.git"
_gitname="FreeImage"

build() {
  cd ${srcdir}/
    
    msg "Connecting to the GIT server...."
    if [[ -d ${srcdir}/${_gitname} ]] ; then
    	cd ${_gitname}
    	git pull origin
    	msg "The local files are updated..."
    else
    	git clone ${_gitroot}
    fi
    
    msg "GIT checkout done."

    msg "Starting make for: ${pkgname}"
    
    if [[ -d ${srcdir}/${_gitname}-build ]]; then
       msg "Cleaning the previous build directory..." 
       rm -rf ${srcdir}/${_gitname}-build
    fi

    git clone ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build
    
    cd ${srcdir}/${_gitname}-build
        
    msg "Starting build"
    
    make || return 1
	make DESTDIR="$pkgdir/" install || return 1
  
	make -f Makefile.fip || return 1
	make -f Makefile.fip DESTDIR="$pkgdir/" install || return 1

}
