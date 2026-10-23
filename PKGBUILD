# Maintainer: Robert Falkenberg <robert.falkenberg@srs.io>

pkgbase=ocudu
pkgname=$pkgbase
_pkgname=ocudu
pkgver=26.10.0
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
sha512sums=('03d94981c4e656fdf6192661264bf09eb9a0fb4d3420bde2829ebbbe5f6251f71bbf940a37e062a0f8e10e3a0358d2b4126b688f2a9588225fc6b5980f28284a')
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
