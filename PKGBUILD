#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: Dwight Schauer <dschauer@gmail.com>
# Contributor: Valere Monseur <valere_monseur@hotmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# -*- sh -*-

_pkgname=regina
_pkgsuffix=rexx

pkgname=regina-rexx-das
pkgver=3.9.6
pkgrel=1
pkgdesc='An implementation of a ReXX interpreter, compliant with the ANSI Standard for Rexx (1996)'
arch=('aarch64' 'i686' 'x86_64')
url='http://regina-rexx.sourceforge.io/'
license=('LGPL-2.0-or-later')  # SPDX-License-Identifier: LGPL-2.0-or-later
depends=(
  'bash'
  'gcc-libs'
  'glibc'
  'libxcrypt'
  'ncurses'
  'readline'
)
provides=('rexx')
options=('lto' '!makeflags')
source=(
  "https://downloads.sourceforge.net/regina-rexx/$_pkgname-$_pkgsuffix-$pkgver.tar.gz"
)
changelog="$pkgname.changelog"

build() {
  cd "$srcdir/$_pkgname-$_pkgsuffix-$pkgver"

  # RFC-0023
  # 🔗 https://rfc.archlinux.page/0023-pack-relative-relocs/
  #
  # ld(1) says: “Supported for i386 and x86-64.”
  case "Z${CARCH:-unknown}" in
    'Zx86_64' | 'Zi386' )
      export LDFLAGS="$LDFLAGS -Wl,-z,pack-relative-relocs"
    ;;
    * ) : pass ;;
  esac

  env CC=gcc ./configure \
    --prefix=/usr \
    --libdir=/usr/lib \
    --sysconfdir=/etc

  make
}

package() {
  cd "$srcdir/$_pkgname-$_pkgsuffix-$pkgver"

  make DESTDIR="$pkgdir" install

  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    doc/*.pdf
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname/demo/" \
    demo/*.rexx
}

sha256sums=(
  'ed98c7a7f1d5a4148b02fef1b16aee4a6a6d8658d01a80cf5c503015ef01afa5'
)
b2sums=(
  'd869f9285e0fa0810b690d97932059aa6d3aaf0d99355bad18ffd480cc322a076928d08fce03893124a0ebd330a55ac9b6c580657e92601d8204a2a0b3c15406'
)

# eof
