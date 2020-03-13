pkgname=melissa
pkgver=0.0.0
pkgrel=1
pkgdesc="Large Scale Global Sensitivity Studies"
arch=('x86_64')
url="https://github.com/melissa-sa/melissa"
license=('BSD')
depends=('zeromq')
makedepends=('cmake')
source=("https://github.com/melissa-sa/melissa/archive/V${pkgver//./_}.tar.gz")
sha256sums=('508a873c7efde2d06d63377e525b285fbee9334746fe3d0f77ce6e6d70825dd6')

prepare() {
  cd "${srcdir}/melissa-${pkgver//./_}"
  # zeromq is built with autotools
  echo "set (ZeroMQ_LIBRARY /usr/lib/libzmq.so)" >> ZeroMQConfig.cmake
}

build() {
  cd "${srcdir}/melissa-${pkgver//./_}"
  mkdir -p build && pushd build
  cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DBUILD_TESTING=OFF -DBUILD_DOCUMENTATION=OFF -DBUILD_EXAMPLES=OFF \
      -DZeroMQ_DIR=${srcdir}/melissa-${pkgver//./_} \
      ..
  make
}

package() {
  cd "${srcdir}"/melissa-${pkgver//./_}/build
  make DESTDIR="${pkgdir}" install
  rm "${pkgdir}"/usr/bin/test_horovod.py
  rm -r "${pkgdir}"/usr/share/melissa/examples
}
