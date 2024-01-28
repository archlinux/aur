# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Josef Miegl <josef@miegl.cz>
# Contributor: Romain Porte <microjoe@microjoe.org>
# Contributor: Michal Krenek (Mikos) <m.krenek@gmail.com>
# Contributor: valvetime <valvetimepackages@gmail.com>
# Contributor: Dan McCurry <dan.mccurry at linux dot com>
# Contributor: Tom Swartz <tom@tswartz.net>

pkgname=cubicsdr
_pkgname=CubicSDR
pkgver=0.2.7
pkgrel=2
pkgdesc="Cross-Platform Software-Defined Radio Application"
arch=(x86_64 aarch64 armv7h i686)
url="https://github.com/cjcliffe/CubicSDR"
license=(GPL-2.0-or-later)
depends=(
  gcc-libs
  glibc
  hamlib
  hicolor-icon-theme
  libglvnd
  libpulse
  liquid-dsp
  soapysdr
  wxwidgets-common
  wxwidgets-gtk3
)
makedepends=(cmake)
optdepends=(
  'fftw: FFTW support'
  'limesuite: support for LimeSDR'
  'soapyairspy: support for Airspy R2 and Airspy Mini'
  'soapyhackrf: support for HackRF'
  'soapyosmo: support for MiriSDR and RFSpace'
  'soapyplutosdr: support for PlutoSDR'
  'soapyremote: use any SoapySDR device remotely over network'
  'soapyrtlsdr: support for RTL-SDR (RTL2832U) dongles'
  'soapysdrplay: support for SDRplay RSP'
)

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
  "cubicsdr.desktop"
)
sha256sums=(
  '790f851e08f1068081a8593dfd4a149c7414e7d70c1f5cafd287331df493b811'
  '64b4afff640126786e12305b1be7fe7a2fdb715fd4a7f587bb426c2e19c27f1d'
)

_archive="$_pkgname-$pkgver"

build() {
  cd "$_archive"

  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev \
    -DUSE_HAMLIB=ON \
    -DENABLE_DIGITAL_LAB=ON
  cmake --build build
}

package() {
  cd "$_archive"

  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 -t "$pkgdir/usr/share/applications" "$srcdir/cubicsdr.desktop"
  install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/256x256/apps" \
    "$pkgdir/usr/share/cubicsdr/CubicSDR.png"

  ln -s /usr/bin/CubicSDR "$pkgdir/usr/bin/cubicsdr"
}
