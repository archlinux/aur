# Maintainer: xihale <i@xihale.top>
# Contributor: xihale <i@xihale.top>
pkgname=snirect
pkgver=0.3.4
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
install=snirect.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/xihale/snirect/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e1286c1bc876e77e27a472175ef4a7e176cdc38ff85fbb8f92ebb4577e05978b')

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

  # Keep in sync with packaging/snirect.service in the source repo.
  install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/user/snirect.service" <<'UNIT'
[Unit]
Description=Snirect - SNI RST bypass proxy
Documentation=https://github.com/xihale/snirect
After=network.target

[Service]
ExecStart=/usr/bin/snirect
Restart=on-failure
RestartSec=5

[Install]
WantedBy=default.target
UNIT
}
