pkgname=postallow
pkgver=4.0.0
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
# NOTE: switch to #tag=${pkgver} once the Makefile is merged to main
source=("${pkgname}::git+https://github.com/edmundlod/${pkgname}.git#branch=feat/makefile")
#source=("${pkgname}"::"git+https://codeberg.org/peregrinus13/"${pkgname}".git#commit="$_commit"")
validpgpkeys=('E7AAC21597965C6259108D6F471F22BDE25DD664')
# The above is the fingerprint for key-id 0x471F22BDE25DD664
b2sums=('SKIP')

prepare() {
  cd "$pkgname"

  sed -i 's/\/local//g' conf/postallow.conf # Arch installs to /usr, not /usr/local
  sed -i 's/sbin/bin/g' conf/postallow.conf  # Arch uses /usr/bin, not /usr/sbin
}

package() {
  cd "$pkgname"

  make -s install \
    PREFIX=/usr \
    SYSCONFDIR=/etc \
    DESTDIR="$pkgdir" \
    COMPRESS_MAN=yes

  # Arch convention: license goes under /usr/share/licenses (make installs to DOCDIR only)
  install -Dm644 LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname
}
