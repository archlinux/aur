# Maintainer: Tom X. Tobin <tomxtobin@tomxtobin.com>

pkgname=dep
pkgver=0.3.1
pkgrel=1
pkgdesc="Go dependency management tool"
arch=('i686' 'x86_64')
_vendor="github.com/golang/${pkgname}"
url="https://${_vendor}"
license=('BSD')
makedepends=('go')
options=('!emptydirs' '!strip')
source=("https://${_vendor}/archive/v${pkgver}.tar.gz")
sha256sums=('386e2d163c5a95166fa3b89da4f8166361c7c5210fb172f64c116cccd19d1d44')
_git_commit='83789e236d7ff64c82ee8392005455fc1ec1983b'
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
