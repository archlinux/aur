# Maintainer: Tom X. Tobin <tomxtobin@tomxtobin.com>

pkgname=rocker
pkgver=1.3.1
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc="Docker build tool with additional features"
arch=('i686' 'x86_64')
_vendor="github.com/grammarly/$pkgname"
url="https://$_vendor"
license=('Apache')
makedepends=('go')
source=("https://$_vendor/archive/$_pkgver.zip")
sha256sums=('caef42c70cf36adb6b02fd3fefab2981bf84b847ad36c67fa1ead0867b25b8e8')
_git_commit='fe066e1a9b5bb2d3471ae2fe03a889c2989e7fe6'
_ldflags="\
-X main.Version=$_pkgver \
-X main.GitCommit=$_git_commit \
-X main.GitBranch=$_pkgver \
-X main.BuildTime=$(TZ=GMT date "+%Y-%m-%d_%H:%M_GMT")"

_vendorpath="gopath/src/$_vendor"

prepare() {
  mkdir -p gopath/src/$_vendor
  mv -T $pkgname-$_pkgver gopath/src/$_vendor
}

build() {
  export GOPATH="$(pwd)/gopath"
  cd $_vendorpath
  go build -ldflags "$_ldflags" -o bin/$pkgname
}

package() {
  cd $_vendorpath
  install -Dm755 bin/$pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
