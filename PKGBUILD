# Maintainer: redfish <redfish@galactica.pw>

pkgname=ncdns
pkgver=0.0.10.3
pkgrel=1

pkgdesc='Namecoin to DNS bridge daemon'
url='https://github.com/namecoin/ncdns'
arch=(x86_64 armv7h)
license=(GPL-3)

depends=(libcap)
optdepends=('namecoin-core: the Namecoin node')
makedepends=(go)
install="ncdns.install"
backup=("etc/ncdns.conf")

source=($pkgname-$pkgver.tar.gz::https://github.com/namecoin/ncdns/archive/v${pkgver}.tar.gz
	ncdns.service)

prepare() {
  export GOPATH=$srcdir/$pkgname-$pkgver/_build
  go get -t -d github.com/namecoin/ncdns/...
}

build() {
  cd $srcdir/$pkgname-$pkgver

  export GOPATH=$srcdir/$pkgname-$pkgver/_build

  # make # fails due to generate step not being run for x509-signature-splice

  pushd $GOPATH/src/github.com/namecoin/x509-signature-splice
  go generate github.com/namecoin/x509-signature-splice/...
  popd

  go get -t github.com/namecoin/ncdns/...
}

package() {
  cd $srcdir/$pkgname-$pkgver
  export GOPATH=$srcdir/$pkgname-$pkgver/_build
  install -Dm 755 $GOPATH/bin/ncdns "$pkgdir/usr/bin/ncdns"
  install -Dm 644 "$srcdir"/ncdns.service "$pkgdir/usr/lib/systemd/system/ncdns.service"
  install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname" README.md _doc/ncdns.conf.example
  # we copy from template, but user must edit the conf file before starting service
  install -Dm 644  _doc/ncdns.conf.example "$pkgdir/etc/ncdns.conf"
}

sha512sums=('6e6d25989edbcdf963c0e4275fe164a0726c142a0acbf7fe3e74c2a18da7dcf2fbe8f0a3a5877ac7b551614ff227dd085490c9cfab6c8dce8e891badd87087a0'
            '4fca961ae7fc17fbb159dc6cfe3bf6be52b7e1423f0c04591100780a72f250cb87263e3eb736b363d2e67dbd8485018cbaa720ccaa4450bb93d220f802b4be40')
