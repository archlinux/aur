# Maintainer : Daniel Bermond < gmail-com: danielbermond >

# NOTE:
# 10-bit depth currently fails to build
# https://github.com/pkuvcl/xavs2/issues/9

pkgname=xavs2
pkgver=1.0
pkgrel=4
arch=('i686' 'x86_64')
pkgdesc='Open-Source encoder of AVS2-P2/IEEE1857.4 video coding standard'
url='https://github.com/pkuvcl/xavs2/'
license=('GPL')
depends=('glibc' 'liblsmash.so')
makedepends=('gcc7' 'yasm' 'l-smash')
provides=('libxavs2')
conflicts=('libxavs2')
replaces=('libxavs2')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/pkuvcl/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('0e7f682ad20dc783864ff0c483d03b2fbcd70d2fbd098e18c8d06ab6341da71d')

prepare() {
    cd "${pkgname}-${pkgver}"
    
    # use gcc7 (it does not build with gcc8)
    sed -i 's/gcc/gcc-7/' build/linux/configure
    
    # must copy the entire source tree or it will not work
    cd "$srcdir"
    cp -af "${pkgname}-${pkgver}" build-8bit
}

build() {
    cd build-8bit/build/linux
    
    ./configure \
        --prefix='/usr' \
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
    make -C build-8bit/build/linux DESTDIR="$pkgdir" install-cli install-lib-shared
}
