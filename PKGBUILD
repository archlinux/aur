# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=(alacritty-scrollback-git alacritty-scrollback-terminfo-git)
pkgver=0.1.0+848+g4631ca4
pkgrel=1
arch=(x86_64 i686)
url=https://github.com/jwilm/alacritty
license=(Apache)
makedepends=(git rust cargo cmake fontconfig freetype2 ncurses)
source=(git+https://github.com/jwilm/alacritty#branch=scrollback)
sha512sums=(SKIP)

pkgver() {
  cd alacritty
  echo "$(grep '^version =' Cargo.toml | head -n1 | cut -d\" -f2)+$(git rev-list --count HEAD)+g$(git describe --always)"
}

package_alacritty-scrollback-git() {
  pkgdesc='A cross-platform, GPU-accelerated terminal emulator (scrollback branch)'
  depends=(freetype2 fontconfig xclip)
  provides=(alacritty)
  conflicts=(alacritty)

  cd alacritty
  env CARGO_INCREMENTAL=0 cargo build --release

  install -Dm 755 $srcdir/alacritty/target/release/alacritty $pkgdir/usr/bin/alacritty
  install -Dm 644 $srcdir/alacritty/alacritty.desktop $pkgdir/usr/share/applications/alacritty.desktop
  install -Dm 644 $srcdir/alacritty/alacritty.man $pkgdir/usr/share/man/man1/alacritty.1 || true
  install -Dm 644 $srcdir/alacritty/alacritty-completions.bash $pkgdir/usr/share/bash-completion/completions/alacritty || true
  install -Dm 644 $srcdir/alacritty/alacritty-completions.zsh $pkgdir/usr/share/zsh/site-functions/_alacritty || true
  install -Dm 644 $srcdir/alacritty/alacritty-completions.fish $pkgdir/usr/share/fish/completions/alacritty.fish || true
}

package_alacritty-scrollback-terminfo-git() {
  pkgdesc='Terminfo files for the alacritty terminal emulator (scrollback branch)'
  provides=(alacritty-terminfo)
  conflicts=(alacritty-terminfo)

  cd alacritty
  install -dm 755 $pkgdir/usr/share/terminfo/a
  tic -o $pkgdir/usr/share/terminfo alacritty.info
}
