# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: David P. <megver83@parabola.nu>

pkgname=liblinphone
pkgver=5.4.119
pkgrel=1
pkgdesc='A high-level SIP library'
arch=(x86_64)
url='http://www.linphone.org'
license=('AGPL-3.0-only')
depends=(belcard belle-sip jsoncpp-cmake mediastreamer xerces-c lime)
makedepends=(cmake doxygen graphviz python-pystache python-sphinx xsd)
source=("https://gitlab.linphone.org/BC/public/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz"
    "temp_variables.patch"
    "zxing.patch")
sha256sums=('51195132da5951173c4c908adf603a0ee35379253d3abeeab2645df59f8aab39'
            '9288d6612ce110a14eea93ee7c45082c8fbf3963166a881458a3f03944283d8f'
            'e27fa53c1206818f2f4bd07ffa3c98f5c804d4a30377ef81a7f5ff18e331e2af')

prepare() {
    cd "$pkgname-$pkgver"
    sed -i -e "s/CXX_STANDARD 14/CXX_STANDARD 17/" CMakeLists.txt
    patch -p1 < "${srcdir}/temp_variables.patch"
    patch -p1 < "${srcdir}/zxing.patch"
}

build() {
  CXXFLAGS+=" -Wno-deprecated -Wimplicit-fallthrough=0 -Wno-unused-function"

  cmake -B build -S "${pkgname}-${pkgver}"\
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_SHARED_LIBS=YES \
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
