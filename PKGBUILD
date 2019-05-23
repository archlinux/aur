pkgname=fast-p
pkgver=0.2.4
pkgrel=1
pkgdesc='Quickly find and open a pdf among a collection of thousands of unsorted pdfs through fzf (fuzzy finder)'
arch=('x86_64')
repo="github.com/bellecp/$pkgname"
url="https://$repo"
license=('MIT')
depends=('fzf')
makedepends=('go-pie' 'git')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('87e34e6b4bee5e20247e997b19c0d8c08dd6f35a6c0dd4b507224d6790e2b071')

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

