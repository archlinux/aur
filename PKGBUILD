# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: kfgz <kfgz@interia.pl>
# Mantainer: Lorenzo Ferrillo <lorenzofer at live dot it>

_basename=x265
pkgname=lib32-x265
pkgver=2.5
pkgrel=1
pkgdesc='Open Source H265/HEVC video encoder. 32bit version. Libraries only.'
arch=('x86_64')
url='https://bitbucket.org/multicoreware/x265'
license=('GPL')
depends=('gcc-libs-multilib')
makedepends=('yasm' 'cmake')
provides=('libx265.so')
source=("https://bitbucket.org/multicoreware/x265/downloads/x265_${pkgver}.tar.gz")
sha256sums=('2e53259b504a7edb9b21b9800163b1ff4c90e60c74e23e7001d423c69c5d3d17')

prepare() {
  cd x265_${pkgver}

    if [[ -d build-8 ]]; then
      rm -rf build-8
    fi
    mkdir build-8
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  
    cd x265_${pkgver}/build-8

    cmake ../source \
      -DCMAKE_INSTALL_PREFIX='/usr' \
      -DCMAKE_LIBRARY_PATH='/usr/lib32' \
      -DENABLE_SHARED='TRUE' \
      -DENABLE_HDR10_PLUS='TRUE'  -DHAVE_STRTOK_R='TRUE'
    make
}

package() {
  cd x265_${pkgver}/build-8

  make DESTDIR="${pkgdir}" install
  cd $pkgdir/usr
  rm bin include -R
  mv lib lib32
}

# vim: ts=2 sw=2 et:
