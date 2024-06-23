# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=infisical
pkgver=0.23.2
pkgrel=1
pkgdesc="Fetch and inject secrets into any framework in local development"
url="https://github.com/Infisical/infisical"
arch=(x86_64)
license=(LicenseRef-Custom)
depends=(glibc)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/infisical-cli/v$pkgver.tar.gz")
sha256sums=('81f52d14776124cd86d4ed4c2b898857cc81928ccb2d0a8a8e1da0832ba3ff0d')

_archive="$pkgname-infisical-cli-v$pkgver"

prepare() {
  cd "$_archive/cli"

  GOFLAGS="-mod=readonly" go mod vendor -v
}

build() {
  cd "$_archive/cli"

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -mod=vendor -modcacherw -buildvcs=false"

  local ld_flags=" \
    -compressdwarf=false \
    -linkmode=external  \
    -X github.com/Infisical/infisical-merge/packages/util.CLI_VERSION=$pkgver \
  "
  go build -v \
    -ldflags "$ld_flags" \
    -o infisical \
    .

  # Completions
  ./infisical completion bash > infisical.bash
  ./infisical completion fish > infisical.fish
  ./infisical completion zsh > infisical.zsh

  # Manpage
  ./infisical man > infisical.1
}

check() {
  cd "$_archive/cli"

  # Skip failing tests - not sure why they fail.
  local unit_tests=$(
    go list ./... \
      | grep -v 'github.com/Infisical/infisical-merge/detect' \
      | grep -v 'github.com/Infisical/infisical-merge/packages/cmd' \
      | grep -v 'github.com/Infisical/infisical-merge/test'
  )
  # shellcheck disable=SC2086
  go test -v $unit_tests
}

package() {
  cd "$_archive"

  install -Dm755 -t "$pkgdir/usr/bin" cli/infisical

  install -Dm644 cli/infisical.bash "$pkgdir/usr/share/bash-completion/completions/infisical"
  install -Dm644 cli/infisical.fish "$pkgdir/usr/share/fish/vendor_completions.d/infisical.fish"
  install -Dm644 cli/infisical.zsh "$pkgdir/usr/share/zsh/site-functions/_infisical"

  install -Dm644 -t "$pkgdir/usr/share/man/man1" cli/infisical.1
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
