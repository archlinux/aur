# Maintainer: Tom X. Tobin <tomxtobin@tomxtobin.com>

pkgname=rocker
pkgver=1.1.1
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc="Docker build tool with additional features"
arch=('i686' 'x86_64')
_vendor="github.com/grammarly/$pkgname"
url="https://$vendor"
license=('Apache')
makedepends=('go')
source=("https://$_vendor/archive/$_pkgver.zip")
sha256sums=('462dcbc56d3c0d42df941f365b9c6c0c256a031949ebcb262ba85c79fc8da533')
_git_commit="1c71c9a189873267d4f34bee3ae12b0e2be39718"
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
