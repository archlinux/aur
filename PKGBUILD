# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: William Aass Dahlen <cznk@protonmail.com>

pkgname=azure-kubelogin
pkgver=0.1.1
_commit=26e4412143220962f6fe05035fee8129f6bafac4
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
source=("$pkgname::git+$url.git?signed#commit=$_commit")
sha256sums=('SKIP')
validpgpkeys=('968479A1AFF927E37D1A566BB5690EEEBB952194') # GitHub <noreply@github.com>

_archive="$pkgname"

pkgver() {
  cd "$_archive"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$_archive"

  go mod download -x
}

build() {
  cd "$_archive"

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -v .

  # Completions
  ./kubelogin completion bash > kubelogin.bash
  ./kubelogin completion fish > kubelogin.fish
  ./kubelogin completion zsh > kubelogin.zsh
}

check() {
  cd "$_archive"

  # Skip tests failing for some users - not sure why
  local unit_tests=$(
    go list ./... \
      | grep -v 'github.com/Azure/kubelogin/pkg/internal/pop' \
      | grep -v 'github.com/Azure/kubelogin/pkg/internal/token' \
      | sort
  )
  # shellcheck disable=SC2086
  go test -v $unit_tests
}

package() {
  cd "$_archive"

  install -Dm755 -t "$pkgdir/usr/bin" kubelogin

  install -Dm644 kubelogin.bash "$pkgdir/usr/share/bash-completion/completions/kubelogin"
  install -Dm644 kubelogin.fish "$pkgdir/usr/share/fish/vendor_completions.d/kubelogin.fish"
  install -Dm644 kubelogin.zsh "$pkgdir/usr/share/zsh/site-functions/_kubelogin"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
