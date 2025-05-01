# -*- mode: sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: Dwight Schauer <dschauer@gmail.com>
# Contributor: Valere Monseur <valere_monseur@hotmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

_pkgname=regina
_pkgsuff=rexx

pkgname=(regina-rexx{,-doc})
pkgdesc='ANSI compliant REXX interpreter for multiple platforms'
epoch=1
pkgver=3.9.6
pkgrel=8
url='https://regina-rexx.sourceforge.io/'
source=(
  "https://downloads.sourceforge.net/regina-rexx/$_pkgname-$_pkgsuff-$pkgver.tar.gz"
)
license=('LGPL-2.0-or-later')  # SPDX-License-Identifier: LGPL-2.0-or-later
arch=('aarch64' 'armv7h' 'i686' 'x86_64')

build() {
  cd "$srcdir/$_pkgname-$_pkgsuff-$pkgver"

  # If the user wants to compile regina with another compiler, let them.
  # Use CC=gcc per default.
  test "Z$CC" = 'Z' && export CC='gcc'
  case "$CC" in
    # Appears to have problems with gcc v15.* otherwise
    *gcc ) export CFLAGS="$CFLAGS -std=gnu17" ;;
  esac

  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib \
    --sysconfdir=/etc

  make
}

package_regina-rexx() {
  changelog="${pkgname[0]}.changelog"
  depends=(
    'bash'
    'glibc'
    'libxcrypt'
    'ncurses'
    'readline'
  )
  case "Z$CC" in
    'Z' | 'Zgcc' ) depends+=('gcc-libs')
  esac
  optdepends=(
    'regina-rexx-doc: Demo scripts and PDF documentation for Regina REXX and regutil'
  )
  options=('!makeflags')
  provides=('libregina.so' 'regina' 'rexx')
  replaces=('regina-rexx-das')

  cd "$srcdir/$_pkgname-$_pkgsuff-$pkgver"

  make DESTDIR="$pkgdir" install

  # These can be found in the -doc package
  rm -vrf "$pkgdir/usr/share/regina-rexx/examples/"
}

package_regina-rexx-doc() {
  arch=('any')
  changelog="${pkgname[0]/-doc}.changelog"
  optdepends=('regina: Required to run demo scripts')
  pkgdesc='Documentation for Regina REXX and RegUtil (both in PDF), and some demo scripts'
  replaces=('regina-rexx-das-doc')

  cd "$srcdir/$_pkgname-$_pkgsuff-$pkgver"

  install -vDm0644 -t "$pkgdir/usr/share/doc/${pkgname[0]}" \
    doc/*.pdf
  install -vDm0644 -t "$pkgdir/usr/share/doc/${pkgname[0]}/examples" \
    demo/*.rexx
}

sha256sums=(
  'ed98c7a7f1d5a4148b02fef1b16aee4a6a6d8658d01a80cf5c503015ef01afa5'
)
b2sums=(
  'd869f9285e0fa0810b690d97932059aa6d3aaf0d99355bad18ffd480cc322a076928d08fce03893124a0ebd330a55ac9b6c580657e92601d8204a2a0b3c15406'
)

# eof
