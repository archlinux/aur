# Maintainer : Daniel Bermond <dbermond@archlinux.org>

pkgname=megaglest-git
pkgver=3.13.0.r175.g8cdca11c4
pkgrel=1
pkgdesc='Fork of Glest, a 3D real-time strategy game in a fantastic world (git version)'
arch=('x86_64')
url='https://megaglest.org/'
license=('GPL3')
depends=('curl' 'xerces-c' 'sdl2' 'libvorbis' 'openal' 'libgl' 'lua51' 'icu' 'ftgl'
         'glew' 'libircclient' 'miniupnpc' 'wxgtk3' 'glu' 'libx11' 'libminiupnpc.so'
         'megaglest-data-git')
makedepends=('git' 'ftjam' 'cmake' 'mesa')
provides=('megaglest')
conflicts=('megaglest')
source=('git+https://github.com/MegaGlest/megaglest-source.git')
sha256sums=('SKIP')

pkgver() {
    git -C megaglest-source describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -B build -S megaglest-source \
       -DCMAKE_BUILD_TYPE='None' \
       -DCMAKE_INSTALL_PREFIX='/usr' \
       -DCMAKE_CXX_FLAGS="-lX11 ${CXXFLAGS}" \
       -DWANT_GIT_STAMP='0' \
       -DwxWidgets_CONFIG_EXECUTABLE='/usr/bin/wx-config-gtk3' \
       -DWANT_USE_VLC:BOOL='OFF' \
       -Wno-dev
    
    # use 'maje -j1' if xvfb is installed on your system to prevent errors (will build manpages)
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
}
