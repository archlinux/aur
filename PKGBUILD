# Maintainer : Daniel Bermond < gmail-com: danielbermond >

# NOTE:
# 10-bit depth currently fails to build
# https://github.com/pkuvcl/xavs2/issues/9

pkgname=xavs2-git
_srcname=xavs2
pkgver=1.3.r52.geae1e8b
pkgrel=1
arch=('x86_64')
pkgdesc='Open-Source encoder of AVS2-P2/IEEE1857.4 video coding standard (git version)'
url='https://github.com/pkuvcl/xavs2/'
license=('GPL')
depends=('glibc' 'liblsmash.so')
makedepends=('git' 'nasm' 'l-smash')
provides=('xavs2' 'libxavs2-git')
conflicts=('xavs2' 'libxavs2-git')
replaces=('libxavs2-git')
source=('git+https://github.com/pkuvcl/xavs2.git')
sha256sums=('SKIP')

pkgver() {
    cd "$_srcname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "${_srcname}/build/linux"
    
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
    make -C "${_srcname}/build/linux" DESTDIR="$pkgdir" install-cli install-lib-shared
}
