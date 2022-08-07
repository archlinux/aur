# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=mavlink
pkgver=1.0.12
pkgdesc="Marshalling / communication library for drones."
url='https://mavlink.io'
arch=('i686' 'x86_64')
pkgrel=2
license=('GPLv3')
makedepends=('cmake')
depends=('python' 'python-future' 'python-pymavlink')
optdepends=()
source=("${pkgname}-${pkgver}::git+https://github.com/mavlink/mavlink.git#tag=${pkgver}"
        "${pkgname}-pymavlink::git+https://github.com/ardupilot/pymavlink.git")
sha256sums=('SKIP'
            'SKIP')

prepare() {
  cd "$srcdir/${pkgname}-${pkgver}"

  git submodule init
  git config submodule."pymavlink".url "${srcdir}/${pkgname}"-pymavlink
  git submodule update --init --recursive
}

build() {
  mkdir -p ${srcdir}/${pkgname}-${pkgver}/build
  cd ${srcdir}/${pkgname}-${pkgver}/build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_BUILD_TYPE="Release"

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}/" install
}
