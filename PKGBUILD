# Maintainer: MasketLP
#
# pkgver is rewritten from the release tag, and checksums by updpkgsums, by
# packaging/aur/publish.sh on every release.
pkgname=mlp
pkgver=0.7.0
pkgrel=1
pkgdesc='Encrypt and decrypt files with AES-256-GCM using an auto-managed keyfile'
arch=('x86_64' 'aarch64')
url='https://github.com/EldinBegano/mask-decryption'
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('go')
options=('!lto' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ecb8f658b1f31fe10cb5d58272af3a8d702efb414a09e58f55069b76c4a7ba0c')

prepare() {
  cd "mask-decryption-$pkgver"
  export GOPATH="$srcdir/gopath"
  export GOFLAGS='-modcacherw'
  go list -deps ./cmd/mlp > /dev/null
}

build() {
  cd "mask-decryption-$pkgver"
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
  go build -o mlp \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\" -X main.version=${pkgver}" \
    ./cmd/mlp

  ./mlp completion bash > mlp.bash
  ./mlp completion zsh  > mlp.zsh
  ./mlp completion fish > mlp.fish
}

check() {
  cd "mask-decryption-$pkgver"
  export MLP_CONFIG_DIR="$srcdir/check-config"
  printf 'roundtrip\n' > check.txt
  ./mlp encrypt check.txt
  rm check.txt
  ./mlp decrypt check.mlp
  test "$(cat check.txt)" = roundtrip
  test "$(./mlp --version)" = "mlp $pkgver"
}

package() {
  cd "mask-decryption-$pkgver"
  install -Dm755 mlp "$pkgdir/usr/bin/mlp"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 mlp.bash "$pkgdir/usr/share/bash-completion/completions/mlp"
  install -Dm644 mlp.zsh "$pkgdir/usr/share/zsh/site-functions/_mlp"
  install -Dm644 mlp.fish "$pkgdir/usr/share/fish/vendor_completions.d/mlp.fish"
}
