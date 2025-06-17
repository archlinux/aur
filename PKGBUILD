# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: mcode10 <manas at designX6 dot com>

pkgname='soupault-bin'
_pkgname="${pkgname/-bin}"
pkgver=5.1.0
pkgrel=1
pkgdesc='Static website generator based on HTML element tree rewriting (pre-compiled)'
arch=('aarch64' 'x86_64')
url='https://github.com/PataphysicalSociety/soupault'
license=(
  'MIT'           # SPDX-License-Identifier: MIT
  'CC-BY-SA-4.0'  # SPDX-License-Identifier: CC-BY-SA-4.0
)
makedepends=('minisign')
depends=()  # static binary
provides=("$_pkgname")
conflicts=("${provides[@]}")
_relpath="$url/releases/download/$pkgver"
_tarball="$_pkgname-$pkgver-linux-$CARCH.tar.gz"
#_plugins_url='https://soupault.app/files/plugins'
_plugins_url='https://raw.githubusercontent.com/PataphysicalSociety/soupault.app/refs/heads/main/assets/files/plugins/'
_plugins=(
  "$_plugins_url/collapsible-list.lua"
  "$_plugins_url/escape-html.lua"
  "$_plugins_url/generator-meta.lua"
  "$_plugins_url/git-timestamp.lua"
  "$_plugins_url/glossary.lua"
  "$_plugins_url/inline-include.lua"
  "$_plugins_url/inline-style.lua"
  "$_plugins_url/insert-if.lua"
  "$_plugins_url/quick-links.lua"
  "$_plugins_url/reading-time.lua"
  "$_plugins_url/safe-links.lua"
  "$_plugins_url/section-link-highlight.lua"
  "$_plugins_url/site-url.lua"
  "$_plugins_url/source-link.lua"
)
source=(
  "$_relpath/$_tarball"{,.minisig}
  "${_plugins[@]}"
)
# Let's rely on minisign only — see verify() below.
sha256sums=(
  'SKIP' 'SKIP' # Skip to my Lou!
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
)
install="$pkgname.install"

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

  cd ..
  install -vDm0644  -t "$pkgdir/usr/share/doc/$pkgname/plugins/" \
    ./*.lua

  cd "$pkgdir/usr/share/doc/"
  ln -vsrf "$pkgname" "$_pkgname"
}

# eof
