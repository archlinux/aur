# shellcheck shell=bash
# -*- sh -*-

#  Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

_pkgname='fish-hydro'
pkgname="$_pkgname-git"
pkgdesc='Ultra-pure, lag-free fish shell prompt with async git status (development version)'
pkgver=r140.gf130b55
pkgrel=1
url='https://github.com/jorgebucaran/hydro'
arch=('any')
groups=('fish-plugins')
license=('MIT')  # SPDX-Licensen-Identifier: MIT
makedepends=('findutils' 'git')
depends=('fish')
provides=("$_pkgname" 'fish-prompt')
conflicts=("$_pkgname")
replaces=('hydro-git')
options=('!strip')
source=("$_pkgname::git+$url.git?signed")
validpgpkeys=('CA88B7CBEDCEE375F2376C53E54BA3C0E646DB30')  ## Jorge Bucaran
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

package() {
  cd "$_pkgname"

  install -Dm0644 -t "$pkgdir/usr/share/fish/vendor_conf.d/" conf.d/hydro.fish
  find functions -type f -name '*.fish' -exec install -Dm0644 -t "$pkgdir/usr/share/fish/vendor_functions.d/" '{}' \+
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md

  for _dir in doc licenses; do
    cd "$pkgdir/usr/share/$_dir" || continue
    ln -srf "$pkgname" "$_pkgname"
  done
}

# eof
