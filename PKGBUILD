# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='jedstate-git'
_pkgname="${pkgname/-git/}"
pkgver=1.0.0.r2.g85c435b
pkgrel=2
pkgdesc='S-Lang module for the JED editor to remember its cursor position across invocations (built from latest commit)'
arch=('any')
url='https://codeberg.org/kas/jedstate'
license=('AGPL-3.0-or-later')  # SPDX-License-Identifier: AGPL-3.0-or-later
depends=('jed')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
md5sums=('SKIP')
install="$pkgname.install"

pkgver() {
  cd "$_pkgname"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"

  bin/byte-comp
}

package() {
  cd "$_pkgname"

  install -vDm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  cd "src"

  install -vDm0644 -t "$pkgdir/usr/share/jed/lib" \
    jedstate.sl{,c}

  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    jedstate-hooks.sl

  test -f jedstate-prune-nonexistent && \
    install -vDm0755 -t "$pkgdir/usr/bin" \
      jedstate-prune-nonexistent
}

# eof
