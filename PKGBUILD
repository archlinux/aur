pkgname=fast-p
pkgver=0.2.5
pkgrel=1
pkgdesc='Quickly find and open a pdf among a collection of thousands of unsorted pdfs through fzf (fuzzy finder)'
arch=('x86_64')
repo="github.com/bellecp/$pkgname"
url="https://$repo"
license=('MIT')
depends=('fzf')
makedepends=('go-pie' 'git')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('ccd0a4630433a0ed000278f93c15300fd8bf47e612967568d824ad4ab23fb3ac')

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

