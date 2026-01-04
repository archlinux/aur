# Maintainer: Edmund Lodewijks <e.lodewijks at gmail.com>

pkgname=postallow
pkgver=3.10.2
#_commit=579298134e
pkgrel=1
pkgdesc="Generate an allowlist for Postfix's Postscreen, based on large senders' SPF records"
arch=(any)
url="https://github.com/lquidfire/postallow"
license=('MIT')
depends=('glibc' 'bash' 'spf-tools' 'route-summarization')
optdepends=(
    'knot-resolver: strongly recommended for DNS lookups (or any other caching DNS resolver)'
	'postfix: for writing the allowlist and/or blocklist to the Postfix directory'
)
makedepends=('git')
source=("${pkgname}::git+https://codeberg.org/peregrinus13/${pkgname}.git#tag=${pkgver}")
#source=("${pkgname}"::"git+https://codeberg.org/peregrinus13/"${pkgname}".git#commit="$_commit"")
validpgpkeys=('E7AAC21597965C6259108D6F471F22BDE25DD664')
# The above is the fingerprint for key-id 0x471F22BDE25DD664
backup=('etc/postallow/postallow.conf')
b2sums=('00b3749160747e46f50e45138ce0d3bb36eb60e1fa7b5ad70ef34b8a14d57ce37a1dd39dd7fce230e02a0ecaeaed36e42d17f665320ff544b001a00bd1dbad07')

prepare() {
  cd "$pkgname"

  sed -i 's/\/local//g' conf/postallow.conf # Check where SPF-Tools are installed
  sed -i 's/sbin/bin/g' conf/postallow.conf
}

package() {
  cd "$pkgname"
  
  install -Dm754 postallow -t "$pkgdir"/usr/bin

  install -Dm644 conf/postallow.conf -t "$pkgdir"/etc/$pkgname
  install -Dm644 conf/allowlist_hosts -t "$pkgdir"/etc/$pkgname
  install -Dm644 conf/blocklist_hosts -t "$pkgdir"/etc/$pkgname

  install -Dm644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm644 yahoo_static_hosts.txt -t "$pkgdir"/usr/share/$pkgname
  install -Dm754 scripts/{scrape_yahoo,query_mailer_ovh} -t "$pkgdir"/usr/share/$pkgname/scripts/

  # license
  install -Dm 644 LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname
}
