# Maintainer: Tom X. Tobin <tomxtobin@tomxtobin.com>

pkgname=rocker
pkgver=1.3.0
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc="Docker build tool with additional features"
arch=('i686' 'x86_64')
_vendor="github.com/grammarly/$pkgname"
url="https://$_vendor"
license=('Apache')
makedepends=('go')
source=("https://$_vendor/archive/$_pkgver.zip")
sha256sums=('d2c501b4a22e1b6b5bb14161d10b1a3296b4d583fece99349c656f2943696942')
_git_commit="9444404e78c869ecdfb9d64ce79beff8ad44ff56"
_ldflags="\
-X main.Version=$_pkgver \
-X main.GitCommit=$_git_commit \
-X main.GitBranch=$_pkgver \
-X main.BuildTime=$(TZ=GMT date "+%Y-%m-%d_%H:%M_GMT")"

prepare() {
  mkdir -p gopath/src/$_vendor
  mv -T $pkgname-$_pkgver gopath/src/$_vendor
}

build() {
  export GOPATH="$(pwd)/gopath"
  export GO15VENDOREXPERIMENT=1
  cd gopath/src/$_vendor
  go build -ldflags "$_ldflags" -o bin/$pkgname
}

package() {
  cd gopath/src/$_vendor
  install -Dm755 bin/$pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
