# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname=govpn
pkgver=2.2
pkgrel=1
pkgdesc="Simple secure free software VPN daemon"
arch=('i686' 'x86_64')
url="http://www.cypherpunks.ru/govpn/"
makedepends=('go' 'plantuml') # PlantUML is for generating HTML docs only.
license=('GPL')
source=(https://github.com/stargrave/${pkgname}/archive/${pkgver}.tar.gz)
noextract=("${pkgver}.tar.gz")
sha256sums=('25c8b3171296c68f12f48a9da1e7049821b7da8eeffd6eee73e6f87b662b3796')

build() {
  mkdir -p $pkgname/src
  tar xfC ${pkgver}.tar.gz $pkgname/src
  mv $pkgname/src/$pkgname-$pkgver $pkgname/src/$pkgname
  export GOPATH=$(pwd)/$pkgname:$GOPATH
  cd $pkgname/src/$pkgname
  make

  # Generating HTML docs with PlantUML.
  cd doc
  make
}

package() {
  cd $srcdir/$pkgname/src/$pkgname
  install -D govpn-client $pkgdir/usr/bin/govpn-client
  install -D govpn-server $pkgdir/usr/bin/govpn-server
  mkdir -p $pkgdir/usr/share/doc/$pkgname/
  install -Dm644 doc/${pkgname}.html/* $pkgdir/usr/share/doc/$pkgname/
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
