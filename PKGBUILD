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
pkgver=3.9.7
pkgrel=3
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

  # Build will fail for N>2,
  # so let's play it safe and use a maximum of two make threads:
  _nproc=$(nproc 2>/dev/null || echo 1)
  case "$_nproc" in
    1|2) _jobs="$_nproc" ;;
      *) _jobs=2 ;;
  esac
  make "-j$_jobs"
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
  'f13701ebd542e74d0fc83b2a7876a812b07d21e43400275ed65b1ac860204bd4'
)
b2sums=(
  '96908aea8327703c22d7d2c7e70781e51bd11fc7473736963f85604d8014e5f561796f8743b8c6d23c4a2fd8ee3f1ebd2afa44134d3652c6b57f4f113b206f01'
)

# eof
