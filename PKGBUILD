# $Id$
# Maintainer: unit73e <unit73e@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: kfgz <kfgz@interia.pl>
# Contributor: Lorenzo Ferrillo <lorenzofer at live dot it>

pkgname=lib32-x265
pkgver=4.1
pkgrel=1
pkgdesc='Open Source H265/HEVC video encoder. 32bit libraries.'
arch=('x86_64')
url='https://bitbucket.org/multicoreware/x265_git'
license=('GPL')
depends=('x265' 'lib32-gcc-libs'  'lib32-libnuma')
makedepends=('cmake3-bin' 'nasm' 'git')
provides=('libx265.so')
_tag=f0c1022b6be121a753ff02853fbe33da71988656
source=("${pkgname#lib32-*}::git+https://bitbucket.org/multicoreware/x265_git.git#tag=$pkgver")
sha256sums=('a6a10ca581c13d8f43713f198ac2164d02d44b6c70ca31ec54e6bdb59410cdf5')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  warning "Using cmake3-bin temporarily until upstream compatibility is resolved."
  cmake3 -B build -S ${pkgname#lib32-*}/source \
    -DCMAKE_INSTALL_PREFIX='/usr' -DLIB_INSTALL_DIR='lib32'  \
    -DENABLE_SHARED='TRUE' \
    -DENABLE_HDR10_PLUS='TRUE' \
    -DEXTRA_LINK_FLAGS='-L .' 

  make -C build

}

package() {
  make -C build DESTDIR="${pkgdir}" install
  rm "${pkgdir}"/usr/bin  "${pkgdir}"/usr/include -Rf
}

