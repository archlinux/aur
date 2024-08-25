pkgname=fast-p
pkgver=0.2.5
pkgrel=5
pkgdesc='Quickly find and open a pdf among a collection of thousands of unsorted pdfs through fzf (fuzzy finder)'
arch=('x86_64')
repo="github.com/bellecp/$pkgname"
url="https://$repo"
license=('MIT')
depends=('fzf')
makedepends=('go' 'git')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('ccd0a4630433a0ed000278f93c15300fd8bf47e612967568d824ad4ab23fb3ac')

gopkg="gopath/src/$repo"

prepare() {
  mkdir -p "${gopkg%/*}"
  ln -rTsf "$pkgname-$pkgver" "$gopkg"
  export GOPATH="$srcdir/gopath"
  cd "$gopkg"
  go mod init
  go get -v
}

build() {
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
  export GOPATH="$srcdir"/gopath
  cd "$gopkg"
  go install -v ./...
}

# ?   	github.com/bellecp/fast-p	[no test files]
# check() {
#   export GOPATH="$srcdir"/gopath
#   cd $gopkg
#   go test ./...
# }

package() {
  install -Dm755 "gopath/bin/$pkgname" -t "$pkgdir/usr/bin"
  cd "$pkgname-$pkgver"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
