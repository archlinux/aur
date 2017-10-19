# Maintainer: Tom Tobin <tomxtobin@tomxtobin.com>

pkgname=dep
pkgver=0.3.2
pkgrel=1
pkgdesc="Go dependency management tool"
arch=('i686' 'x86_64')
_vendor="github.com/golang/${pkgname}"
url="https://${_vendor}"
license=('BSD')
makedepends=('go')
options=('!emptydirs' '!strip')
source=("https://${_vendor}/archive/v${pkgver}.tar.gz")
_git_commit='83789e236d7ff64c82ee8392005455fc1ec1983b'
sha256sums=('327124953d76293eaba6001e17bb8a31371313ab39eed1fa9eac01f8b5c1de21')
_ldflags="\
-s \
-w \
-X main.buildDate=$(date --iso-8601) \
-X main.commitHash=$_git_commit \
-X main.version=v$pkgver"

_vendorpath="gopath/src/$_vendor"
_buildpath="$_vendorpath/cmd/dep"

prepare() {
  mkdir -p $_vendorpath
  mv -T $pkgname-$pkgver $_vendorpath
}

build() {
  export GOPATH="$srcdir/gopath"
  cd $_buildpath
  go build -ldflags "$_ldflags" -o bin/$pkgname
}

package() {
  install -Dm755 $_buildpath/bin/$pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 $_vendorpath/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
