# Maintainer: Daniel Maslowski <info at orangecms dot org>
pkgname=neopg
pkgver=0.0.5
pkgrel=1
# dependency versions
_googletest_ver=1.8.0
_pegtl_ver=2.4.0
_rang_ver=2.1
_json_ver=1.0.0-beta.11
pkgdesc="The multiversal cryptoengine!"
arch=('i686' 'x86_64')
url="https://neopg.io"
license=('BSD')
depends=('boost' 'botan' 'curl' 'gettext' 'gnutls' 'libusb' 'sqlite')
makedepends=('cmake')
conflicts=('neopg-git')
source=(
  "https://github.com/das-labor/${pkgname}/archive/v${pkgver}.tar.gz"
  "https://github.com/google/googletest/archive/release-${_googletest_ver}.tar.gz"
  "https://github.com/taocpp/PEGTL/archive/${_pegtl_ver}.tar.gz"
  "https://github.com/agauniyal/rang/archive/${_rang_ver}.tar.gz"
  "https://github.com/taocpp/json/archive/${_json_ver}.tar.gz"
)
sha512sums=('2b777c82f825ce0028fdee6017e33dcd14aa146142c6f39970714a791b4c53a7cbe540afc02abe7801f68cecfe51abcd3d3e7d6b9f8d0e4142686b7b0a8fe067'
            '1dbece324473e53a83a60601b02c92c089f5d314761351974e097b2cf4d24af4296f9eb8653b6b03b1e363d9c5f793897acae1f0c7ac40149216035c4d395d9d'
            '62441e2408563adfc571e434a38c45e5d124dd1ed171de074fe62d2ac73cc4ef5dbf61f76adaf760c2cd81808fdcd19930b064ca213f8b5ebc0ca10628df089e'
            '42b27e25d4970f0e5123d79a07a3f417dd3d9015be5e6eb4568650f366f6ae963fe1ed0cb6c3903469d99dd5a8dcd0925b72932cc129812135115f9b1e591d9f'
            '6448b575ac713d225694f79c8b674494364a814ee87c0b5a183542ebe3bb70a0f024f718623c2d88855737689ab3af4e2f8f34505fcc890c0c3739e5dc83f514')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  rmdir 3rdparty/googletest && mv "../googletest-release-${_googletest_ver}" 3rdparty/googletest
  rmdir 3rdparty/pegtl && mv "../PEGTL-${_pegtl_ver}" 3rdparty/pegtl
  rmdir 3rdparty/rang && mv "../rang-${_rang_ver}" 3rdparty/rang
  rmdir 3rdparty/json && mv "../json-${_json_ver}" 3rdparty/json
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
  mkdir -p "${pkgdir}/usr/lib"
  install -Dm 755 lib/libneopg.so "${pkgdir}/usr/lib/libneopg.so"
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm 644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
