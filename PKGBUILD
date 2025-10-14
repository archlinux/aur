# Maintainer: Dominik Wetzel <dimonok at web dot de>
# Contributor: Tomasz Swiatek <https://github.com/devegoo/Traverso-DAW_PKGBUILD>
# Contributor: Lieven Moors <lievenmoors at protonmail dot com>
# Contributor: Michał Szymański <smiszym at gmail dot com>
# Contributor: rtfreedman  (rob<d0t>til<d0t>freedman<aT>googlemail<d0t>com
# Contributor: Philipp Überbacher <murks at lavabit dot com>

_pkgname=traverso
pkgname=$_pkgname-git
pkgver=r3909.f347176
pkgrel=1
pkgdesc="Digital Audio Workstation with an innovative User Interface"
arch=('x86_64')
url="https://savannah.gnu.org/projects/traverso/"
license=('GPL')
depends=('qt6-base' 'fftw' 'wavpack' 'lame' 'libmad' 'lilv' 'hicolor-icon-theme' 'desktop-file-utils')
optdepends=('qt5-base: Can be used with qt5 (should be changed in PKGBUILD if you which to use it)')
makedepends=('cmake')
source=("git+https://https.git.savannah.gnu.org/git/traverso.git")
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
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
