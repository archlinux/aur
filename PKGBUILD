# -*- sh -*-

#  Maintainer: Klaus Alexander Seistrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

_pkgname=w3m-rkta
_gitbranch='gemini'
pkgname="$_pkgname-git"
pkgver=0.5.5.r2.g5238aed
pkgrel=2
pkgdesc="Rene Kita's fork of the text-based web browser/pager w3m with gemini support (development version)"
url='https://git.sr.ht/~rkta/w3m'
license=('LicenseRef-W3M')  # SPDX-License-Identifier: LicenseRef-W3M
arch=('aarch64' 'x86_64')
makedepends=('git')
depends=(
  'gc'
  'glibc'
  'gpm'
  'imlib2'
  'libx11'
  'ncurses'
  'openssl'
  'perl'
  'sh'
  'zlib'
)
source=("$pkgname::git+$url#branch=$_gitbranch")
sha256sums=('SKIP')
provides=('w3m')
conflicts=("${provides[@]}")

pkgver() {
  cd "$pkgname"

  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/^v//;s/-/./g' ||
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

# There are three important branches: master, next and oldstable.
# Additionally there is a branch gemini which is just branch master but
# with a patch to add support for the gemini protocol and hypertext format.

build() {
  cd "$pkgname"

  _opts=(
    '--prefix=/usr'
    '--sysconfdir=/etc'
    '--libexecdir=/usr/lib'
    '--disable-w3mmailer'
    '--enable-image=x11,fb'
    '--with-imagelib=imlib2'
    '--with-termlib=ncurses'
  )

  ./configure "${_opts[@]}"

  make
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir" install

  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" doc/*
  install -vDm0644 doc/README "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# eof
