# Maintainer: Daniel Bermond <dbermond@archlinux.org>

# NOTE:
# 10-bit depth is not supported currently
# https://github.com/pkuvcl/davs2/blob/1.7/build/linux/configure#L470

pkgname=davs2-git
pkgver=1.7.r0.gb06d758
pkgrel=1
arch=('x86_64')
pkgdesc='Open-Source decoder of AVS2-P2/IEEE1857.4 video coding standard (git version)'
url='https://github.com/pkuvcl/davs2/'
license=('GPL')
depends=('glibc')
makedepends=('git' 'nasm')
provides=('davs2' 'libdavs2-git')
conflicts=('davs2' 'libdavs2-git')
replaces=('libdavs2-git')
options=('!lto')
source=('git+https://github.com/pkuvcl/davs2.git')
sha256sums=('SKIP')

pkgver() {
    git -C davs2 describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd davs2/build/linux
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
    make -C davs2/build/linux DESTDIR="$pkgdir" install-cli install-lib-shared
}
