# Maintainer: yashi <https://aur.archlinux.org/account/yashi>
pkgname=podbox
pkgver=0.8.1
pkgrel=1
pkgdesc="Podman-native container environment manager"
arch=('x86_64' 'aarch64')
url="https://github.com/bethropolis/podbox"
license=('MIT')
depends=('podman')
makedepends=('rustup')
optdepends=(
  'fish: default shell in prebuilt images'
  'openssh: for SSH agent forwarding'
)
conflicts=('podbox-bin')
source=("https://github.com/bethropolis/podbox/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('d9b7ef9c478f867f0134dd32e029983234e75e4019446b5e866ecf481d78a440e4c5164d548315e1fd3f379135999f521ce9396edbb02c0668c9af72229be8bc')

# build.rs only uses the musl target if it is already installed, and otherwise
# falls back to a dynamic build that will not run in musl containers.
_musl_target() {
  case "$CARCH" in
    x86_64)  echo x86_64-unknown-linux-musl ;;
    aarch64) echo aarch64-unknown-linux-musl ;;
  esac
}

prepare() {
  cd "$pkgname-$pkgver"
  rustup target add "$(_musl_target)"
}

build() {
  cd "$pkgname-$pkgver"
  # No .git in a tarball, so build.rs needs the version passed in.
  PODBOX_VERSION="v$pkgver" cargo build --release --locked -p podbox-cli 2>&1 | tee build.log
  local rc="${PIPESTATUS[0]}"
  [ "$rc" -eq 0 ] || return "$rc"

  ./target/release/podbox completions bash > podbox.bash
  ./target/release/podbox completions zsh  > podbox.zsh
  ./target/release/podbox completions fish > podbox.fish
}

check() {
  cd "$pkgname-$pkgver"
  if ! grep -q "podbox-guest binary built (musl / static)" build.log; then
    echo "error: podbox-guest was not built static, see build.log" >&2
    return 1
  fi
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/podbox "${pkgdir}/usr/bin/podbox"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 podbox.bash \
    "${pkgdir}/usr/share/bash-completion/completions/podbox"
  install -Dm644 podbox.zsh \
    "${pkgdir}/usr/share/zsh/site-functions/_podbox"
  install -Dm644 podbox.fish \
    "${pkgdir}/usr/share/fish/vendor_completions.d/podbox.fish"
}
