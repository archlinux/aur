# Maintainer : Daniel Bermond < gmail-com: danielbermond >

pkgname=megaglest-git
_srcname=megaglest-source
pkgver=3.13.0.r103.gaec1e6d41
pkgrel=1
pkgdesc='Fork of Glest, a 3D real-time strategy game in a fantastic world (git version)'
arch=('i686' 'x86_64')
url='https://megaglest.org/'
license=('GPL3')
depends=(
    # official repositories:
        'curl' 'xerces-c' 'sdl2' 'libvorbis' 'openal' 'libgl' 'lua51' 'icu' 'ftgl'
        'glew' 'libircclient' 'miniupnpc' 'wxgtk3' 'glu' 'libx11' 'libminiupnpc.so'
    # AUR:
        'megaglest-data-git'
)
makedepends=('git' 'ftjam' 'cmake' 'mesa')
provides=('megaglest')
conflicts=('megaglest')
source=('git+https://github.com/MegaGlest/megaglest-source.git')
sha256sums=('SKIP')

prepare() {
    cd "$_srcname"
    
    mkdir -p build
}

pkgver() {
    cd "$_srcname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    # - SSE is available only from Pentium 3 onwards (i686 is way older)
    # - SSE and SSE2 are availabe on all x86_64 CPUs
    [ "$CARCH" = 'i686'   ] && local _sse='0'
    [ "$CARCH" = 'x86_64' ] && local _sse='2' # (supported: 0-3)
    
    cd "${_srcname}/build"
    
    cmake .. \
       -DCMAKE_INSTALL_PREFIX='/usr' \
       -DCMAKE_BUILD_TYPE='Release' \
       -DCMAKE_CXX_FLAGS="-lX11 ${CXXFLAGS}" \
       -DWANT_GIT_STAMP='0' \
       -DwxWidgets_CONFIG_EXECUTABLE='/usr/bin/wx-config-gtk3' \
       -DWANT_USE_VLC:BOOL='OFF' \
        -Wno-dev \
        ..
        
    # use 'maje -j1' if xvfb is installed on your system to prevent errors (will build manpages)
    make
}

package() {
    cd "${_srcname}/build"
    
    make DESTDIR="$pkgdir" install
}
