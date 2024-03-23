# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='soupault-bin'
_pkgname="${pkgname/-bin}"
pkgver=4.9.0
pkgrel=1
pkgdesc='Static website generator based on HTML element tree rewriting (pre-compiled)'
arch=('x86_64')
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

sha256sums=(
  '8d8391b50202f553faed21b98df0fdb576f88a7a096e714889815b85708925bb'
  'a50c111a4ec37d5901b58e62dd04afcf0e9b99d89640b6d58bf2cbbe7132da31'
)

# eof
