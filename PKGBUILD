# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: William Aass Dahlen <cznk@protonmail.com>

pkgname=azure-kubelogin
pkgver=0.1.0
pkgrel=2
pkgdesc="A Kubernetes credential (exec) plugin implementing azure authentication"
arch=(x86_64)
url="https://github.com/Azure/kubelogin"
license=(MIT)
depends=(glibc)
makedepends=(
  git
  go
)
conflicts=(kubelogin)
_commit=0fcd072d45250a50cde855cf50204ad2dc784095
source=("$pkgname::git+$url.git#commit=$_commit")
sha256sums=('SKIP')

_archive="$pkgname"

pkgver() {
  cd "$_archive"

  git describe --tags | sed 's/^v//'
}

build() {
  cd "$_archive"

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  local ld_flags="-linkmode external -X main.gitTag=$pkgver"
  go build -ldflags "$ld_flags" .

  # Completions
  ./kubelogin completion bash > kubelogin.bash
  ./kubelogin completion fish > kubelogin.fish
  ./kubelogin completion zsh > kubelogin.zsh
}

check() {
  cd "$_archive"

  go test ./...
}

package() {
  cd "$_archive"

  install -Dm755 -t "$pkgdir/usr/bin" kubelogin

  install -Dm644 kubelogin.bash "$pkgdir/usr/share/bash-completion/completions/kubelogin"
  install -Dm644 kubelogin.fish "$pkgdir/usr/share/fish/vendor_completions.d/kubelogin.fish"
  install -Dm644 kubelogin.zsh "$pkgdir/usr/share/zsh/site-functions/_kubelogin"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
