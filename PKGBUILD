# Maintainer: Stipe Kotarac <stipe@kotarac.net>

pkgname=wl-proxy
pkgver=0.1.2
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
sha512sums=('3ef7a58159e1dada95cd4fbdd78d0ffcf6e1712f81d1997bf0c0af70332a50a87c77daf9487d6bf2178787ca67ebc3238bac98181081341f30316585bd51f734')

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

  install -D -m755 target/release/wl-cm-filter $pkgdir/usr/bin/wl-cm-filter
  target/release/wl-cm-filter --generate-completion zsh >$pkgdir/usr/share/zsh/site-functions/_wl-cm-filter
  target/release/wl-cm-filter --generate-completion bash >$pkgdir/usr/share/bash-completion/completions/wl-cm-filter
  target/release/wl-cm-filter --generate-completion fish >$pkgdir/usr/share/fish/vendor_completions.d/wl-cm-filter.fish

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
