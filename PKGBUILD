# Maintainer: Javier Tia <javier.tia at gmail dot com>

pkgname=lib32-libtins
pkgver=3.2
pkgrel=1
pkgdesc="32-bit A high-level, multiplatform C++ network packet sniffing and crafting library"
arch=('x86_64')
url="http://libtins.github.io/"
license=('BSD')
depends=('lib32-libpcap' 'lib32-openssl' 'libtins')
makedepends=('cmake')
options=('!libtool')
source=(
  "https://github.com/mfontanini/libtins/archive/v${pkgver}.tar.gz"
  "Set-where-find-and-install-32-bits-libraries.patch"
)

sha256sums=(
  '7f11c8b6c33574fcc48a5310557320d7eff7216d28e6f7062ea3e4745f2ce4fc'
  '97d41800372ebf25dff241fb84c58e1d798cc9fc16c17b0e528a5f28efcfd99d'
)

prepare() {
  cd "${srcdir}"/libtins-${pkgver}
  mkdir build
  patch -Np1 -i ${srcdir}/Set-where-find-and-install-32-bits-libraries.patch
}

build() {
  cd "${srcdir}"/libtins-${pkgver}/build
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  cmake -D CMAKE_BUILD_TYPE=Release -D LIBTINS_ENABLE_CXX11=yes \
        -D CMAKE_INSTALL_PREFIX=/usr ../
  make -j8
}

package() {
  cd "${srcdir}"/libtins-${pkgver}/build
  make DESTDIR="${pkgdir}" install
  rm -R "${pkgdir}"/usr/{CMake,include}/
}

