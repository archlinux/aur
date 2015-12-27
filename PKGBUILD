# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

# Ut Video Compiled from Git repository with assembly optimizations. Static library only.

pkgname=libutvideo-asm-git
pkgver=v14.2.0.r69.g36eb60c
pkgrel=1
pkgdesc="A  lossless video codec (Git version, static lib only with asm optimizations)"
arch=('i686' 'x86_64')
url="http://umezawa.dyndns.info/wordpress/"
license=('GPL')
makedepends=('git' 'nasm')
provides=('libutvideo' 'libutvideo-git' 'utvideo' 'utvideo-git' 'libutvideo.a')
conflicts=('libutvideo' 'libutvideo-git' 'utvideo' 'utvideo-git')
options=('staticlibs')
source=("$pkgname"::'git+https://github.com/qyot27/libutvideo.git')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

        # Git, tags available
	printf "%s" "$(git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"

}

build() {
	cd "${srcdir}/${pkgname}"
	
	
	# Detect architecture to set correct assembly optimizations
	_arch=`uname -m`

        if [ "$_arch" == "x86_64" ]; then
            _asmopt="--enable-asm=x64"
            
        elif [ "$_arch" == "i686" ]; then
            _asmopt="--enable-asm=x86"
            
        else
            _asmopt=""
        
        fi
	
	
	./configure \
                --enable-pic \
                "$_asmopt"
	
	make
}

package() {
	cd "${srcdir}/${pkgname}"
	make DESTDIR="$pkgdir/" install prefix=/usr
}
