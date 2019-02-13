# Maintainer: Josef Miegl <josef@miegl.cz>
# Contributor: Romain Porte <microjoe@microjoe.org>
# Contributor: Michal Krenek (Mikos) <m.krenek@gmail.com>
# Contributor: valvetime <valvetimepackages@gmail.com>
# Contributor: Dan McCurry <dan.mccurry at linux dot com>
# Contributor: Tom Swartz <tom@tswartz.net>

pkgname=cubicsdr
pkgver=0.2.5
pkgrel=2
pkgdesc="Cross-Platform Software-Defined Radio Application"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="https://github.com/cjcliffe/CubicSDR"
license=('GPL')
depends=('libpulse' 'wxgtk2-dev' 'wxgtk-common-dev' 'soapysdr' 'liquid-dsp')
optdepends=('fftw: FFTW support'
            'soapyrtlsdr: support for RTL-SDR (RTL2832U) dongles'
            'soapyairspy: support for Airspy R2 and Airspy Mini'
            'soapysdrplay: support for SDRplay RSP'
            'soapyhackrf: support for HackRF'
            'limesuite: support for LimeSDR'
            'soapyosmo: support for MiriSDR and RFSpace'
            'soapyplutosdr: support for PlutoSDR'
            'soapyremote: use any SoapySDR device remotely over network'
            'hamlib: hamlib support')
makedepends=('git' 'cmake' 'libicns')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cjcliffe/CubicSDR/archive/${pkgver}.tar.gz")
sha256sums=('5cb44c110fcbbb70a468b7fa402cf35f84d8901b3dd42d471a90ac3f5db00f4d')

build() {
  cd "CubicSDR-${pkgver}"
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
  cd "CubicSDR-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
