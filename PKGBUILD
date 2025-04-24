# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: mcode10 <manas at designX6 dot com>

pkgname='soupault-bin'
_pkgname="${pkgname/-bin}"
pkgver=5.0.0
pkgrel=1
pkgdesc='Static website generator based on HTML element tree rewriting (pre-compiled)'
arch=('aarch64' 'x86_64')
url='https://github.com/PataphysicalSociety/soupault'
license=('MIT')  # SPDX-License-Identifier: MIT
makedepends=('minisign')
depends=()  # static binary
provides=("$_pkgname")
conflicts=("${provides[@]}")
_relpath="$url/releases/download/$pkgver"
_tarball="$_pkgname-$pkgver-linux-$CARCH.tar.gz"
source=("$_relpath/$_tarball"{,.minisig})
# Let's rely on minisign only — see verify() below.
sha256sums=('SKIP' 'SKIP')  # Skip to my Lou!

_validminisignkey='RWRfW+gkhk/+iA7dOUtTio6G6KeJCiAEp4Zfozw7eqv2shN90+5z20Cy'

verify() {
  minisign -Vm "$_tarball" -P "$_validminisignkey" || exit 1
}

package() {
  cd "${_tarball/.tar.gz}" || exit 1

  install -vDsm0755 -t "$pkgdir/usr/bin/" \
    soupault
  install -vDm0644  -t "$pkgdir/usr/share/doc/$pkgname/" \
    {CHANGELOG,README}.md
  install -vDm0644  -t "$pkgdir/usr/share/licenses/$pkgname/" \
    LICENSE
}

# eof
