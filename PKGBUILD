# Maintainer: M0Rf30

_pkgname=fabric
pkgname=hyperledger-${_pkgname}
pkgver=1.0.3
pkgrel=1
pkgdesc="A platform for distributed ledger solutions, underpinned by a modular architecture delivering high degrees of confidentiality, resiliency, flexibility and scalability"
arch=(armv6h armv7h arm i686 x86_64)
url="https://github.com/hyperledger/fabric"
license=('APACHE')
groups=('hyperledger')
depends=('go' 'docker')
makedepends=('git')
install=$pkgname.install
source=("https://github.com/hyperledger/fabric/archive/v$pkgver.tar.gz"
	arm-support.patch)
export GOOS=linux
case "$CARCH" in
  x86_64) export GOARCH=amd64 ;;
  i686) export GOARCH=386 GO386=387 ;;
  arm) export GOARCH=arm GOARM=5 ;;
  armv6h) export GOARCH=arm GOARM=6 ;;
  armv7h) export GOARCH=arm GOARM=7 ;;
  aarch64) export GOARCH=arm64 ;;
esac

prepare() {
  cd $srcdir/${_pkgname}-$pkgver
  patch -Np1 -i ../arm-support.patch
  cd ..
  export GOPATH="$PWD"/.gopath
  mkdir -p "$GOPATH"/src/github.com/hyperledger
  ln -sf "$PWD"/fabric-$pkgver "$GOPATH"/src/github.com/hyperledger/fabric
}

build() {
  export GOPATH="$PWD"/.gopath
  cd "$GOPATH"/src/github.com/hyperledger/fabric
  make release/linux-$GOARCH 
}

package() {
  cd $srcdir/${_pkgname}-$pkgver
  install -Dm 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  cp -r release/linux-$GOARCH/bin "$pkgdir/usr"
  mkdir -p $pkgdir/etc/hyperledger/fabric
  cp -r sampleconfig/* $pkgdir/etc/hyperledger/fabric

  mkdir -p $pkgdir/var/hyperledger/{db,production}

}

md5sums=('f2bb35c77b4a4070f017b723884a2761'
         '6828396533a5cf1522465872a83a50de')
