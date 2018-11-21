# Maintainer : Daniel Bermond < gmail-com: danielbermond >

# NOTE:
# 10-bit depth currently fails to build
# https://github.com/pkuvcl/xavs2/issues/9

pkgname=xavs2
pkgver=1.2
pkgrel=3
arch=('i686' 'x86_64')
pkgdesc='Open-Source encoder of AVS2-P2/IEEE1857.4 video coding standard'
url='https://github.com/pkuvcl/xavs2/'
license=('GPL')
depends=('glibc' 'liblsmash.so')
makedepends=('gcc7' 'yasm' 'l-smash')
provides=('libxavs2')
conflicts=('libxavs2')
replaces=('libxavs2')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/pkuvcl/${pkgname}/archive/${pkgver}.tar.gz"
        'xavs2-1.2-gcc8-fix.patch')
sha256sums=('8b985aeb4d5f60b5d8bc9a5e3897f2f4c5ed6546d48f06f87828ee12f6125a5f'
            '5de344631d212d2d256d9bcad05e4fd7a08701ed6e0017460fa86e6d23a1e25b')

prepare() {
    cd "${pkgname}-${pkgver}"
    
    patch --binary -Np1 -i "${srcdir}/xavs2-1.2-gcc8-fix.patch"
}

build() {
    cd "${pkgname}-${pkgver}/build/linux"
    
    ./configure \
        --prefix='/usr' \
        --extra-ldflags='-Wl,-z,noexecstack' \
        --enable-shared \
        --bit-depth='8' \
        --chroma-format='all' \
        --enable-lto \
        --enable-pic \
        --disable-swscale \
        --disable-lavf \
        --disable-ffms \
        --disable-gpac
        
    make
}

package() {
    make -C "${pkgname}-${pkgver}/build/linux" DESTDIR="$pkgdir" install-cli install-lib-shared
}
