# Maintainer: Daniel Bermond <dbermond@archlinux.org>

# NOTE:
# 10-bit depth is not supported currently
# https://github.com/pkuvcl/xavs2/blob/1.4/build/linux/configure#L500

_pkgname=xavs2
pkgname=${_pkgname}-llvm
pkgver=1.4
pkgrel=3
arch=('x86_64')
pkgdesc='Open-Source encoder of AVS2-P2/IEEE1857.4 video coding standard — built with Clang and LLVM lld'
url='https://github.com/pkuvcl/xavs2/'
license=('GPL-2.0-or-later')
depends=('glibc' 'liblsmash.so')
makedepends=('nasm' 'l-smash' 'clang' 'lld' 'llvm')
provides=('xavs2' 'libxavs2')
conflicts=('xavs2' 'libxavs2')
replaces=('libxavs2')
source=("https://github.com/pkuvcl/xavs2/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        '010-xavs2-lto-configure.patch')
sha256sums=('1e6d731cd64cb2a8940a0a3fd24f9c2ac3bb39357d802432a47bc20bad52c6ce'
            '52dfd415fa2812aab8b366253fa5e7c1989533463df359c222b771b9e120fdc9')

prepare() {
    patch -d "${_pkgname}-${pkgver}" -Np1 -i "${srcdir}/010-xavs2-lto-configure.patch"
}

build() {
    cd "${_pkgname}-${pkgver}/build/linux"
    export CC=clang
    export CXX=clang++
    export AR=llvm-ar
    export RANLIB=/usr/bin/llvm-ranlib
    export LD='clang -o '
    export NM=/usr/bin/llvm-nm
    export OBJCOPY=/usr/bin/llvm-objcopy
    export OBJDUMP=/usr/bin/llvm-objdump
    export READELF=/usr/bin/llvm-readelf
    export STRIP=/usr/bin/llvm-strip
    export LDFLAGS="${LDFLAGS:-} -fuse-ld=lld"
    export CFLAGS="${CFLAGS:-} -O3 -march=native -Wno-incompatible-pointer-types"
    export CXXFLAGS="${CXXFLAGS:-} -O3 -march=native"

    ./configure \
        --prefix='/usr' \
        --enable-shared \
        --bit-depth='8' \
        --chroma-format='all' \
        --enable-pic \
        --disable-swscale \
        --disable-lavf \
        --disable-ffms \
        --disable-gpac
    make
}

package() {
    make -C "${_pkgname}-${pkgver}/build/linux" DESTDIR="$pkgdir" install-cli install-lib-shared
}
