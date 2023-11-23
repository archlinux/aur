# Maintainer: Robert Falkenberg <robert.falkenberg@srs.io>

pkgbase=srsran-4g-git
pkgname=$pkgbase
_pkgname=srsRAN_4G
pkgver=23.11.0.r0.geea87b1
pkgrel=1
pkgdesc='Open source SDR 4G software suite from Software Radio Systems (SRS)'
arch=('x86_64' 'aarch64')
url='https://www.srsran.com'
license=('AGPL3')
depends=(
  'boost-libs'   # boost libraries
  'fftw'         # discrete Fourier transform
  'libconfig'    # config file parser
  'lksctp-tools' # SCTP libraries
  'mbedtls'      # cryptography
  'pcsclite'     # hard SIM support
  'srsgui'       # GUI support
)
makedepends=(
  'boost' # boost development headers
  'cmake' # build system
  'git'   # version control system
)
#makedepends+=('bladerf' 'libuhd' 'soapysdr' 'zeromq') # for binary package distribution
optdepends=(
  'bladerf: driver for bladeRF support'
  'libuhd: driver for USRP support'
  'soapysdr: driver for SoapySDR support'
  'zeromq: driver for ZeroMQ support'
)
provides=('srsran-4g' 'srsran' 'srslte' 'srsue' 'srsenb' 'srsenb')
conflicts=('srsran-4g' 'srslte' 'srslte' 'srsue' 'srsenb' 'srsenb')
_repo=${SRSRAN_REPO:-'git+https://github.com/srsran/srsRAN_4G.git'}
source=("${_pkgname}::${_repo}")
sha512sums=('SKIP')
options=(!lto)

pkgver() {
  cd $_pkgname
  ( set -o pipefail
    # try to get the first reachable tag              | append patch version _0 if not present           | remove leading zeros                | remove prefix 'release_'   |  transform to "TAG.rN.gHASH"
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/\(release_[0-9]\+_[0-9]\+\)\(-\)/\1_0\2/' | sed 's/\(0\+\)\([1-9]*[0-9]\)/\2/g' | sed 's/^\(release_\)\1*//' |  sed 's/\([^-]*-g\)/r\1/;s/[-_]/./g' ||
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
    -DENABLE_WERROR=False \
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
