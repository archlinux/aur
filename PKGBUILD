# Maintainer : Daniel Bermond < gmail-com: danielbermond >

# NOTE:
# 10-bit depth currently fails to build
# https://github.com/pkuvcl/davs2/issues/4

pkgname=davs2
pkgver=1.0
pkgrel=4
arch=('i686' 'x86_64')
pkgdesc='Open-Source encoder of AVS2-P2/IEEE1857.4 video coding standard'
url='https://github.com/pkuvcl/davs2/'
license=('GPL')
depends=('glibc' 'liblsmash.so')
makedepends=('gcc7' 'yasm' 'l-smash')
provides=('libdavs2')
conflicts=('libdavs2')
replaces=('libdavs2')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/pkuvcl/${pkgname}/archive/${pkgver}.tar.gz"
        'davs2-1.0-add-linux-support.patch')
sha256sums=('1b8bd800f7c4d63e904a4355de0144c55d427d3f1477064b53de1c3e028d9eaa'
            '66166908defadbac7bbaab44a2eaab09af9f6b9ad37c035772e32a6a09c0b605')

prepare() {
    cd "${pkgname}-${pkgver}"
    
    # add linux support
    sed -i $'s/\r$//' source/common/vec/intrinsic_sao_avx2.cc
    patch -Np1 -i "${srcdir}/davs2-1.0-add-linux-support.patch"
    
    # use gcc7 (it does not build with gcc8)
    sed -i 's/g++/g++-7/' build/linux/configure
    
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
