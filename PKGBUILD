# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: William Aass Dahlen <cznk@protonmail.com>

pkgname=azure-kubelogin
_name=kubelogin
pkgver=0.0.34
pkgrel=2
pkgdesc="A Kubernetes credential (exec) plugin implementing azure authentication"
arch=(x86_64)
url="https://github.com/Azure/kubelogin"
license=(MIT)
makedepends=(go)
depends=(glibc)
conflicts=(kubelogin)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('794da3ea64c26eb4cd709b807fff6629fe14cf3e7c384bddf2b890caa0018d26')

_archive="$_name-$pkgver"

build() {
  cd "$_archive"

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  _go_version=$(go version | cut -d " " -f 3)
  _ld_flags=" \
    -linkmode external \
    -X main.version=v$pkgver/? \
    -X main.goVersion=$_go_version \
    -X 'main.platform=linux/amd64' \
  "
  go build -ldflags "$_ld_flags" .

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

  install -Dm755 kubelogin "$pkgdir/usr/bin/kubelogin"

  install -Dm644 kubelogin.bash "$pkgdir/usr/share/bash-completion/completions/kubelogin"
  install -Dm644 kubelogin.fish "$pkgdir/usr/share/fish/vendor_completions.d/kubelogin.fish"
  install -Dm644 kubelogin.zsh "$pkgdir/usr/share/zsh/site-functions/_kubelogin"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
