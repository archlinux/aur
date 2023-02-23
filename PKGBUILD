# Maintainer: Robert Falkenberg <robert.falkenberg@srs.io>

pkgbase=srsran-project-git
pkgname=$pkgbase
_pkgname=srsRAN_Project
pkgver=r4764.g77be7d3
pkgrel=1
pkgdesc='The srsRAN Project is a complete 5G RAN solution, featuring an ORAN-native CU/DU developed by (SRS)'
arch=('x86_64' 'aarch64')
url='https://www.srsran.com'
license=('AGPL3')
depends=(
  'fftw'         # discrete Fourier transform
  'mbedtls'      # cryptography
  'lksctp-tools' # SCTP libraries
  'yaml-cpp'     # config file and command line parser
  'libelf'       # backtraces
  'libuhd'       # driver for Universal Software Radio Peripheral (USRP)
  'boost'        # requirement by libuhd
  'python'       # requirement by libuhd
)
makedepends=(
  'cmake' # build system
  'git'   # version control system
  'gtest' # testing suite
)
optdepends=(
  'zeromq: driver for ZeroMQ support'
)
provides=('srsran-project')
conflicts=('srsran-project')
_repo=${SRSRAN_REPO:-'git+https://github.com/srsran/srsRAN_Project.git'}
source=("${_pkgname}::${_repo}")
sha512sums=('SKIP')
options=(!lto)

pkgver() {
   cd "${_pkgname}"
  ( set -o pipefail
    # try to get the first reachable tag              | transform to "TAG.rN.gHASH"      | cut prefix "v"
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^\(v\)\1*//' ||
    # no tag reachable, use number of revisions since beginning of the history
    printf "r%s.g%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
  # clear compiler flags set by makepkg.conf
  CFLAGS=""
  CXXFLAGS=""

  echo "Building $_pkgname..."
  cmake \
    -B "build" \
    -S "${_pkgname}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make -C "build"
}

check() {
  echo "Running tests for $_pkgname..."
  cd "$srcdir"/build
  ctest $(echo $MAKEFLAGS | grep -Po '\-j[0-9][0-9]*')
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
