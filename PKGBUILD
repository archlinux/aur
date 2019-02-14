# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=mongodb-tools
pkgver=4.0.5
pkgrel=2
pkgdesc="The MongoDB tools provide import, export, and diagnostic capabilities."
arch=('x86_64')
url="https://github.com/mongodb/mongo-tools"
license=('Apache')
depends=('libsasl' 'libpcap' 'openssl')
makedepends=('go-pie')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mongodb/mongo-tools/archive/r$pkgver.tar.gz"
        "disable-sslv3.patch")
sha512sums=('5a2ca0cb761895a6c3187bdf4ac0c11222ac681313c2c22801571a1147e07b7b6149150b07e58cd4487413017da56424ec494eaaf9aec9193498ee3cde73c5da'
            '674af43ebf9e73f1eae4f81c160cec4c4ea657b7e38f97929a0845d8981f9af904eca79e2144e6150774799a58074cee5b67e4385d082630c471e438981d9ea5')

prepare() {
  install -d build/src/github.com/mongodb
  mv mongo-tools-r$pkgver build/src/github.com/mongodb/mongo-tools
  cd build/src/github.com/mongodb/mongo-tools
  GOROOT=/usr ./set_goenv.sh
  export GOPATH="$GOPATH:$srcdir/build"
  mkdir bin
}

build() {
  cd build/src/github.com/mongodb/mongo-tools
  for i in bsondump mongostat mongofiles mongoexport mongoimport mongorestore mongodump mongotop mongoreplay; do
    go build -o bin/$i -tags "ssl sasl" $i/main/$i.go
  done
}

package() {
  cd build/src/github.com/mongodb/mongo-tools
  for i in bsondump mongostat mongofiles mongoexport mongoimport mongorestore mongodump mongotop mongoreplay; do
    install -Dm755 bin/$i "$pkgdir/usr/bin/$i"
  done
}
