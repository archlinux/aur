# Maintainer : Daniel Bermond <dbermond@archlinux.org>

pkgname=x265-git
pkgver=3.5.r103.g34532bda1
pkgrel=1
pkgdesc='Open source H.265/HEVC video encoder (git version)'
arch=('x86_64')
url='https://bitbucket.org/multicoreware/x265_git'
license=('GPL')
depends=('gcc-libs')
makedepends=('git' 'cmake' 'nasm')
provides=('x265' 'libx265.so')
conflicts=('x265')
source=('git+https://bitbucket.org/multicoreware/x265_git.git')
sha256sums=('SKIP')

pkgver() {
    git -C x265_git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -S x265_git/source -B build-12 \
        -G 'Unix Makefiles' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DHIGH_BIT_DEPTH='ON' \
        -DMAIN12='ON' \
        -DEXPORT_C_API='OFF' \
        -DENABLE_CLI='OFF' \
        -DENABLE_SHARED='OFF' \
        -DCMAKE_ASM_NASM_FLAGS='-w-macro-params-legacy' \
        -Wno-dev
    cmake --build build-12
    
    cmake -S x265_git/source -B build-10 \
        -G 'Unix Makefiles' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DHIGH_BIT_DEPTH='ON' \
        -DEXPORT_C_API='OFF' \
        -DENABLE_CLI='OFF' \
        -DENABLE_SHARED='OFF' \
        -DCMAKE_ASM_NASM_FLAGS='-w-macro-params-legacy' \
        -Wno-dev
    cmake --build build-10
    
    cmake -S x265_git/source -B build \
        -G 'Unix Makefiles' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DENABLE_SHARED='ON' \
        -DENABLE_HDR10_PLUS='ON' \
        -DEXTRA_LIB='x265_main10.a;x265_main12.a' \
        -DEXTRA_LINK_FLAGS='-L.' \
        -DLINKED_10BIT='ON' \
        -DLINKED_12BIT='ON' \
        -DCMAKE_ASM_NASM_FLAGS='-w-macro-params-legacy' \
        -Wno-dev
    ln -s ../build-10/libx265.a build/libx265_main10.a
    ln -s ../build-12/libx265.a build/libx265_main12.a
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
