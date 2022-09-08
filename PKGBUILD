# Maintainer: Dominik Wetzel <dimonok at web dot de>
# Contributor: Tomasz Swiatek <https://github.com/devegoo/Traverso-DAW_PKGBUILD>
# Contributor: Lieven Moors <lievenmoors at protonmail dot com>
# Contributor: Michał Szymański <smiszym at gmail dot com>
# Contributor: rtfreedman  (rob<d0t>til<d0t>freedman<aT>googlemail<d0t>com
# Contributor: Philipp Überbacher <murks at lavabit dot com>

_pkgname=traverso
pkgname=$_pkgname-git
pkgver=traverso_0_49_1.r1354.gcdcb3b21
pkgrel=1
pkgdesc="Digital Audio Workstation with an innovative User Interface"
arch=('x86_64')
url="https://savannah.nongnu.org/projects/traverso/"
license=('GPL')
depends=('qt5-base' 'fftw' 'wavpack' 'lame' 'libmad' 'lilv' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('cmake')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://git.savannah.nongnu.org/git/traverso.git")
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${_pkgname}"
    
    mkdir -p build
}

build() {
    cd "${_pkgname}/build"
    
    cmake \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_CXX_FLAGS:STRING='-DSSE_OPTIMIZATIONS -DUSE_XMMINTRIN -DARCH_X86' \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DDETECT_HOST_CPU_FEATURES='OFF' \
        -DWANT_MP3_ENCODE='ON' \
        -DWANT_PULSEAUDIO:BOOL='ON' \
        -Wno-dev \
        ..
        
    make
}

package(){
    cd "${_pkgname}/build"
    
    make DESTDIR="$pkgdir" install
    
    cd "${srcdir}/${_pkgname}/resources"
    
    # desktop file
    install -D -m644 traverso.desktop "${pkgdir}/usr/share/applications/traverso.desktop"
    
    # icons
    install -d "${pkgdir}/usr/share/icons/hicolor"
    cp -a freedesktop/icons/* "${pkgdir}/usr/share/icons/hicolor"
    
    # mime types
    install -D -m644 x-traverso.xml "${pkgdir}/usr/share/mime/packages/x-traverso.xml"
    
    # documentation
    install -D -m644 help.text "${pkgdir}/usr/share/doc/traverso/help.txt"
} 
