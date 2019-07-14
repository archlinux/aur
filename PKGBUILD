# Maintainer : Daniel Bermond < gmail-com: danielbermond >

# NOTE:
# 10-bit depth currently fails to build
# https://github.com/pkuvcl/xavs2/issues/9

pkgname=xavs2
pkgver=1.3
pkgrel=2
arch=('x86_64')
pkgdesc='Open-Source encoder of AVS2-P2/IEEE1857.4 video coding standard'
url='https://github.com/pkuvcl/xavs2/'
license=('GPL')
depends=('glibc' 'liblsmash.so')
makedepends=('yasm' 'l-smash')
provides=('libxavs2')
conflicts=('libxavs2')
replaces=('libxavs2')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/pkuvcl/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('28f9204dc9384336de7c6210cd3317d2d6b94ec23a4d1b6113fcbe7f00d7230b')

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
