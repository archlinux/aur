# Maintainer: Ruthger Gubbels <ruthger@ruthger.nl>

pkgname='communigatepro'
pkgver='6.1.2'
pkgrel='1'
pkgdesc='Unified Communications platform'
arch=('x86_64')
url='http://www.stalker.com/'
license=('custom')
makedepends=('rpmextract')
optdepends=('communigatepro-av: Spam and AV scanner for Communigate Pro')
provides=('smtp-server' 'imap-server' 'pop3-server')
conflicts=('smtp-server' 'imap-server' 'pop3-server')
options=(!strip)
install='install'
source=(
  'ftp://ftp.stalker.com/pub/CommuniGatePro/6.1/CGatePro-Linux-6.1-2.x86_64.rpm'
  'cgatepro.service'
  'LICENCE'
)
sha512sums=('cba14aa4dc81b1ba1674df3d510e03cf007d23e3c1fb89a6bbf4bdd21b11e6cbb9b0c586bce3d815ddc8cd69211c01131004d09e3048c9fa0324eb23abbe43d7'
            'b307a6d2878f100a07cd65e0ec838ab35ec524415d082ac94e1a02d22b37bc361ed71664d8bbc797e97b79afe6eb34fe26bfcb985846b881e8a17ecb310d5d0c'
            'a220724c78e715c577dca1001437942e29d32c4f6e1d3e4d7e99b5ced198dac45966084be3f23b2f64522b6d005d7faa50c14e76cf71297500618ec9ed3cd066')

build() {
  rpmextract.sh *.rpm
  rm opt/CommuniGate/Startup -f
}

package() {
  # Licence
  install -Dm644 LICENCE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE

  # Systemd service
  install -Dm644 cgatepro.service "$pkgdir"/usr/lib/systemd/system/cgatepro.service

  # Program directory and files
  install -dm755 "$pkgdir"/opt/CommuniGate
  cp "$srcdir"/opt/CommuniGate/* "$pkgdir"/opt/CommuniGate -r
  chmod 2755 "$pkgdir"/opt/CommuniGate -R

  # Data directories
  install -dm2770 "$pkgdir"/var/lib/CommuniGate
  install -dm2700 "$pkgdir"/var/lib/CommuniGate/Settings
}
