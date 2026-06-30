# Maintainer: Daniel Bermond <dbermond@archlinux.org>

# NOTE:
# 10-bit depth is not supported currently
# https://github.com/pkuvcl/davs2/blob/1.7/build/linux/configure#L470

_pkgname=davs2
pkgname=${_pkgname}-llvm
pkgver=1.7
pkgrel=1
arch=('x86_64')
pkgdesc='Open-Source decoder of AVS2-P2/IEEE1857.4 video coding standard — built with Clang and LLVM lld'
url='https://github.com/pkuvcl/davs2/'
license=('GPL')
depends=('glibc')
makedepends=('nasm' 'clang' 'lld' 'llvm')
provides=('davs2' 'libdavs2')
conflicts=('davs2' 'libdavs2')
replaces=('libdavs2')
options=('!lto')
source=("https://github.com/pkuvcl/davs2/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('b697d0b376a1c7f7eda3a4cc6d29707c8154c4774358303653f0a9727f923cc8')

build() {
    cd "${_pkgname}-${pkgver}/build/linux"
    export CC=clang++
    export CXX=clang++
    export AR=llvm-ar
    export RANLIB=/usr/bin/llvm-ranlib
    export LD='clang++ -o '
    export NM=/usr/bin/llvm-nm
    export OBJCOPY=/usr/bin/llvm-objcopy
    export OBJDUMP=/usr/bin/llvm-objdump
    export READELF=/usr/bin/llvm-readelf
    export STRIP=/usr/bin/llvm-strip
    export LDFLAGS="${LDFLAGS:-} -fuse-ld=lld"
    export CFLAGS="${CFLAGS:-} -O3 -march=native"
    export CXXFLAGS="${CXXFLAGS:-} -O3 -march=native"
    ./configure \
        --prefix='/usr' \
        --enable-shared \
        --disable-static \
        --bit-depth='8' \
        --chroma-format='all' \
        --enable-pic
    make
}

package() {
    make -C "${_pkgname}-${pkgver}/build/linux" DESTDIR="$pkgdir" install-cli install-lib-shared
}
