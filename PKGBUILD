# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=megaglest-git
pkgver=3.13.0.r433.gf27cfa119
pkgrel=1
pkgdesc='Fork of Glest, a 3D real-time strategy game in a fantastic world (git version)'
arch=('x86_64')
url='https://megaglest.org/'
license=('GPL-3.0-or-later')
depends=(
    'curl'
    'fontconfig'
    'fribidi'
    'ftgl'
    'glibc'
    'glu'
    'megaglest-data-git'
    'libgcc'
    'libgl'
    'libircclient'
    'libjpeg'
    'libpng'
    'libstdc++'
    'libvorbis'
    'libx11'
    'lua51'
    'miniupnpc'
    'openal'
    'sdl2'
    'sh'
    'wxwidgets-common'
    'wxwidgets-gtk3')
makedepends=(
    'cmake'
    'help2man'
    'git'
    'mesa')
provides=('megaglest')
conflicts=('megaglest')
source=('git+https://github.com/MegaGlest/megaglest-source.git')
sha256sums=('SKIP')

pkgver() {
    git -C megaglest-source describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -B build -S megaglest-source \
       -G 'Unix Makefiles' \
       -DCMAKE_BUILD_TYPE='None' \
       -DCMAKE_INSTALL_PREFIX='/usr' \
       -DwxWidgets_CONFIG_EXECUTABLE='/usr/bin/wx-config' \
       -Wno-dev
    
    # use '-j1' if xvfb is installed on your system to prevent errors (will build manpages)
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
