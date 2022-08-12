# Maintainer: Robert Falkenberg <robert.falkenberg@srs.io>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgbase=srsran-git
pkgname=$pkgbase
_pkgname=srsRAN
pkgver=22.4.1.r0.gce8a3cae1
pkgrel=1
pkgdesc='Open source SDR LTE software suite from Software Radio Systems (SRS)'
arch=('x86_64')
url='https://www.srsran.com'
license=('AGPL3')
depends=('fftw' 'mbedtls' 'boost-libs' 'lksctp-tools' 'libconfig' 'pcsclite' 'srsgui')
makedepends=('cmake' 'boost' 'git')
#makedepends+=('libuhd' 'soapysdr' 'bladerf' 'zeromq') # for binary package distribution
optdepends=('libuhd: for USRP support'
            'soapysdr: for SoapySDR support'
            'bladerf: for bladeRF support'
            'zeromq: for ZeroMQ support')
provides=('srslte' 'srsran' 'srsue' 'srsenb' 'srsenb')
conflicts=('srslte' 'srsran' 'srsue' 'srsenb' 'srsenb')
source=("git+https://github.com/srsran/srsRAN.git")
sha512sums=('SKIP')
options=(!lto)

pkgver() {
  cd $_pkgname
  # get most recent tag      | append patch version _0 if not present           | remove leading zeros                | remove prefix 'release_'   |  add revision prefix 'r'; put periods
  git describe --long --tags | sed 's/\(release_[0-9]\+_[0-9]\+\)\(-\)/\1_0\2/' | sed 's/\(0\+\)\([1-9]*[0-9]\)/\2/g' | sed 's/^\(release_\)\1*//' |  sed 's/\([^-]*-g\)/r\1/;s/[-_]/./g'
}

build() {
  # clear compiler flags set by makepkg.conf
  CFLAGS=""
  CXXFLAGS=""

  echo 'Building srsran...'
  cmake \
    -B "build" \
    -S "${_pkgname}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make -C "build" -j12
}

check() {
  echo 'Running tests for srsran...'
  cd "$srcdir"/build
  ctest $(echo $MAKEFLAGS | grep -Po '\-j[0-9][0-9]*')
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
