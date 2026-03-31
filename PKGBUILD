# Maintainer: Robert Falkenberg <robert.falkenberg@srs.io>

pkgbase=ocudu
pkgname=$pkgbase
_pkgname=ocudu
pkgver=26.04.0
_pkgver="${pkgver%.0}"              # remove trailing revision in case of ".0"
_pkgver="release_${_pkgver//./_}"   # prefix "release_" and replace "." with "_"
pkgrel=1
pkgdesc='Open Centralized Unit Distributed Unit (OCUDU)'
arch=('x86_64' 'aarch64')
url='https://ocudu.org'
license=('BSD-3-Clause-Open-MPI')
depends=(
  'fftw'         # discrete Fourier transform
  'libelf'       # backtraces
  'lksctp-tools' # SCTP libraries
  'mbedtls'      # cryptography
  'yaml-cpp'     # config file and command line parser
)
makedepends=(
  'boost' # boost development headers (required by libuhd)
  'cmake' # build system
  'git'   # version control system
  'gtest' # testing suite
)
optdepends=(
  'libelf: backtraces'
  'libuhd: driver for Universal Software Radio Peripheral (USRP)'
  'rohc: support for robust header compression'
  'zeromq: driver for ZeroMQ support'
)
provides=('ocudu')
conflicts=('ocudu' 'srsran-project')
source=("https://gitlab.com/${pkgname}/${pkgname}/-/archive/${_pkgver}/${pkgname}-${_pkgver}.tar.bz2")
sha512sums=('138c777e06c59a9723682cfb1171daa33ff829f3f27bcd7a010ebd369b80002c72eb818efd53186a7c994e58a2507a470fd0774d4176be758c38c633b7a61d99')
options=(!lto)

build() {
  # clear compiler flags set by makepkg.conf
  CFLAGS=""
  CXXFLAGS=""

  echo "Building ${_pkgname}..."
  cmake \
    -B "build" \
    -S "${_pkgname}-${_pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_WERROR=False \
    -DENABLE_MKL=False \
    -DCMAKE_BUILD_TYPE=Release
  make -C "build"
}

check() {
  echo "Running tests for ${_pkgname}..."
  cd "${srcdir}"/build
  ctest $(echo ${MAKEFLAGS} | grep -Po '\-j[0-9][0-9]*')
}

package() {
  install -Dm644 "${_pkgname}-${_pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  cd build
  make DESTDIR="${pkgdir}" install
}
