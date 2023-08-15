# Maintainer: Mantas <grawity at gmail dot com>
# Contributor: Klaus Alexander Seiﬆrup <klaus at seistrup dot dk>
# -*- sh -*-

pkgname=nncp
pkgver=8.9.0
pkgrel=2
pkgdesc="Node-to-Node Copy Protocol utilities for secure store-and-forward"
url="http://www.nncpgo.org/"
arch=(x86_64 aarch64)
license=(GPL3)
depends=(glibc)
makedepends=(go)
#source=("git://git.cypherpunks.ru/nncp.git#commit=$_commit")
source=("http://www.nncpgo.org/download/nncp-$pkgver.tar.xz"
        "http://www.nncpgo.org/download/nncp-$pkgver.tar.xz.asc"
        nncp.sysusers
        nncp.tmpfiles
        nncp-daemon.service
        nncp-uucp.socket
        nncp-uucp@.service)
sha256sums=('259facbc3354edcc16e7c64e278aaccdb47ffa3ec2afea0b36283f46aa824b5d'
            'SKIP'
            '81d3d892da555eb1e5fc764788e18e21ab9293ca1d4bd8febc27fed1ea403fb6'
            'd2ebd1bafc630b013041c62035fac454cf151049712f87b2876fe63282851c71'
            '4e343b2914b0955270d0958d0b579ad986eb6049d1b1c16e95ef3fe496e2216d'
            '9efee582d01776fb489eaa0c3c02a0629cae537794bbcb00eef13a55bbe7d818'
            '319b302a4613b541d1feeb5ad19a290be79d5ac619a6800ed77580c7c8d34801')
validpgpkeys=('92C2F0AEFE73208E46BFF3DE2B25868E75A1A953')

backup=(etc/nncp/nncp.hjson)

build() {
  cd $pkgname-$pkgver

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  export PREFIX="/usr"
  export CFGPATH="/etc/nncp/nncp.hjson"

  bin/build
}

package() {
  cd $pkgname-$pkgver

  export PREFIX="/usr"
  export CFGPATH="/etc/nncp/nncp.hjson"

  export DESTDIR="$pkgdir"
  export INFODIR="$pkgdir/usr/share/info"

  ./install

  install -Dm0644 "$srcdir"/nncp.sysusers \
                    "$pkgdir"/usr/lib/sysusers.d/nncp.conf
  install -Dm0644 "$srcdir"/nncp.tmpfiles \
                    "$pkgdir"/usr/lib/tmpfiles.d/nncp.conf

  # The configuration file holds private keys,
  # so we do not want to set the world readable bit
  "$srcdir/$pkgname-$pkgver/bin/nncp-cfgnew" >nncp.hjson && \
    install -Dm0640 nncp.hjson "$pkgdir/etc/nncp/nncp.hjson"

  # TODO: nncp-caller
  # TODO: nncp-toss
  # TODO: nncp-check
  for unit in nncp-{daemon,uucp@}.service \
              nncp-uucp.socket; do
    install -Dm0644 "$srcdir"/$unit \
                      "$pkgdir"/usr/lib/systemd/system/$unit
  done
}

# vim: ts=2:sw=2:et:
