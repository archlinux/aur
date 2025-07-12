# Maintainer: Kirill Pshenichnyi <pshcyrill@mail.ru>
# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>
# Contributor: The Tango Controls community
#              (https://tango-controls.org) <info@tango-controls.org>

pkgname=tango-cpp
_pkgname=cppTango
pkgver="10.0.2"
pkgrel=7
groups=("tango-controls")
pkgdesc="TANGO distributed control system - shared library"
arch=("x86_64" "armv7h")
url="https://gitlab.com/tango-controls/${_pkgname}"
license=("GPL-3.0-or-later")
depends=("glibc" "gcc-libs" "tango-idl" "omniorb>=4.3.0" "zeromq" "cppzmq" "libjpeg-turbo" "opentelemetry-cpp" "grpc" "catch2")
makedepends=("cmake>=3.18")
optdepends=("doxygen: for building docs" "graphviz: for building docs")
conflicts=("tango")
source=(
  "https://gitlab.com/tango-controls/${_pkgname}/-/releases/${pkgver}/downloads/${_pkgname}-with-submodules-${pkgver}.tar.gz"
)

sha256sums=(
  "db53d16f386a8397e18d325a3aaf6490e68968cbc6bdc39427f7d87c76949930"
)

build() {
  # Disable mmx (for jpeg) instruction for arm architecture
  if [[ $CARCH == "armv7h" ]]
  then
    _MMX=-DTANGO_JPEG_MMX=OFF
  fi
  cd "${_pkgname}-with-submodules-${pkgver}"
  cmake -B build ${_MMX} -DBUILD_TESTING=OFF -DCMAKE_INSTALL_PREFIX=/usr -DTANGO_USE_TELEMETRY=ON -DTANGO_TELEMETRY_EXPORTER_OPTION_NEW=ON
  make -C build
}

package() {
  cd "${_pkgname}-with-submodules-${pkgver}"
  make -C build DESTDIR=${pkgdir} install
}
