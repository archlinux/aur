# -*- sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: Mantas <grawity at gmail dot com>

pkgname=nncp
pkgver=8.13.0
pkgrel=1
pkgdesc='Node-to-Node Copy Protocol utilities for secure store-and-forward'
url='http://www.nncpgo.org/'
arch=('aarch64' 'x86_64')
license=('GPL-3.0-or-later')  # SPDX-License-Identifier: GPL-3.0-or-later
depends=('glibc')
makedepends=('go')
optdepends=(
  'hjson-cli: for manipulating HJSON files'
  'python-hjson: for manipulating HJSON files'
  'pinfo: for reading the package documentation'
  'texinfo: for reading the package documentation'
)
_url='http://www.nncpgo.org/download'             # Original: no https
_mirror='https://nncp.mirrors.quux.org/download'  # Mirror
_source="$_mirror"
source=(
  "$_source/nncp-$pkgver.tar.xz"
  "$_source/nncp-$pkgver.tar.xz.asc"
  nncp.sysusers
  nncp.tmpfiles
  nncp-daemon.service
  nncp-uucp.socket
  nncp-uucp@.service
)
changelog="$pkgname.changelog"
sha256sums=(
  '8ce3680e98005198d8975e031760b3a9b33be6d2d61844c799f778ca233d05f4'
  'SKIP'
  '81d3d892da555eb1e5fc764788e18e21ab9293ca1d4bd8febc27fed1ea403fb6'
  'd2ebd1bafc630b013041c62035fac454cf151049712f87b2876fe63282851c71'
  '4e343b2914b0955270d0958d0b579ad986eb6049d1b1c16e95ef3fe496e2216d'
  '9efee582d01776fb489eaa0c3c02a0629cae537794bbcb00eef13a55bbe7d818'
  '319b302a4613b541d1feeb5ad19a290be79d5ac619a6800ed77580c7c8d34801'
)
validpgpkeys=('92C2F0AEFE73208E46BFF3DE2B25868E75A1A953')

install='nncp.install'
backup=('etc/nncp/nncp.hjson')

build() {
  cd "$pkgname-$pkgver"

  # Fix “ELF file lacks GNU_PROPERTY_*_FEATURE_1_SHSTK” error message
  case "Z$CARCH" in
    'Zaarch64' | 'Zx86_64' )
      export LDFLAGS="$LDFLAGS -Wl,-z,shstk"
    ;;
  esac

  export CGO_ENABLED=1
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  export PREFIX="/usr"
  export CFGPATH="/etc/nncp/nncp.hjson"

  ./build
}

check() {
  cd "$pkgname-$pkgver"

  bin/nncp -version
}

package() {
  cd "$pkgname-$pkgver"

  export PREFIX="/usr"

  # See ./config for these variables:
  export CFGPATH="/etc/nncp/nncp.hjson"
  export DESTDIR="$pkgdir"
  export INFODIR="$pkgdir/usr/share/info"

  ./install

  install -vDm0644 "$srcdir/nncp.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/nncp.conf"
  install -vDm0644 "$srcdir/nncp.tmpfiles" \
    "$pkgdir/usr/lib/tmpfiles.d/nncp.conf"

  # TODO: nncp-caller
  # TODO: nncp-toss
  # TODO: nncp-check
  for _unit in nncp-{daemon,uucp@}.service nncp-uucp.socket; do
    install -vDm0644 "$srcdir/$_unit" \
      "$pkgdir/usr/lib/systemd/system/$_unit"
  done
}

# vim: ts=2:sw=2:et:
