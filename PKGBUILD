# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=flexisip
pkgver=1.0.10
pkgrel=4
pkgdesc="A general purpose SIP proxy with media capabilities"
arch=('i686' 'x86_64')
url="http://flexisip.org"
license=('AGPL3')
groups=()
depends=('belle-sip-git' 'hiredis' 'mediastreamer-git' 'ortp-git' 'protobuf' 'soci' 'sofia-sip-bc' 'unixodbc' 'xsd')
makedepends=('cmake' 'git')
source=("git+https://github.com/BelleDonneCommunications/$pkgname.git#commit=d915601df292742c61b188d1184b376eabf47c83"
    "flexisip.service"
    "flexisip-presence.service")
noextract=()
sha256sums=('SKIP'
            '5c16f7a064ad93d75b9bc4401a5c651ca303ff2b92452e86b9a53ef674db93e4'
            '7f658cc393ef2feab587aaacc7cb62c1211620aa846c6b860c775272d698675c')

build() {
    cd "$pkgname"
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DENABLE_REDIS=YES \
        -DENABLE_PROTOBUF=YES \
        -DENABLE_PRESENCE=YES .
  make
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir/" install
  install -Dm0644 "$srcdir/flexisip.service" "$pkgdir/usr/lib/systemd/system/flexisip.service"
  install -Dm0644 "$srcdir/flexisip-presence.service" "$pkgdir/usr/lib/systemd/system/flexisip.service"
}
