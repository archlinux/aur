# Maintainer: ml <ml@visu.li>
pkgname=golangci-lint
pkgdesc="Linters Runner for Go. 5x faster than gometalinter."
pkgver=1.35.0
pkgrel=1
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h')
url='https://github.com/golangci/golangci-lint'
license=('GPL3')
depends=('glibc')
makedepends=('git' 'go')
source=("https://github.com/golangci/golangci-lint/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('71739de1aa88defc6f08c7e5118705069fee51f4fcf303cb9b7a39215ef0c56d')

build() {
  local _commit _flags
  _commit=$(bsdcat "${pkgname}-${pkgver}.tar.gz" | git get-tar-commit-id)
  _flags=(
    -X=main.version="$pkgver"
    -X=main.commit="${_commit::7}"
    -X=main.date="$(date -u -d "@${SOURCE_DATE_EPOCH}" +'%FT%TZ')"
    -linkmode=external
  )
  export CGO_ENABLED=1
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw -mod=readonly'
  cd "${pkgname}-${pkgver}"
  go build -o "$pkgname" -ldflags="${_flags[*]}" ./cmd/"$pkgname"
}

# breaks for yay users
#check() {
#  cd "${pkgname}-${pkgver}"
#  # some tests build the binary and overwrite our build
#  chmod 555 "$pkgname" # canary
#  # CGO_CFLAGS break tests when run inside ~/.cache (yay).
#  # TODO investigate
#  unset CGO_CFLAGS CGO
#  GL_TEST_RUN=1 GOLANGCI_LINT_INSTALLED=true go test ./...
#}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "$pkgname" -t "$pkgdir"/usr/bin
  ./"$pkgname" completion bash | install -Dm644 /dev/stdin "$pkgdir"/usr/share/bash-completion/completions/golangci-lint
  ./"$pkgname" completion zsh | install -Dm644 /dev/stdin "$pkgdir"/usr/share/zsh/site-functions/_golangci-lint
}
