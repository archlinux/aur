# Maintainer: Lorenzo Fontana <lo@linux.com>
pkgname=coredns
gopkgname='github.com/coredns/coredns'
pkgver=v1.1.3
pkgrel=1
pkgdesc="CoreDNS is a DNS server that chains plugins"
makedepends=('go' 'make')
conflicts=('coredns-bin')
arch=('i686' 'x86_64')
url="https://github.com/coredns/coredns"
license=('Apache')
provides=('coredns')
source=(coredns-${pkgver}.tar.gz::https://github.com/coredns/${pkgname}/archive/${pkgver}.tar.gz
https://raw.githubusercontent.com/coredns/deployment/39c9f7ed7640f86fa0fb6ba06a88e9afa830b306/systemd/coredns.service
https://raw.githubusercontent.com/coredns/deployment/39c9f7ed7640f86fa0fb6ba06a88e9afa830b306/systemd/coredns-sysusers.conf)


sha256sums=('db43032820a8c4d66741e7f03197868fa9a9b2456f15dfd60a2315ee1579f450'
'947b4838af48212ecd8e565155c97ca61ff7d408d0b8622499925b6e232656c4'
'178c632fd855a5a35ae69e13ab554d5abad696cf75d23c6b6b37f0ace3b4b0f2')

prepare() {
  export GOPATH="$srcdir/build"
  rm -rf "$GOPATH/src/$gopkgname"
  mkdir --parents `dirname "$GOPATH/src/$gopkgname"`
  mv -Tv "$srcdir/$pkgname-${pkgver//v/}" "$GOPATH/src/$gopkgname"
}

build() {
  export GOPATH="$srcdir/build"
  cd $GOPATH/src/$gopkgname
  make GOPATH=$GOPATH godeps
  make GOPATH=$GOPATH
}

package() {
  install -Dm755 "$srcdir/build/src/$gopkgname/coredns" "$pkgdir/usr/bin/coredns"
  install -Dm644 "$srcdir/coredns.service" "$pkgdir/usr/lib/systemd/system/coredns.service"
  install -Dm644 "$srcdir/coredns-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/coredns.conf"
  install -d "${pkgdir}/etc/coredns"
}
