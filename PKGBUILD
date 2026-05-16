# Maintainer: Headorteil

pkgname=keycli
pkgver=0.1.1
pkgrel=1
pkgdesc="An environment manager which stores your secrets in your OS keyring"
arch=('x86_64')
url="https://github.com/Headorteil/keycli"
license=('MIT')
depends=('dbus')
makedepends=('cargo' 'pkgconf')
optdepends=('gnome-keyring: GNOME keyring support'
            'kwallet: KDE keyring support')
install=keycli.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/Headorteil/keycli/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2eb7698df03152267aa0940cccdcaff840af4d78bcd3faf5a65ff768e39e75e4')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
  # Generate completions
  ./"target/release/$pkgname" completion bash > "$pkgname.bash"
  ./"target/release/$pkgname" completion zsh > "$pkgname.zsh"
  ./"target/release/$pkgname" completion fish > "$pkgname.fish"
  ./"target/release/$pkgname" completion bash keycli-load > "$pkgname-load.bash"
  ./"target/release/$pkgname" completion zsh keycli-load > "$pkgname-load.zsh"
  ./"target/release/$pkgname" completion bash keycli-unload > "$pkgname-unload.bash"
  ./"target/release/$pkgname" completion zsh keycli-unload > "$pkgname-unload.zsh"
  ./"target/release/$pkgname" alias zsh > "$pkgname-unload.zsh"
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "$pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dm644 "$pkgname.zsh" "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
  install -Dm644 "$pkgname.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm644 "$pkgname-load.bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname-load"
  install -Dm644 "$pkgname-load.zsh" "$pkgdir/usr/share/zsh/site-functions/_$pkgname-load"
  install -Dm644 "$pkgname-unload.bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname-unload"
  install -Dm644 "$pkgname-unload.zsh" "$pkgdir/usr/share/zsh/site-functions/_$pkgname-unload"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname/"
}
