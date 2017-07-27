# Maintainer: M0Rf30

_pkgname=fabric
pkgname=hyperledger-${_pkgname}
pkgver=1.0.0
pkgrel=1
pkgdesc="A platform for distributed ledger solutions, underpinned by a modular architecture delivering high degrees of confidentiality, resiliency, flexibility and scalability"
arch=(x86_64)
url="https://github.com/hyperledger/fabric"
license=('APACHE')
groups=('hyperledger-fabric')
depends=('go' 'docker')
makedepends=('git')
source=("https://github.com/hyperledger/fabric/archive/v$pkgver.tar.gz"
	fabric.sh)

prepare() {
  export GOPATH="$PWD"/.gopath
  mkdir -p "$GOPATH"/src/github.com/hyperledger
  ln -sf "$PWD"/fabric-$pkgver "$GOPATH"/src/github.com/hyperledger/fabric
}

build() {
  export GOPATH="$PWD"/.gopath
  cd "$GOPATH"/src/github.com/hyperledger/fabric
  make release/linux-amd64
}

package() {
  cd $srcdir/${_pkgname}-$pkgver
  install -Dm 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -Dm 644 -t "$pkgdir/etc/profile.d/" ../fabric.sh

  cp -r release/linux-amd64/bin "$pkgdir/usr"
  mkdir -p $pkgdir/etc/hyperledger/fabric
  cp -r sampleconfig/* $pkgdir/etc/hyperledger/fabric

}

md5sums=('a3b3b80224c88fe984207e6321ccdb04'
         '1da047c0fd9780e71a485013ade06060')
