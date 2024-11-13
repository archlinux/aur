pkgname=wl-screenrec
pkgver=0.1.6
pkgrel=1
pkgdesc="High performance hardware accelerated wlroots screen recorder"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/russelltg/wl-screenrec"
license=('APACHE')
provides=("wl-screenrec")
makedepends=('cargo' 'clang' 'rust')
depends=('ffmpeg' 'libva-driver' 'gcc-libs' 'glibc')
conflicts=('wl-screenrec-git')
source=("https://github.com/russelltg/wl-screenrec/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f24c474aeee96fe59bf5520045c56534f0dd2cdc2d9ab5f2477ad3dfd5b2d71c')

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

  ./target/release/wl-screenrec --generate-completions bash > wl-screenrec.bash
  ./target/release/wl-screenrec --generate-completions zsh > wl-screenrec.zsh
  ./target/release/wl-screenrec --generate-completions fish > wl-screenrec.fish
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/wl-screenrec" "$pkgdir/usr/bin/wl-screenrec"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "wl-screenrec.bash" "$pkgdir/usr/share/bash-completion/completions/wl-screenrec"
  install -Dm644 "wl-screenrec.zsh" "$pkgdir/usr/share/zsh/site-functions/_wl-screenrec"
  install -Dm644 "wl-screenrec.fish" "$pkgdir/usr/share/fish/vendor_completions.d/wl-screenrec.fish"
}
