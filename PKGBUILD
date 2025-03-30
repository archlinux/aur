# -*- mode: sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: Denis Kasak <dkasak|AT|termina.org.uk>
# Contributor: Hilton Medeiros <medeiros.hilton at gmail tod com>
# Contributor: Tony Dodd <arch@recalcitrance.net>
# Contributor: Mark Taylor <skymt0@gmail.com>

_pkgname='contextfree'
pkgname="$_pkgname-git"
pkgver=3.4.2.2.r5.gc5f00522
pkgrel=1
epoch=1
pkgdesc='Generates images from written instructions called a grammar (latest commit)'
arch=('aarch64' 'i686' 'x86_64')
url='https://github.com/MtnViewJohn/context-free'
license=('GPL-2.0-or-later')  # SPDX-License-Identifier: GPL-2.0-or-later
depends=('gcc-libs' 'glibc' 'icu' 'libpng')
makedepends=('bison' 'flex' 'git')
source=("git+$url.git")
sha256sums=('SKIP')
options=('lto')
provides=("$_pkgname")
conflicts=("${provides[@]}")

_srcdir='context-free'

pkgver() {
  cd "$_srcdir"

  git describe --tags --long \
  | sed 's/^Version//;s/^v//;s/\([^-]*-g\)/r\1/;s/[-_]/./g'
}

prepare() {
  cd "$_srcdir"

  make clean
  sed -i 's/c++14/c++17/' Makefile
}

build() {
  cd "$_srcdir"

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

  make
}

package() {
  cd "$_srcdir"

  install -vDm0755 -t "$pkgdir/usr/bin" cfdg

  install -vdm0755 "$pkgdir/usr/share/$pkgname"
  cp -vrf  input   "$pkgdir/usr/share/$pkgname/examples"
}

# eof
