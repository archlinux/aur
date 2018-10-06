# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Thomas Ascher <thomas.ascher@gmx.at>

pkgname=yafaray
pkgver=3.3.0
pkgrel=2
pkgdesc="A free open-source montecarlo raytracing engine"
arch=('i686' 'x86_64')
url="http://yafaray.org/"
license=('LGPL2.1')
depends=('boost-libs' 'opencv' 'qt4')
optdepends=('python: For Python bindings'
            'ruby: For Ruby bindings')
makedepends=('cmake' 'boost' 'swig' 'python' 'ruby')
source=("https://github.com/YafaRay/Core/archive/v${pkgver}.tar.gz"
        "ruby-archhdrdir.patch")
md5sums=('ef9b9de4f4aba8588ee00e294c32b0a6'
         'e403c2aa8860e6d55629f9cb3dc150d8')

prepare() {
  cd "${srcdir}/Core-${pkgver}"

  patch -Np1 < "${srcdir}/ruby-archhdrdir.patch"
}

build() {
  cd "${srcdir}/Core-${pkgver}"

  mkdir -p build
  cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_QT=ON \
    -DYAF_PY_VERSION=3.7 \
    -DYAF_BINDINGS_PY_DIR=/usr/lib/python3.7/site-packages \
    -DWITH_YAF_RUBY_BINDINGS=ON \
    -DYAF_BINDINGS_RUBY_DIR="$(ruby -e 'print RbConfig::CONFIG["vendorarchdir"]')" ..
  make
}

package() {
  cd "${srcdir}/Core-${pkgver}/build"

  make DESTDIR="${pkgdir}" install
}

