# Maintainer: Tom X. Tobin <tomxtobin@tomxtobin.com>

pkgname=rocker
pkgver=1.1.0
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc="Docker build tool with additional features"
arch=('i686' 'x86_64')
url="https://github.com/grammarly/$pkgname"
license=('Apache')
makedepends=('go')
source=("https://github.com/grammarly/$pkgname/archive/$_pkgver.zip")
sha256sums=('25a96317d88a3b136684acc2c45485577c30b75116ce5475b44c2a6a3ab6f0ef')
_git_commit="2d8fe8949c011b89acb1f3346866f9be48e90c5b"
_ldflags="\
-X main.Version=$_pkgver \
-X main.GitCommit=$_git_commit \
-X main.GitBranch=$_pkgver \
-X main.BuildTime=$(TZ=GMT date "+%Y-%m-%d_%H:%M_GMT")"
_srcdir="$pkgname-$_pkgver"
_rocker_vendor="vendor/github.com/grammarly/rocker"

prepare() {
  mkdir -p gopath/src
  mv $_srcdir gopath/src
  cd gopath/src/$_srcdir
  mkdir -p $_rocker_vendor
  mv src $_rocker_vendor
}

build() {
  export GOPATH="$(pwd)/gopath"
  export GO15VENDOREXPERIMENT=1
  cd gopath/src/$_srcdir
  go build -ldflags "$_ldflags" -o bin/$pkgname
}

package() {
  cd gopath/src/$_srcdir
  install -Dm755 bin/$pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
