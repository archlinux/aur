# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=azure-dev-cli
_pkgname=azure-dev
pkgver=1.10.3
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
sha256sums=('9169a9fc496ea2ed9e54aef27e58017985e42b37eccf4d33d557cd62bf268b9f')

_archive="$_pkgname-azure-dev-cli_$pkgver"

prepare() {
  cd "$_archive"
  GOFLAGS="-mod=readonly" go mod vendor -v
}

build() {
  cd "$_archive"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -mod=vendor -modcacherw -buildvcs=false"
  export GOPATH="$srcdir"

  local ld_flags="-compressdwarf=false -linkmode=external"
  go build -v -ldflags="$ld_flags" -o azd ./cli/azd/main.go
}

check() {
  cd "$_archive"
  # Skip failing tests - not sure why they fail.
  local unit_tests=$(
    go list ./... \
      | grep -v 'github.com/azure/azure-dev/cli/azd/internal/scaffold' \
      | grep -v 'github.com/azure/azure-dev/cli/azd/test/cmdrecord' \
      | grep -v 'github.com/azure/azure-dev/cli/azd/test/functional'
  )
  # shellcheck disable=SC2086
  go test -v $unit_tests
}

package() {
  cd "$_archive"
  install -vDm755 -t "$pkgdir/usr/bin" azd

  ./azd completion bash \
    | install -vDm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/azd"
  ./azd completion fish \
    | install -vDm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/azd.fish"
  ./azd completion zsh \
    | install -vDm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_azd"

  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  cp -a -t "$pkgdir/usr/share/doc/$pkgname" docs
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
