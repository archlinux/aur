# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Colin Pitrat <colin.pitrat@gmail.com>

pkgname=mediaproxy
pkgver=2.6.1
pkgrel=5
pkgdesc="Open-source media proxy for OpenSER"
url="http://mediaproxy.ag-projects.com/"
arch=('x86_64')
license=('GPL')
depends=('python2' 'libnetfilter_conntrack' 'iptables'
	 'python2-application' 'python2-cjson' 'python2-gnutls'
	 'python2-twisted')
#backup=('opt/mediaproxy/config.ini')
source=("http://download.ag-projects.com/MediaProxy/mediaproxy-$pkgver.tar.gz"
	"mediaproxy-dispatcher.service"
	"mediaproxy-relay.service"
	"mediaproxy.tmpfiles")
sha512sums=('f4da0dcf2347911feacfa9b6757738d94d8f1fdd7eae885ba13e49aa590bb9f195c76c8928b11564d7e51d7f0e2e89ee277e0b58e7450b6a68f91d56b8428c8a'
            'e1844392d45427e6596828df2f2db8c667dad94f74102ba628d5a650e8ac862409b8d1fa04ce68c3acff74f0d4ef3fe5fc9ef314c6c325af80488ca8bdf95092'
            '36e50aa1f0faa3e0207c256b81438bced99ff6879f1a878009637d0b5e812e11639ddd00799fb3be793f004ed4504023bedc513865f35d2e15f06efd3c58611a'
            'c0405d824ad1aec2b11979727a731120bac1200167edd17b09faf6c9253f5e24fa2547c597eaa81728b5139c827c426c520dc578d05ee8e23e77df4cb2d2e6ca')

build() {
  cd "$srcdir"/mediaproxy-$pkgver
  sed -i "s|libraries = get_link_libraries(),|libraries = ['netfilter_conntrack', 'ip4tc'],|g" setup.py
}

package() {
  cd "$srcdir"/mediaproxy-$pkgver

  python2 setup.py install --root="$pkgdir"

  install -Dm0644 "$srcdir"/$pkgname-dispatcher.service "$pkgdir"/usr/lib/systemd/system/$pkgname-dispatcher.service
  install -Dm0644 "$srcdir"/$pkgname-relay.service "$pkgdir"/usr/lib/systemd/system/$pkgname-relay.service
  install -Dm0644 "$srcdir"/$pkgname.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/$pkgname.conf
}
