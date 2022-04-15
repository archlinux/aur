# Maintainer: Daniel Bermond <dbermond@archlinux.org>

# NOTE:
# 10-bit depth is not supported currently
# https://github.com/pkuvcl/xavs2/blob/1.4/build/linux/configure#L500

pkgname=xavs2-git
pkgver=1.4.r0.geae1e8b
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
options=('!lto')
source=('git+https://github.com/pkuvcl/xavs2.git')
sha256sums=('SKIP')

pkgver() {
    git -C xavs2 describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd xavs2/build/linux
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
    make -C xavs2/build/linux DESTDIR="$pkgdir" install-cli install-lib-shared
}
