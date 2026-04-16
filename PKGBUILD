# Maintainer: Edmund Lodewijks <edmund at proteamail.com>

pkgname=postallow
pkgver=4.4.1
pkgrel=1
pkgdesc="Modern, non-root Postfix (Postscreen) allowlist generator, based on SPF records"
arch=(any)
url="https://github.com/edmundlod/postallow"
license=('MIT')
depends=('glibc' 'bash' 'spf-tools' 'route-summarization' 'postfix')
optdepends=(
    'knot-resolver: strongly recommended for DNS lookups (or any other caching DNS resolver)'
)
makedepends=('git')
source=(
    "${pkgname}::git+https://github.com/edmundlod/${pkgname}.git#tag=v${pkgver}"
    "${pkgname}.sysusers"
    "${pkgname}.tmpfiles"
    )
b2sums=('d96ab06deb4536bcbeec50930ea167873c14901d521dafb3e2f9a83399508a8ed12b71a2ed93d0d84b98b657f55b9c2572a5f6c5987122945d715c50fb808455'
        'c437362d1ede12d6829053fae57aade1e3c3206b70dc5cb83b6acd23415a37e59d9a55be1bc28b4707de0f01e96fbfe0784bee095fcc5a7f55832b1d72f7dccd'
        '7c1da48e78a8db373dbda6f9d83a2b20a723b204e88563a01bdeb447d57e2d23d9e2aa0e9c5c8e8185f005c6c1b3e5b9bed50b7a50b55511891a6ebb1a4478c5')

package() {
  cd "$pkgname"

  make -s install \
    PREFIX=/usr \
    SYSCONFDIR=/etc \
    DESTDIR="$pkgdir" \
    COMPRESS_MAN=yes

  # Create postallow user, group, and home dir
  install -Dm644 ../postallow.sysusers "$pkgdir/usr/lib/sysusers.d/postallow.conf"
  install -Dm644 ../postallow.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/postallow.conf"

  # Arch convention: license goes under /usr/share/licenses (make installs to DOCDIR only)
  install -Dm644 LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname
}
