# Maintainer: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
# Contributor: Masoud <mpoloton@gmail.com>
# Contributor: valvetime <valvetimepackages@gmail.com>
# Contributor: Tom Swartz <tom@tswartz.net>

_pkgname=SoapySDR
pkgname=soapysdr-git
pkgver=0.8.1.r14.g6f97389
pkgrel=1
epoch=3
pkgdesc='Vendor and platform neutral SDR support library'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/pothosware/SoapySDR'
license=('Boost')
depends=('python')
makedepends=('git' 'cmake' 'swig' 'doxygen' 'graphviz')
optdepends=('soapyairspy: Airspy backend'
            'soapyaudio: Audio devices backend'
            'soapybladerf: BladeRF backend'
            'soapyhackrf: HackRF backend'
            'soapynetsdr: NetSDR backend'
            'soapyosmo: OsmoSDR backend'
            'soapyremote: SoapySDR remote support'
            'soapyrtlsdr: rtl-sdr backend'
            'soapyuhd: UHD backend')
provides=('soapysdr')
conflicts=('soapysdr')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long | sed 's/^soapy.sdr-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p $_pkgname/build
  cd $_pkgname/build

  cmake .. \
    -DSOAPY_SDR_EXTVER=ARCH \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  make
}

package() {
  cd $_pkgname/build

  make DESTDIR="$pkgdir" install

  install -dm 755 "$pkgdir"/usr/share/doc/$_pkgname
  cp -r -a --no-preserve=ownership docs/doxygen/html "$pkgdir"/usr/share/doc/$_pkgname
}
