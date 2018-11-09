# Maintainer : Daniel Bermond < gmail-com: danielbermond >

# NOTE:
# 10-bit depth currently fails to build
# https://github.com/pkuvcl/davs2/issues/4

pkgname=davs2-git
_srcname=davs2
pkgver=1.0.r139.gd997b79
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc='Open-Source decoder of AVS2-P2/IEEE1857.4 video coding standard (git version)'
url='https://github.com/pkuvcl/davs2/'
license=('GPL')
depends=('glibc' 'liblsmash.so')
makedepends=('git' 'gcc7' 'yasm' 'l-smash')
provides=('davs2' 'libdavs2-git')
conflicts=('davs2' 'libdavs2-git')
replaces=('libdavs2-git')
source=('git+https://github.com/pkuvcl/davs2.git')
sha256sums=('SKIP')

prepare() {
    cd "$_srcname"
    
    # use gcc7 (it does not build with gcc8)
    sed -i 's/g++/g++-7/' build/linux/configure
    
    # must copy the entire source tree or it will not work
    cd "$srcdir"
    cp -af "$_srcname" build-8bit
}

pkgver() {
    cd "$_srcname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
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
