# -*- mode: sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: Dwight Schauer <dschauer@gmail.com>
# Contributor: Valere Monseur <valere_monseur@hotmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

_pkgname=regina
_pkgsuff=rexx

pkgname=(regina-rexx{,-doc})
pkgdesc='An implementation of the ANSI Standard REXX Programming Language'
epoch=1
pkgver=3.9.6
pkgrel=4
url='https://regina-rexx.sourceforge.io/'
source=(
  "https://downloads.sourceforge.net/regina-rexx/$_pkgname-$_pkgsuff-$pkgver.tar.gz"
)
license=('LGPL-2.0-or-later')  # SPDX-License-Identifier: LGPL-2.0-or-later
arch=('aarch64' 'armv7h' 'i686' 'x86_64')

build() {
  cd "$srcdir/$_pkgname-$_pkgsuff-$pkgver"

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

  # If the user wants to compile regina with another compiler, let them.
  # Use CC=gcc per default.
  test "Z$CC" = 'Z' && export CC='gcc'

  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib \
    --sysconfdir=/etc

  make
}

package_regina-rexx() {
  changelog="$pkgname.changelog"
  depends=(
    'bash'
    'gcc-libs'  # strictly unneeded if CC != gcc
    'glibc'
    'libxcrypt'
    'ncurses'
    'readline'
  )
  optdepends=(
    'regina-rexx-doc: Demo scripts and PDF documentation for Regina REXX and regutil'
  )
  options=('lto' '!makeflags')
  provides=('libregina.so' 'rexx')
  replaces=('regina-rexx-das')

  cd "$srcdir/$_pkgname-$_pkgsuff-$pkgver"

  make DESTDIR="$pkgdir" install

  # These can be found in the -doc package
  rm -vrf "$pkgdir/usr/share/regina-rexx/examples/"
}

package_regina-rexx-doc() {
  arch=('any')
  changelog="${pkgname/-doc}.changelog"
  optdepends=(
    'regina-rexx: Required to run the demo scripts'
  )
  pkgdesc='Demo scripts and documentation for Regina REXX and regutil (PDF)'
  replaces=('regina-rexx-das-doc')

  cd "$srcdir/$_pkgname-$_pkgsuff-$pkgver"

  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    doc/*.pdf
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname/examples/" \
    demo/*.rexx
}

sha256sums=(
  'ed98c7a7f1d5a4148b02fef1b16aee4a6a6d8658d01a80cf5c503015ef01afa5'
)
b2sums=(
  'd869f9285e0fa0810b690d97932059aa6d3aaf0d99355bad18ffd480cc322a076928d08fce03893124a0ebd330a55ac9b6c580657e92601d8204a2a0b3c15406'
)

# eof
