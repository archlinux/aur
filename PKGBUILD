# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Based on vice-svn PKGBUILD by Benjamin Hodgetts <ben@xnode.org>

pkgname=vice-sdl2-svn
_pkgname=vice-svn
pkgver=r40400
pkgrel=1
pkgdesc="The Versatile Commodore Emulator 8-bits (PET/C64/C128/Plus4/Vic20) - SDL2 development version"
arch=('i686' 'x86_64')
url="http://vice-emu.sourceforge.net"
license=('GPL')
depends=(alsa-lib libpulse sdl2_image portaudio pciutils)
makedepends=(dos2unix ffmpeg libpcap libxaw texlive-bin texlive-core xa xorg-bdftopcf xorg-mkfontdir python clang llvm)
provides=('vice')
replaces=('vice')
conflicts=('vice' 'vice-svn')
source=("${_pkgname}::svn://svn.code.sf.net/p/vice-emu/code/trunk")
sha256sums=('SKIP')

pkgver() {
    echo r$(svnversion "${SRCDEST}"/${_pkgname}/)
}

build() {
    cd "${_pkgname}/vice"
    
    #Using clang instead of gcc to workaround https://sourceforge.net/p/vice-emu/bugs/1503/
    export CC=clang
    export CXX=clang++
    export AR=llvm-ar
    export NM=llvm-nm
    export RANLIB=llvm-ranlib
    
    ./autogen.sh
    ./configure --prefix=/usr --libdir=/usr/lib  --enable-external-ffmpeg --enable-sdlui2
    make
}

package() {
    cd "${_pkgname}/vice"
    make install DESTDIR="${pkgdir}/"
}
