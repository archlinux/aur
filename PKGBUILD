# Maintainer: Tom X. Tobin <tomxtobin@tomxtobin.com>

pkgname=rocker-compose
pkgver=0.1.5
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc="Docker composition tool for idempotently deploying multi-container apps"
arch=('i686' 'x86_64')
_vendor="github.com/grammarly/$pkgname"
url="https://$_vendor"
license=('Apache')
makedepends=('go')
conflicts=('rocker-compose-bin')
source=("https://$_vendor/archive/$_pkgver.zip")
sha256sums=('759df6783168de0e49f307b9d91bdecd76a4fcf51498fd8531a66992353cdefb')
_git_commit="21e4bdd21cf0e2de30de4e91e9731d5a4e1b0ae1"
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
  install -Dm644 completion/zsh/_$pkgname "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
