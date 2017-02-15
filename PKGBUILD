# Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>
# Contributor: valvetime <valvetimepackages@gmail.com>
# Contributor: Dan McCurry <dan.mccurry at linux dot com>
# Contributor: Tom Swartz <tom@tswartz.net>

pkgname=cubicsdr-git
_pkgname=cubicsdr
pkgver=r1316.e173eec
pkgrel=1
epoch=2
pkgdesc="Cross-Platform Software-Defined Radio Application"
arch=('i686' 'x86_64')
url="https://github.com/cjcliffe/CubicSDR"
license=('GPL')
depends=(
  'libpulse'
  'wxgtk'
  'soapysdr'
  'liquid-dsp-git'
)
optdepends=(
  'fftw: FFTW support'
  'soapyrtlsdr-git: support for RTL-SDR (RTL2832U) dongles'
  'soapyairspy-git: support for Airspy R2 and Airspy Mini'
  'soapysdrplay-git: support for SDRplay RSP'
  'soapyhackrf-git: support for HackRF'
  'soapylms7-git: support for LimeSDR'
  'soapyosmo-git: support for MiriSDR and RFSpace'
  'soapyremote-git: use any SoapySDR device remotely over network'
  'hamlib: hamlib support'
)
makedepends=(
  'git'
  'automake'
  'cmake'
  'libicns'
)
conflicts=('cubicsdr')
install="${pkgname}.install"
source=(cubicsdr-git::"git+https://github.com/cjcliffe/cubicsdr.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  mkdir -p build
  cd build

  # Determine if hamlib should be enabled
  if rigctl -V &>/dev/null; then
    _hamlib='-DUSE_HAMLIB=1';
    msg2 "hamlib found and enabled!"
  else
    _hamlib='';
    msg2 "hamlib not found"
  fi

  cmake ../ -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DwxWidgets_CONFIG_EXECUTABLE=$(which wx-config) \
    $_hamlib
  make
}

package() {
  cd "${srcdir}/${pkgname}/build"
  make DESTDIR="${pkgdir}" install
}
