# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=coredns
gopkgname='github.com/coredns/coredns'
pkgver=1.7.0
pkgrel=1
pkgdesc="A DNS server that chains plugins"
makedepends=('go' 'make')
conflicts=('coredns-bin')
arch=('i686' 'x86_64')
url="https://github.com/coredns/coredns"
license=('Apache')
provides=('coredns')
source=(coredns-${pkgver}.tar.gz::https://github.com/coredns/${pkgname}/archive/v${pkgver}.tar.gz
coredns.service
coredns-sysusers.conf)

sha256sums=('7e436e9d0c0b84af863685e05d701b84247bb0f12b6dbf05ea87e165c1398b2b'
            '030cd8e938c293c11a9acdb09b138f98b37874772072336792ec4bf0d9eff9b1'
            '536d03f8b20b0d2d6e8f96edd7e4e4dd7f6fef39ab0e952522d8725f3cc186b7')

prepare() {
  export GOPATH="$srcdir/build"
  rm -rf "$GOPATH/src/$gopkgname"
  mkdir --parents `dirname "$GOPATH/src/$gopkgname"`
  mv -Tv "$srcdir/$pkgname-${pkgver}" "$GOPATH/src/$gopkgname"
}

build() {
  export GOPATH="$srcdir/build"
  export PATH=$GOPATH/bin:$PATH
  cd $GOPATH/src/$gopkgname
  make GOPATH=$GOPATH coredns
}

package() {
  install -Dm755 "$srcdir/build/src/$gopkgname/coredns" "$pkgdir/usr/bin/coredns"
  install -Dm644 "$srcdir/coredns.service" "$pkgdir/usr/lib/systemd/system/coredns.service"
  install -Dm644 "$srcdir/coredns-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/coredns.conf"
  install -d "${pkgdir}/etc/coredns"
}
