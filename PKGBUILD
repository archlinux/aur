# Maintainer: Daniel Maslowski <info at orangecms dot org>
pkgname=neopg
pkgver=0.0.4
pkgrel=1
# dependency versions
_googletest_ver=1.8.0
_pegtl_ver=2.3.0
_rang_ver=2.1
pkgdesc="The multiversal cryptoengine!"
arch=('i686' 'x86_64')
url="https://neopg.io"
license=('BSD')
depends=('boost' 'botan-with-compression' 'curl' 'gettext' 'gnutls' 'libusb' 'sqlite')
makedepends=('cmake')
provides=('neopg')
source=(
  "https://github.com/das-labor/${pkgname}/archive/v${pkgver}.tar.gz"
  "https://github.com/google/googletest/archive/release-${_googletest_ver}.tar.gz"
  "https://github.com/taocpp/PEGTL/archive/${_pegtl_ver}.tar.gz"
  "https://github.com/agauniyal/rang/archive/${_rang_ver}.tar.gz"
)
sha512sums=('1fae4159dba65567465ab6a9dd2db1f0a97a09b9c5cd7af30fdb90e2f53670c0bc7a5152fe1986a18622467cc94b3f5ca1ef3af2bd9b8ebbeaf1a6b0d3ec920b'
            '1dbece324473e53a83a60601b02c92c089f5d314761351974e097b2cf4d24af4296f9eb8653b6b03b1e363d9c5f793897acae1f0c7ac40149216035c4d395d9d'
            'e6962980fefa0108d9dd11ec4789d10b7ee1d70a1ee90d0e711110ee2f9461f4d42996abcc7420bd7baf490c3e91d691049bc3fc21854aab464bff6ac1a423c8'
            '42b27e25d4970f0e5123d79a07a3f417dd3d9015be5e6eb4568650f366f6ae963fe1ed0cb6c3903469d99dd5a8dcd0925b72932cc129812135115f9b1e591d9f')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  rmdir 3rdparty/googletest && mv "../googletest-release-${_googletest_ver}" 3rdparty/googletest
  rmdir 3rdparty/pegtl && mv "../PEGTL-${_pegtl_ver}" 3rdparty/pegtl
  rmdir 3rdparty/rang && mv "../rang-${_rang_ver}" 3rdparty/rang
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  cmake -DCMAKE_BUILD_TYPE=Release ..
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm 644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
