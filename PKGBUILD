# -*- mode: sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='gpp-git'
_pkgname="${pkgname/-git/}"
pkgver=2.28.r0.gfc9cc00
pkgrel=3
pkgdesc='General-purpose preprocessor with customizable syntax (development version)'
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url='https://github.com/logological/gpp'
source=("git+$url.git")
license=(
  'GPL-3.0-or-later'   # SPDX-License-Identifier: GPL-3.0-or-later
  'LGPL-3.0-or-later'  # SPDX-License-Identifier: LGPL-3.0-or-later
)
provides=("$_pkgname")
conflicts=("${provides[@]}")
depends=('glibc')
makedepends=('git')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"

  aclocal \
  && autoheader \
  && automake --add-missing \
  && autoconf \
  && ./configure \
       --prefix='/usr' \
       --docdir="/usr/share/doc/$pkgname" \
       --mandir='/usr/share/man'

  make
}

check() {
  cd "$_pkgname"

  src/gpp --version
}

package() {
  cd "$_pkgname"

  make DESTDIR="$pkgdir" install

  rm -vf "$pkgdir/usr/share/doc/$pkgname/gpp.1"

  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    AUTHORS NEWS README.md THANKS
}

# eof
