# Maintainer: Robert Falkenberg <robert.falkenberg@srs.io>

pkgbase=ocudu-git
pkgname=$pkgbase
_pkgname=ocudu
pkgver=r16703.g4615370
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
source=('git+https://gitlab.com/ocudu/ocudu.git')
sha512sums=('SKIP')
options=(!lto)

pkgver() {
   cd "${_pkgname}"
  ( set -o pipefail
    # try to get the first reachable tag              | append patch version _0 if not present           | remove prefix 'release_'   | transform to "TAG.rN.gHASH"
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/\(release_[0-9]\+_[0-9]\+\)\(-\)/\1_0\2/' | sed 's/^\(release_\)\1*//' | sed 's/\([^-]*-g\)/r\1/;s/[-_]/./g' ||
    # no tag reachable, use number of revisions since beginning of the history
    printf "r%s.g%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
  # clear compiler flags set by makepkg.conf
  CFLAGS=""
  CXXFLAGS=""

  echo "Building ${_pkgname}..."
  cmake \
    -B "build" \
    -S "${_pkgname}" \
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
  install -Dm644 ${_pkgname}/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  cd build
  make DESTDIR="${pkgdir}" install
}
