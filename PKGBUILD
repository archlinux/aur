# Maintainer: Kef Schecter <furrykef@gmail.com>
# Contributor: Mr.Smith1974

pkgname=cytopia-git
pkgver=r2838.2c670ec2
pkgrel=1
pkgdesc='A city building simulation game'
arch=('x86_64')
url='https://www.cytopia.net/'
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc' 'libnoise' 'sdl2' 'sdl2_image' 'sdl2_ttf' 'zlib')
makedepends=('git' 'cmake')
source=('git+https://github.com/CytopiaTeam/Cytopia.git')
sha256sums=('SKIP')

pkgver() {
    cd Cytopia
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd Cytopia
    mkdir -p build
    cd build

    ### NOTE
    # In the future we should use CMAKE_INSTALL_PREFIX=/usr
    # However, as of 2024-04-16, this does not work as expected.
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/opt/cytopia \
        -DCMAKE_BUILD_TYPE=Release \
        -Wno-dev
    cmake --build .
}

check() {
    cd Cytopia/build
    ctest
}

package() {
    cd Cytopia/build
    DESTDIR="$pkgdir" cmake --build . --target install

    ### REMOVE next line once installing to /usr works correctly
    mkdir -p "$pkgdir/usr/bin"
    ln -sf /opt/cytopia/Cytopia "$pkgdir/usr/bin/cytopia"
}

