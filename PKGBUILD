# Maintainer: Edmund Lodewijks <archlinux@proteamail.com>

pkgname=postallow
pkgver=3.10.1
pkgrel=1
pkgdesc="Generate an allowlist for Postfix's Postscreen, based on large senders' SPF records"
arch=(any)
url="https://github.com/lquidfire/postallow"
license=('MIT')
depends=('glibc' 'bash' 'spf-tools' 'route-summarization')
optdepends=('knot-resolver: strongly recommended for DNS lookups (or any other caching DNS resolver)'
	    'postfix: for writing the allowlist and/or blocklist to the Postfix directory')
makedepends=('git')
#source=("${pkgname}"::"git+https://github.com/lquidfire/"${pkgname}".git#tag="$pkgver"")
source=($pkgname-$pkgver.tar.gz::https://codeberg.org/peregrinus13/postallow/archive/$pkgver.tar.gz)
validpgpkeys=('E7AAC21597965C6259108D6F471F22BDE25DD664')
# The above is the fingerprint for key-id 0x471F22BDE25DD664
backup=('etc/postallow.conf')
b2sums=('9c08f966e47eda162f16531c2ff5bf24b23d85224400e5e35def5547a00f1df3c5efa84c1714febd2fca2856b4bc318091e28e4b8cdbe46eeb043dc52e64b603')

prepare() {
  cd "$pkgname"

  sed -i 's/\/local//g' conf/postallow.conf # Check where SPF-Tools are installed
  sed -i 's/sbin/bin/g' conf/postallow.conf
}

package() {
  cd "$pkgname"
  
  # binary
  install -Dm754 postallow -t "$pkgdir"/usr/bin

  # configuration files
  for conf_file in conf/*; do install -Dm644 "${conf_file}" -t \
    "${pkgdir}/etc/$pkgname"; done

  # File with static yahoo mailer host addresses. Will probably be removed in a future release.
  install -Dm644 yahoo_static_hosts.txt -t "$pkgdir"/usr/share/$pkgname

  # Scripts for obtaining IP addresses of a few mailer hosts
  for script_file in scripts/*; do install -Dm754 "${script_file}" -t \
    "${pkgdir}/usr/share/${pkgname}/scripts"; done

  # man pages
  install -Dm 644 man/postallow.1.gz -t "$pkgdir"/usr/share/man/man1
  install -Dm 644 man/postallow.conf.5.gz -t "$pkgdir"/usr/share/man/man5

  # documentation
  install -Dm644 README.md -t "$pkgdir"/usr/share/doc/$pkgname

  # license
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
