# Maintainer : Daniel Bermond < gmail-com: danielbermond >

# NOTE:
# 10-bit depth currently fails to build
# https://github.com/pkuvcl/davs2/issues/4

pkgname=davs2-git
_srcname=davs2
pkgver=1.6.r0.gef9a901
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='Open-Source decoder of AVS2-P2/IEEE1857.4 video coding standard (git version)'
url='https://github.com/pkuvcl/davs2/'
license=('GPL')
depends=('glibc')
makedepends=('git' 'gcc7' 'yasm')
provides=('davs2' 'libdavs2-git')
conflicts=('davs2' 'libdavs2-git')
replaces=('libdavs2-git')
source=('git+https://github.com/pkuvcl/davs2.git')
sha256sums=('SKIP')

prepare() {
    cd "$_srcname"
    
    # use gcc7 (it does not build with gcc8)
    sed -i 's/g++/g++-7/' build/linux/configure
}

pkgver() {
    cd "$_srcname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "${_srcname}/build/linux"
    
    ./configure \
        --prefix='/usr' \
        --enable-shared \
        --disable-static \
        --bit-depth='8' \
        --chroma-format='all' \
        --enable-lto \
        --enable-pic
        
    make
}

package() {
    make -C "${_srcname}/build/linux" DESTDIR="$pkgdir" install-cli install-lib-shared
}
