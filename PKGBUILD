# Maintainer: Edmund Lodewijks <e.lodewijks at gmail.com>

pkgname=postallow
pkgver=3.6.2
pkgrel=1
pkgdesc="Generate an allowlist for Postfix's Postscreen, based on large senders' SPF records"
arch=(any)
url="https://github.com/lquidfire/postallow"
license=('MIT')
depends=('glibc' 'sh' 'spf-tools')
optdepends=('knot-resolver: strongly recommended for DNS lookups (or any other caching DNS resolver)'
	    'postfix: for writing the allowlist and/or blocklist to the Postfix directory')
makedepends=('git')
source=("$pkgname"::"git+https://github.com/lquidfire/postallow.git#tag="$pkgver"")
backup=('etc/postallow.conf')
sha256sums=('fe869faaaeda04e14300e221bb3e602e35e9c87905c3adbf67686f73c9dd7fa7')

prepare() {
  cd "$pkgname"

  sed -i 's/\/usr\/local\/bin\/postallow/\/usr\/share\/postallow/g' postallow.conf
  sed -i 's/\/local//g' postallow.conf # Check where SPF-Tools are installed
  sed -i 's/sbin/bin/g' postallow.conf
}

package() {
  cd "$pkgname"
  
  install -Dm754 postallow -t "$pkgdir"/usr/bin

  install -Dm644 postallow.conf -t "$pkgdir"/etc

  install -Dm644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm644 yahoo_static_hosts.txt -t "$pkgdir"/usr/share/$pkgname
  install -Dm754 {scrape_yahoo,query_mailer_ovh} -t "$pkgdir"/usr/share/$pkgname/scripts/

  # license
  install -Dm 644 LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname
}
