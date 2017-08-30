# Maintainer: Tom X. Tobin <tomxtobin@tomxtobin.com>

pkgname=rocker-compose
pkgver=0.1.6
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
sha256sums=('eb05f6c1db052bc31cbed3126f66fc1acb33fa7e9c602562ed41ff15a486a9e5')
_git_commit='b1ddfe97ae3c92b095e01128bb2e9baa26116434'
_ldflags="\
-X main.Version=$_pkgver \
-X main.GitCommit=$_git_commit \
-X main.GitBranch=$_pkgver \
-X main.BuildTime=$(TZ=GMT date "+%Y-%m-%d_%H:%M_GMT")"

_vendorpath="gopath/src/$_vendor"

prepare() {
  mkdir -p $_vendorpath
  mv -T $pkgname-$_pkgver gopath/src/$_vendor
}

build() {
  export GOPATH="$srcdir/gopath"
  cd $_vendorpath
  go build -ldflags "$_ldflags" -o bin/$pkgname
}

package() {
  cd $_vendorpath
  install -Dm755 bin/$pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 completion/zsh/_$pkgname "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
