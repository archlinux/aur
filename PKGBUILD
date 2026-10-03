# Maintainer: Kirill Pshenichnyi <pshcyrill@mail.ru>
# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>
# Contributor: The Tango Controls community
#              (https://tango-controls.org) <info@tango-controls.org>

pkgname=tango-cpp
_pkgname=cppTango
pkgver="10.3.4.1"
pkgrel=1
groups=("tango-controls")
pkgdesc="TANGO distributed control system - shared library"
arch=("x86_64" "armv7h")
url="https://gitlab.com/tango-controls/${_pkgname}"
license=("GPL-3.0-or-later")
depends=("glibc" "gcc-libs" "tango-idl" "omniorb>=4.3.0" "zeromq" "cppzmq" "libjpeg-turbo" "opentelemetry-cpp" "grpc")
makedepends=("cmake>=3.18")
optdepends=("doxygen: for building docs" "graphviz: for building docs")
conflicts=("tango")
source=(
  "https://gitlab.com/tango-controls/${_pkgname}/-/releases/${pkgver}/downloads/${_pkgname}-with-submodules-${pkgver}.tar.gz"
  "fortify.patch"
  "subscribe-event-inline.patch"
)

sha256sums=('cb8ad7fc83061a4efa4ea1caeb4803f3acd641044e85295b850404708806b1d3'
            '428bd91581e6d7f8caa73cd399fe66b69f996d68fc71c7ef382e79270a153e88'
            '80a2d6dbc8acdf03eebb33f9f8f304319e017b1b4e347d8b75f064a6cbcee6f7')

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
