# Maintainer: Klaus Alexander Seistrup <klaus at seistrup dot 🇩🇰>
# Contributor: mcode10 <manas at designX6 dot com>
# -*- sh -*-

pkgname='soupault-bin'
_pkgname="${pkgname/-bin}"
pkgver=4.9.0
pkgrel=2
pkgdesc='Static website generator based on HTML element tree rewriting (pre-compiled)'
arch=('aarch64' 'x86_64')
url='https://github.com/PataphysicalSociety/soupault'
license=('MIT')  # SPDX-License-Identifier: MIT
makedepends=('minisign')
depends=()  # static binary
provides=("$_pkgname")
conflicts=("$_pkgname")
_relpath="$url/releases/download/$pkgver"
_tarball="$_pkgname-$pkgver-linux-$CARCH.tar.gz"
source=("$_relpath/$_tarball"{,.minisig})

_validminisignkey='RWRfW+gkhk/+iA7dOUtTio6G6KeJCiAEp4Zfozw7eqv2shN90+5z20Cy'

prepare() {
  cd "$srcdir" || exit 1

  cat <<EOF
Please notice that we are relying solely on the following
minisign signature for tampering protection:
EOF

  minisign -Vm "$_tarball" -P "$_validminisignkey" || exit 1
}

package() {
  cd "${_tarball/.tar.gz}" || exit 1

  install -vDm0755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -vDm0644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  for _doc in {CHANGELOG,README}.md; do
    install -vDm0644 "$_doc" "$pkgdir/usr/share/doc/$pkgname/$_doc"
  done
}

# Let's rely on minisign only
sha256sums=('SKIP' 'SKIP')  # Skip to my Lou!

# eof
