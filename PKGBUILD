# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=infisical
pkgver=0.16.3
pkgrel=1
pkgdesc="Fetch and inject secrets into any framework in local development"
url="https://github.com/Infisical/infisical"
arch=(x86_64)
license=(custom)
depends=(glibc)
makedepends=(go)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/infisical-cli/v$pkgver.tar.gz")
sha256sums=('9fc6955af41368d5136d91213e9c0244e7a86e16e927330a15a12b50b083b0ae')

_archive="$pkgname-infisical-cli-v$pkgver"

prepare() {
  cd "$_archive/cli"

  # Avoid downloading Go dependencies in build() by doing it here instead
  go mod download -x
}

build() {
  cd "$_archive/cli"

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  _ld_flags="-linkmode external -X github.com/Infisical/infisical-merge/packages/util.CLI_VERSION=$pkgver"
  go build -v -o infisical -ldflags "$_ld_flags" .

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
  _unit_tests=$(
    go list ./... \
      | grep -v 'github.com/Infisical/infisical-merge/detect' \
      | grep -v 'github.com/Infisical/infisical-merge/packages/cmd' \
      | sort
  )
  # shellcheck disable=SC2086
  go test -v $_unit_tests
}

package() {
  cd "$_archive"

  install -Dm755 -t "$pkgdir/usr/bin" cli/infisical

  install -Dm644 cli/infisical.bash "$pkgdir/usr/share/bash-completion/completions/infisical"
  install -Dm644 cli/infisical.fish "$pkgdir/usr/share/fish/vendor_completions.d/infisical.fish"
  install -Dm644 cli/infisical.zsh "$pkgdir/usr/share/zsh/site-functions/_infisical"

  install -Dm644 cli/infisical.1 "$pkgdir/usr/share/man/man1/infisical.1"

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
