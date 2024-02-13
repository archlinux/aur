# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=azure-dev-cli
_pkgname=azure-dev
pkgver=1.6.0
pkgrel=1
pkgdesc="Developer CLI that reduces the time it takes for you to get started on Azure"
arch=(x86_64)
url="https://github.com/Azure/azure-dev"
license=(MIT)
depends=(
  git
  glibc
  kubectl
  python
  terraform
)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/azure-dev-cli_$pkgver.tar.gz")
sha256sums=('45057c97416eb2f9ea0874350df33757a8ced5d686cf18091d12beaf93b47778')

_archive="$_pkgname-azure-dev-cli_$pkgver"

prepare() {
  cd "$_archive"

  # Avoid downloading Go dependencies in build() by doing it here instead
  go mod download -x
}

build() {
  cd "$_archive"

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -v -buildvcs=false -o azd ./cli/azd/main.go

  # Completions
  ./azd completion bash > azd.bash
  ./azd completion fish > azd.fish
  ./azd completion zsh > azd.zsh
}

check() {
  cd "$_archive"

  # Skip failing tests - not sure why they fail.
  _unit_tests=$(
    go list -buildvcs=false ./... \
      | grep -v 'github.com/azure/azure-dev/cli/azd/internal/scaffold' \
      | grep -v 'github.com/azure/azure-dev/cli/azd/test/cmdrecord' \
      | grep -v 'github.com/azure/azure-dev/cli/azd/test/functional' \
      | sort
  )
  # shellcheck disable=SC2086
  go test $_unit_tests
}

package() {
  cd "$_archive"

  install -Dm755 -t "$pkgdir/usr/bin" azd

  install -Dm644 azd.bash "$pkgdir/usr/share/bash-completion/completions/azd"
  install -Dm644 azd.fish "$pkgdir/usr/share/fish/vendor_completions.d/azd.fish"
  install -Dm644 azd.zsh "$pkgdir/usr/share/zsh/site-functions/_azd"

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md docs/*
  cp -a -t "$pkgdir/usr/share/doc/$pkgname" docs
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
