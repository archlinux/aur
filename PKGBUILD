pkgname=path-extractor
pkgver=0.2.0
pkgrel=1
pkgdesc='A unix filter which outputs the filepaths found in stdin'
arch=('x86_64')
repo="github.com/edi9999/$pkgname"
url="https://github.com/edi9999/$pkgname"
license=('NONE')
makedepends=('go-pie')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('7d6c7463e833305e6d27c63727fec1029651bfe8bca5e8d23ac7db920c2066e7')

gopkg="gopath/src/$repo"

prepare() {
  mkdir -p ${gopkg%/*}
  ln -rsf $pkgname-$pkgver $gopkg
  export GOPATH="$srcdir"/gopath
  cd $gopkg
  go get -v -d
}

build() {
  export GOPATH="$srcdir"/gopath
  cd $gopkg
  go install \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    -v ./...
}

package() {
  install -Dm755 gopath/bin/$pkgname "$pkgdir"/usr/bin/$pkgname
}
