# Maintainer: redfish <redfish@galactica.pw>

pkgname=ncprop279
pkgver=0.0.3
pkgrel=1

pkgdesc='Bridge between Tor Prop279 clients and Namecoin'
url='https://github.com/namecoin/ncprop279'
arch=(x86_64 armv7h)
license=(GPL-3)

depends=('stemns')
optdepends=(
	'namecoin-core: Namecoin node to use'
	'tor: Tor node to serve'
)
makedepends=(go)
install=ncprop279.install
backup=("etc/ncprop279.conf")

source=($pkgname-$pkgver.tar.gz::https://github.com/namecoin/ncprop279/archive/v${pkgver}.tar.gz
	ncprop279.conf)

prepare() {
  export GOPATH=$srcdir/$pkgname-$pkgver/_build
  go get -t -d github.com/namecoin/ncprop279/...
}

build() {
  cd $srcdir/$pkgname-$pkgver

  export GOPATH=$srcdir/$pkgname-$pkgver/_build

  # documented in ncdns
  pushd $GOPATH/src/github.com/namecoin/x509-signature-splice
  go generate github.com/namecoin/x509-signature-splice/...
  popd

  go get -t github.com/namecoin/ncprop279/...
}

package() {
  cd $srcdir/$pkgname-$pkgver
  export GOPATH=$srcdir/$pkgname-$pkgver/_build
  install -Dm 755 $GOPATH/bin/ncprop279 "$pkgdir/usr/bin/ncprop279"
  install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -Dm 644  "$srcdir"/ncprop279.conf "$pkgdir/etc/ncprop279.conf"
}

sha512sums=('dcbe6d262f6c49330cd3cb068bfd83821c0b1d6c20ac12bff693da784aba451dc6f43bdabe54d09e344a872b2106490413900c969072b7ef932b519c2f19af81'
            'ea0f7f335ecbd73bdbca56334d1569b5dcffb35c727fa11c540af771eebe6a0461218672469518c8bf6977cea7d101bbc49d55071b7136c0341a5264f3afd29a')
