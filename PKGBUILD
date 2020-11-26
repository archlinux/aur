# Maintainer: David P. <megver83@parabola.nu>

pkgname=liblinphone
pkgver=4.4.11
pkgrel=1
pkgdesc='A high-level SIP library'
arch=(x86_64 i686)
url='http://www.linphone.org'
license=('GPL')
depends=(belcard belle-sip mediastreamer xerces-c lime)
makedepends=(cmake doxygen graphviz python-pystache python-sphinx xsd)
source=("https://gitlab.linphone.org/BC/public/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('cf4d83254edde9baaea9f46907830de4880f69e1fc670fba76e546134311dc25')

build() {
  cd "$pkgname-$pkgver"
  CXXFLAGS+=" -Wno-deprecated -Wimplicit-fallthrough=0 -Wno-unused-function"

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DENABLE_STATIC=NO \
        -DENABLE_CXX_WRAPPER=YES \
        -DENABLE_DOC=NO \
        -DENABLE_LIME=YES \
        -DENABLE_UNIT_TESTS=NO \
        -DENABLE_STRICT=NO \
        -DCMAKE_INSTALL_RPATH=NO .
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  sed -i "${srcdir//\//\\/}\/$pkgname-$pkgver\/wrappers\/cpp\/include/d" \
         "$pkgdir/usr/share/LinphoneCxx/cmake/LinphoneCxxConfig.cmake"
}
