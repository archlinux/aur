# Maintainer: Tom X. Tobin <tomxtobin@tomxtobin.com>

pkgname=rocker-compose
pkgver=0.1.4_rc2
_pkgver=${pkgver//_/-}
pkgrel=2
pkgdesc="Docker composition tool for idempotently deploying multi-container apps"
arch=('i686' 'x86_64')
url="https://github.com/grammarly/$pkgname"
license=('Apache')
makedepends=('go')
conflicts=('rocker-compose-bin')
source=("https://github.com/grammarly/$pkgname/archive/$_pkgver.zip")
sha256sums=('959be03c1baa082744962b4d5041aaeb1953daefbc1fd1fa52a3f0826cb3d022')
_git_commit="d29faea5172303814c113de6670ac76a8e6af027"
_ldflags="\
-X main.Version=$_pkgver \
-X main.GitCommit=$_git_commit \
-X main.GitBranch=$_pkgver \
-X main.BuildTime=$(TZ=GMT date "+%Y-%m-%d_%H:%M_GMT")"

build() {
  cd "$pkgname-$_pkgver"
  export GOPATH="$(pwd):$(pwd)/vendor"
  go build -ldflags "$_ldflags" -o bin/$pkgname src/cmd/rocker-compose/main.go
}

package() {
  cd "$pkgname-$_pkgver"
  install -Dm755 bin/$pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 completion/zsh/_$pkgname "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
