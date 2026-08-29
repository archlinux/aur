# Maintainer: Kirill Pshenichnyi <pshcyrill@mail.ru>
# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>
# Contributor: The Tango Controls community
#              (https://tango-controls.org) <info@tango-controls.org>

pkgname=tango-cpp
_pkgname=cppTango
pkgver="10.3.3"
pkgrel=1
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
  "fortify.patch"
  "subscribe-event-inline.patch"
)

sha256sums=(
  "ce76c424ed39d24ee24561c17e0596ee4099f29ebfcff9027621d46868c1564a"
  "f83a617bda31176a0331189b2480f5a7cee867c2b53ce47698fdf4ce72768cc4"
  "80a2d6dbc8acdf03eebb33f9f8f304319e017b1b4e347d8b75f064a6cbcee6f7"
)

prepare() {
  cd "${_pkgname}-with-submodules-${pkgver}"
  patch -N -p1 --input="${srcdir}/fortify.patch"
  patch -N -p1 --input="${srcdir}/subscribe-event-inline.patch"
}

build() {
  # Disable mmx (for jpeg) instruction for arm architecture
  if [[ $CARCH == "armv7h" ]]
  then
    _MMX=-DTANGO_JPEG_MMX=OFF
  fi
  cd "${_pkgname}-with-submodules-${pkgver}"
  cmake -B build ${_MMX} -DBUILD_TESTING=OFF -DCMAKE_INSTALL_PREFIX=/usr -DTANGO_USE_TELEMETRY=ON
  make -C build
}

package() {
  cd "${_pkgname}-with-submodules-${pkgver}"
  make -C build DESTDIR=${pkgdir} install
}
