# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: David P. <megver83@parabola.nu>

pkgname=liblinphone
pkgver=5.2.33
pkgrel=1
pkgdesc='A high-level SIP library'
arch=(x86_64)
url='http://www.linphone.org'
license=('GPL')
depends=(belcard belle-sip jsoncpp-cmake mediastreamer xerces-c lime)
makedepends=(cmake doxygen graphviz python-pystache python-sphinx xsd)
source=("https://gitlab.linphone.org/BC/public/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('d4e1428f05d478309d0ee969ae2d59debe2fac97f927f24a89946f0cf46e45e6')

prepare() {
    cd "$pkgname-$pkgver"
    sed -i -e "s/CXX_STANDARD 14/CXX_STANDARD 17/" CMakeLists.txt
}

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
