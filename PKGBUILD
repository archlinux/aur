# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=flexisip
pkgver=2.0.3
pkgrel=1
pkgdesc="A general purpose SIP proxy with media capabilities"
arch=('x86_64')
url="http://flexisip.org"
license=('AGPL3')
groups=()
depends=('bctoolbox' 'belle-sip>=4.3' 'belr' 'hiredis' 'liblinphone' 'mediastreamer>=4.3' 'protobuf' 'soci' 'sofia-sip-bc>=1.13.41bc' 'xerces-c')
makedepends=('cmake' 'xsd')
install='flexisip.install'
source=("flexisip-$pkgver.tar.gz::https://github.com/BelledonneCommunications/flexisip/archive/$pkgver.tar.gz")
noextract=()
sha256sums=('fba32d04aeb0ba4d5078199e3d0a75fe7357cb3cadb571dc032918730f34015a')

build() {
    cd "$pkgname-$pkgver"
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DENABLE_REDIS=YES \
        -DENABLE_PROTOBUF=YES \
        -DENABLE_PRESENCE=YES \
        -DENABLE_CONFERENCE=YES .
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
  for S in flexisip-{presence,proxy,conference}{@,}; do
      install -Dm0644 "scripts/$S.service" "$pkgdir/usr/lib/systemd/system/$S.service"
  done;
}
