# Maintainer: xihale <i@xihale.top>
# Contributor: xihale <i@xihale.top>
pkgname=snirect
pkgver=0.3.0
pkgrel=1
pkgdesc='Local HTTP/HTTPS proxy that rewrites TLS SNI by rules to bypass SNI-based censorship'
arch=('x86_64' 'aarch64')
url='https://github.com/xihale/snirect'
license=('MIT')
depends=('glibc')
makedepends=('go')
optdepends=(
  'ca-certificates: HTTPS MITM decryption'
  'nss: Firefox certificate store integration'
)
provides=('snirect')
conflicts=('snirect-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/xihale/snirect/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('96d226d33c50ac2d07e0c09d362515d9240758ffa011b12f738f905f74748b1e')

prepare() {
  # Keep the build hermetic: never let Go fetch a different toolchain.
  export GOTOOLCHAIN=local
  export GOPATH="$srcdir/gopath"
  export GOCACHE="$srcdir/go-build-cache"
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-mod=readonly'
  go build -trimpath \
    -ldflags "-s -w -X github.com/xihale/snirect/internal/cli.Version=v$pkgver" \
    -o snirect ./cmd/snirect

  local shell
  for shell in bash zsh fish; do
    ./snirect completion "$shell" > "snirect.$shell"
  done
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 snirect "$pkgdir/usr/bin/snirect"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  install -Dm644 snirect.bash "$pkgdir/usr/share/bash-completion/completions/snirect"
  install -Dm644 snirect.zsh "$pkgdir/usr/share/zsh/site-functions/_snirect"
  install -Dm644 snirect.fish "$pkgdir/usr/share/fish/vendor_completions.d/snirect.fish"
}
