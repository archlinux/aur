# Maintainer: Thor77 <thor77 at thor77 dot org>
# Contributor (backup): Thomas Fanninger <thomas at fanninger dot at>
# Contributor: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>

pkgname=linx-server
pkgver=2.3.8
pkgrel=1
pkgdesc='Self-hosted file/code/media sharing website'
arch=('i686' 'x86_64' 'arm')
url='https://github.com/andreimarcu/linx-server'
license=('GPL3')
install=linx-server.install
options=('!strip')
makedepends=('go' 'go.rice')
backup=('etc/linx-server/config.ini')
source=("https://github.com/andreimarcu/linx-server/archive/v${pkgver}.tar.gz"
        'config.ini'
        'linx-server.service'
        'linx-cleanup.service'
        'linx-server.tmpfiles'
        'linx-server.sysusers')
sha256sums=('cadf51359df7e3d9c88b61751a4105700b104233b06ae54771a54c319a25a452'
            '261b5cdfa0c3751c8811ee239a9c61952bbdf21d93f318c0a86a2d90075f2e19'
            '97e8205e708afa5891918d1f50dc9d96096a05249bd1661d851110d3a968b3b3'
            'fdae9fb4942de21da6a27de235ac6a72089699ad79e3138d0de6dc9aaedd4723'
            '6bd450832b64fac15fe84e1e80f392753de434f6183acc7cc87ecc3a4619867b'
            '42180dcb0badba95c17fa4cf355b649fa7f66401758d6db9a132da791a585b57')

build() {
  cd $pkgname-$pkgver
  go build .
  rice append --exec linx-server

  cd linx-cleanup
  go build .

  cd ../linx-genkey
  go build .
}

package() {
  install -Dm660 config.ini -t "$pkgdir/etc/linx-server"
  install -Dm644 $pkgname.service -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 $pkgname.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  install -Dm644 $pkgname.sysusers "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 linx-cleanup.service -t "$pkgdir/usr/lib/systemd/system"

  cd $pkgname-$pkgver
  install -Dm644 linx-cleanup/linx-cleanup.timer -t "$pkgdir/usr/lib/systemd/system"
  install -Dm755 linx-server -t "$pkgdir/usr/bin"
  install -Dm755 linx-cleanup/linx-cleanup -t "$pkgdir/usr/bin"
  install -Dm755 linx-genkey/linx-genkey -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
