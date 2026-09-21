pkgname=dogma
pkgver=3.2.0
pkgrel=1
pkgdesc="Bridges secrets from vault backends and infrastructure outputs into sops-encrypted files deployed to NixOS machines"
arch=('x86_64' 'aarch64')
url="https://github.com/x71c9/dogma"
license=('MIT')
depends=('glibc')
makedepends=('rust')

source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/x71c9/$pkgname/tar.gz/refs/tags/v$pkgver")
sha256sums=("4877313a33e3155bc7aaae339d42a645d907a9bf599e3326272aaac1bc10108b")

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/dogma"
  "target/release/dogma" completions bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/dogma"
  "target/release/dogma" completions zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_dogma"
  "target/release/dogma" completions fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/dogma.fish"
}
