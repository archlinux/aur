# Maintainer: Edmund Lodewijks <e.lodewijks at gmail.com>

pkgname=postallow
pkgver=3.8.0
pkgrel=1
pkgdesc="Generate an allowlist for Postfix's Postscreen, based on large senders' SPF records"
arch=(any)
url="https://github.com/lquidfire/postallow"
license=('MIT')
depends=('glibc' 'bash' 'spf-tools' 'route-summarization')
optdepends=('knot-resolver: strongly recommended for DNS lookups (or any other caching DNS resolver)'
	    'postfix: for writing the allowlist and/or blocklist to the Postfix directory')
makedepends=('git')
source=("${pkgname}"::"git+https://github.com/lquidfire/"${pkgname}".git#tag="$pkgver"")
validpgpkeys=('E7AAC21597965C6259108D6F471F22BDE25DD664')
# The above is the fingerprint for key-id 0x471F22BDE25DD664
backup=('etc/postallow.conf')
sha256sums=('60f84427061ecad546f1a89e36388f98fb31671690b140a252caa8af1f2ac6fe')

prepare() {
  cd "$pkgname"

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
