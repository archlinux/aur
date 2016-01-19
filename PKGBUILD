# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

# Ut Video Compiled from Git repository with assembly (ASM) optimizations.
# Assembly optimizations cannot be used in Ut Video shared library and thus
# only a static library is provided in this package.

pkgname=libutvideo-asm-git
pkgver=v15.1.0.r64.g36eb60c
pkgrel=1
pkgdesc="A  lossless video codec (Git version with ASM optimizations)"
arch=('i686' 'x86_64')
url="http://umezawa.dyndns.info/wordpress/"
license=('GPL')
makedepends=('git' 'nasm')
provides=('libutvideo' 'libutvideo-git' 'libutvideo.a')
conflicts=('libutvideo' 'libutvideo-git')
options=('staticlibs')
source=("$pkgname"::'git+https://github.com/qyot27/libutvideo.git')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

        # Git, tags available
        # Using the most recent un-annotated tag reachable from the last commit: 
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'

}

build() {
	cd "${srcdir}/${pkgname}"
		
	# Set correct assembly optimizations according to target architecture

        if [ "$CARCH" == "x86_64" ]; then
            _asmopt="--enable-asm=x64"
            
        elif [ "$CARCH" == "i686" ]; then
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
