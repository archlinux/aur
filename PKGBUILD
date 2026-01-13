# Maintainer: Stipe Kotarac <stipe@kotarac.net>

pkgname=wl-proxy
pkgver=0.1.0
pkgrel=1
pkgdesc='proxy wayland connections and intercept and manipulate wayland messages'
arch=('x86_64')
license=(GPL-3.0-only)
url='https://github.com/mahkoh/wl-proxy'
depends=(
  gcc-libs
  glibc
)
makedepends=(
  cargo
)
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/mahkoh/wl-proxy/archive/v$pkgver.tar.gz")
sha512sums=('e26140f4d294dcf9b2baf683024090d40c74eceb26bd74d2879fc7717480a6f876bed3fd42028512807bb8f6fbc70b71ecf39f5485307214cc9dad04ad49dd92')

prepare() {
  cd $pkgname-$pkgver/
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $pkgname-$pkgver/
  export RUSTUP_TOOLCHAIN=stable
  cargo build --frozen --release --workspace
}

check() {
  cd $pkgname-$pkgver/
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release --workspace
}

package() {
  cd $pkgname-$pkgver/

  mkdir -p $pkgdir/usr/share/bash-completion/completions/
  mkdir -p $pkgdir/usr/share/fish/vendor_completions.d/
  mkdir -p $pkgdir/usr/share/zsh/site-functions/

  install -D -m755 target/release/window-to-tray $pkgdir/usr/bin/window-to-tray
  target/release/window-to-tray --generate-completion zsh >$pkgdir/usr/share/zsh/site-functions/_window-to-tray
  target/release/window-to-tray --generate-completion bash >$pkgdir/usr/share/bash-completion/completions/window-to-tray
  target/release/window-to-tray --generate-completion fish >$pkgdir/usr/share/fish/vendor_completions.d/window-to-tray.fish

  install -D -m755 target/release/wl-format-filter $pkgdir/usr/bin/wl-format-filter
  target/release/wl-format-filter --generate-completion zsh >$pkgdir/usr/share/zsh/site-functions/_wl-format-filter
  target/release/wl-format-filter --generate-completion bash >$pkgdir/usr/share/bash-completion/completions/wl-format-filter
  target/release/wl-format-filter --generate-completion fish >$pkgdir/usr/share/fish/vendor_completions.d/wl-format-filter.fish

  install -D -m755 target/release/wl-paper $pkgdir/usr/bin/wl-paper
  target/release/wl-paper --generate-completion zsh >$pkgdir/usr/share/zsh/site-functions/_wl-paper
  target/release/wl-paper --generate-completion bash >$pkgdir/usr/share/bash-completion/completions/wl-paper
  target/release/wl-paper --generate-completion fish >$pkgdir/usr/share/fish/vendor_completions.d/wl-paper.fish

  install -D -m755 target/release/wl-veil $pkgdir/usr/bin/wl-veil
  target/release/wl-veil --generate-completion zsh >$pkgdir/usr/share/zsh/site-functions/_wl-veil
  target/release/wl-veil --generate-completion bash >$pkgdir/usr/share/bash-completion/completions/wl-veil
  target/release/wl-veil --generate-completion fish >$pkgdir/usr/share/fish/vendor_completions.d/wl-veil.fish
}
