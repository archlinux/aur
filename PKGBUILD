# Maintainer: Tom X. Tobin <tomxtobin@tomxtobin.com>

pkgname=rocker
pkgver=1.1.2
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc="Docker build tool with additional features"
arch=('i686' 'x86_64')
_vendor="github.com/grammarly/$pkgname"
url="https://$_vendor"
license=('Apache')
makedepends=('go')
source=("https://$_vendor/archive/$_pkgver.zip")
sha256sums=('dfadf23bb8bed540d7bac25ba9ec2fade3cef15f25f9991b09409bc0e9fc5cbd')
_git_commit="ec7c40b0d139303db89add1fbdde15d321142e53"
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
