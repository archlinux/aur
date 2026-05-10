# Maintainer: Jacob Ledbetter <jledbetter460@gmail.com>
# Contributor: Daniel Bermond <dbermond@archlinux.org>

pkgname=rockchip-mpp-llvm
pkgver=1.0.11
pkgrel=2
epoch=1
pkgdesc='Rockchip Media Process Platform (MPP) — built with Clang and LLVM lld'
arch=('x86_64')
# https://github.com/HermanChen/mpp/issues/71
# https://github.com/HermanChen/mpp/issues/73
#url='https://github.com/rockchip-linux/mpp/'
url='https://github.com/HermanChen/mpp/'
license=('Apache-2.0' 'MIT')
depends=(
    'gcc-libs'
    'glibc')
makedepends=(
    'clang'
    'cmake'
    'lld'
    'llvm')
provides=('rockchip-mpp')
conflicts=('rockchip-mpp')
source=("https://github.com/HermanChen/mpp/archive/${pkgver}/rockchip-mpp-HermanChen-${pkgver}.tar.gz")
sha256sums=('e97f67e0d2e028ef444099443b6e77efea9f7db83edcbf080f539a44c1c2d36c')

build() {
    # fix build with gcc 15
    export CFLAGS+=' -Wno-error=incompatible-pointer-types'
    export CC=clang
    export CXX=clang++

    cmake -B build -S "mpp-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_STRIP:PATH='/usr/bin/strip' \
        -DCMAKE_EXE_LINKER_FLAGS="-fuse-ld=lld" \
        -DCMAKE_SHARED_LINKER_FLAGS="-fuse-ld=lld" \
        -DENABLE_VPROC_VDPP:BOOL='ON' \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 "mpp-${pkgver}/LICENSES/MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
