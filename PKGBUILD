pkgname=nncp
pkgver=8.7.2
pkgrel=3
pkgdesc="Node-to-Node Copy Protocol utilities for secure store-and-forward"
url="http://www.nncpgo.org/"
arch=(x86_64)
license=(GPL3)
makedepends=(go)
#source=("git://git.cypherpunks.ru/nncp.git#commit=$_commit")
source=("http://www.nncpgo.org/download/nncp-$pkgver.tar.xz"
        "http://www.nncpgo.org/download/nncp-$pkgver.tar.xz.sig"
        nncp.sysusers)
sha256sums=('a0eec9b0f33059de33f13084599805d0f4a1c8c379e925bacfe8dc94d1ddc23d'
            'SKIP'
            '81d3d892da555eb1e5fc764788e18e21ab9293ca1d4bd8febc27fed1ea403fb6')
validpgpkeys=('92C2F0AEFE73208E46BFF3DE2B25868E75A1A953')

backup=(etc/nncp/nncp.json)

build() {
  cd $pkgname-$pkgver

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  export PREFIX="/usr"
  export CFGPATH="/etc/nncp/nncp.hjson"

  contrib/do all
}

package() {
  cd $pkgname-$pkgver

  export PREFIX="/usr"
  export CFGPATH="/etc/nncp/nncp.hjson"

  export DESTDIR="$pkgdir"
  export INFODIR="$pkgdir/usr/share/info"

  contrib/do install

  install -Dm0644 "$srcdir"/nncp.sysusers \
                  "$pkgdir"/usr/lib/sysusers.d/nncp.conf
}

# vim: ts=2:sw=2:et:
