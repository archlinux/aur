# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=(alacritty-scrollback-git alacritty-scrollback-terminfo-git)
pkgver=0.1.0+894+g8e8ecdd
pkgrel=1
arch=(i686 x86_64)
url=https://github.com/jwilm/alacritty
license=(Apache)
makedepends=(git rust cargo cmake fontconfig freetype2 ncurses)
source=(git+$url#branch=scrollback)
sha512sums=(SKIP)

pkgver() {
  cd alacritty
  echo "$(grep '^version =' Cargo.toml | head -n1 | cut -d\" -f2)+$(git rev-list --count HEAD)+g$(git describe --always)"
}

build() {
  cd alacritty
  env CARGO_INCREMENTAL=0 cargo build --locked --release
}

check() {
  cd alacritty
  cargo test --locked --release
}

package_alacritty-scrollback-git() {
  pkgdesc='A cross-platform, GPU-accelerated terminal emulator (scrollback branch)'
  depends=(freetype2 fontconfig libxcursor libxrandr xclip)
  provides=(alacritty)
  conflicts=(alacritty)

  cd alacritty
  install -D target/release/alacritty "$pkgdir"/usr/bin/alacritty
  install -Dm 644 alacritty.man "$pkgdir"/usr/share/man/man1/alacritty.1 || true
  install -Dm 644 alacritty-completions.bash "$pkgdir"/usr/share/bash-completion/completions/alacritty || true
  install -Dm 644 alacritty-completions.zsh "$pkgdir"/usr/share/zsh/site-functions/_alacritty || true
  install -Dm 644 alacritty-completions.fish "$pkgdir"/usr/share/fish/completions/alacritty.fish || true
  _desktop="$pkgdir"/usr/share/applications/alacritty.desktop
  install -Dm 644 alacritty.desktop "$_desktop"
  sed -i 's#utilities-terminal#alacritty#' "$_desktop"
  install -Dm 644 assets/osx/Alacritty.app/Contents/Resources/alacritty.icns "$pkgdir"/usr/share/icons/alacritty.png
}

package_alacritty-scrollback-terminfo-git() {
  pkgdesc='Terminfo files for the alacritty terminal emulator (scrollback branch)'
  provides=(alacritty-terminfo)
  conflicts=(alacritty-terminfo)

  cd alacritty
  install -d "$pkgdir"/usr/share/terminfo/a
  tic -o "$pkgdir"/usr/share/terminfo alacritty.info
}
