# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=flexisip
pkgver=2.0.0
pkgrel=1
pkgdesc="A general purpose SIP proxy with media capabilities"
arch=('x86_64')
url="http://flexisip.org"
license=('AGPL3')
groups=()
depends=('belle-sip>=4.3' 'belr' 'hiredis' 'mediastreamer>=4.3' 'protobuf' 'soci' 'sofia-sip-bc>=1.13.41bc' 'xerces-c')
makedepends=('cmake' 'xsd')
install='flexisip.install'
source=("flexisip-$pkgver.tar.gz::https://github.com/BelledonneCommunications/flexisip/archive/$pkgver-beta.tar.gz")
noextract=()
sha256sums=('679ce09120143a4dc363a38e9e41bd469a8ac589867b7d233d9fb0b036107092')

build() {
    cd "$pkgname-$pkgver-beta"
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DENABLE_REDIS=YES \
        -DENABLE_PROTOBUF=YES \
        -DENABLE_PRESENCE=YES .
  make
}

package() {
  cd "$pkgname-$pkgver-beta"

  make DESTDIR="$pkgdir/" install
  for S in 'flexisip-presence' "flexisip-presence@" "flexisip-proxy" "flexisip-proxy@"; do
      install -Dm0644 "scripts/$S.service" "$pkgdir/usr/lib/systemd/system/$S.service"
  done;
}
