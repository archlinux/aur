# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: David P. <megver83@parabola.nu>

pkgname=liblinphone
pkgver=5.1.71
pkgrel=2
pkgdesc='A high-level SIP library'
arch=(x86_64)
url='http://www.linphone.org'
license=('GPL')
depends=(belcard belle-sip jsoncpp-cmake mediastreamer xerces-c lime)
makedepends=(cmake doxygen graphviz python-pystache python-sphinx xsd)
source=("https://gitlab.linphone.org/BC/public/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('12d8ad934bd7a0fc13bf314ddd077fcd1d66193d8e5dfba03df1cd7954c689b6')

build() {
  CXXFLAGS+=" -Wno-deprecated -Wimplicit-fallthrough=0 -Wno-unused-function"

  cmake -B build -S "${pkgname}-${pkgver}"\
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DENABLE_STATIC=NO \
        -DENABLE_CXX_WRAPPER=YES \
        -DENABLE_DOC=NO \
        -DENABLE_LIME=NO \
        -DENABLE_LIME_X3DH=YES \
        -DENABLE_UNIT_TESTS=NO \
        -DENABLE_STRICT=NO \
        -DCMAKE_INSTALL_RPATH=NO
  cmake --build build 
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  sed -i "${srcdir//\//\\/}\/$pkgname-$pkgver\/wrappers\/cpp\/include/d" \
         "$pkgdir/usr/share/LinphoneCxx/cmake/LinphoneCxxConfig.cmake"
}
