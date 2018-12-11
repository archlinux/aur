# Maintainer: Javier Tiá <javier.tia at gmail dot com>

pkgname=lib32-libtins
pkgver=4.1
pkgrel=1
pkgdesc="A high-level, multiplatform C++ network packet sniffing and crafting library (32-bit) version"
arch=('x86_64')
url="http://libtins.github.io/"
license=('BSD')
depends=('lib32-libpcap' 'lib32-openssl' 'libtins')
makedepends=('cmake')
options=('!libtool')
source=(
  "https://github.com/mfontanini/libtins/archive/v${pkgver}.tar.gz"
  "0001-Set-where-find-and-install-32-bits-libraries.patch"
)

sha256sums=('81a0ae1e04499b25984b2833579d33c4a78ff4513e9a14176c574e855163f7a5'
            'df7f2f7fd956e91b5feaa825562db4212c727fe836fe29abdcae0ed549c6c7b5')

prepare() {
  cd "${srcdir}"/libtins-${pkgver}
  mkdir build
  patch -Np1 -i ${srcdir}/${source[1]}
}

build() {
  cd "${srcdir}"/libtins-${pkgver}/build
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  cmake -D CMAKE_BUILD_TYPE=Release -D LIBTINS_ENABLE_CXX11=yes \
        -D CMAKE_INSTALL_PREFIX=/usr ../
  make
}

package() {
  cd "${srcdir}"/libtins-${pkgver}/build
  make DESTDIR="${pkgdir}" install
  rm -R "${pkgdir}"/usr/{CMake,include}/
}

# vim:set ts=2 sw=2 et:
