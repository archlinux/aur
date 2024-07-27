# Maintainer: Mantas <grawity at gmail dot com>
# Contributor: Klaus Alexander Seiﬆrup <klaus at seistrup dot dk>
# -*- sh -*-

pkgname=nncp
pkgver=8.11.0
pkgrel=1
pkgdesc="Node-to-Node Copy Protocol utilities for secure store-and-forward"
url="http://www.nncpgo.org/"
arch=('aarch64' 'x86_64')
license=('GPL-3.0-or-later')  # SPDX-License-Identifier: GPL-3.0-or-later
depends=('glibc')
makedepends=('go')
options=('lto')
source=(
  "http://www.nncpgo.org/download/nncp-$pkgver.tar.xz"
  "http://www.nncpgo.org/download/nncp-$pkgver.tar.xz.asc"
  nncp.sysusers
  nncp.tmpfiles
  nncp-daemon.service
  nncp-uucp.socket
  nncp-uucp@.service
)
sha256sums=(
  'ec4114bcd9184aa8781f38dbaa3aa04255dfbba9c3536bf75969e66bc334aff2'
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

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  export PREFIX="/usr"
  export CFGPATH="/etc/nncp/nncp.hjson"

  bin/build
}

check() {
  cd "$pkgname-$pkgver"

  bin/nncp-daemon -version
}

package() {
  cd "$pkgname-$pkgver"

  export PREFIX="/usr"
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
