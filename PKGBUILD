# Maintainer: Jakob Kukla <jakob [dot] kukla [at] gmail [dot] com>

# This is a fork of the official alacritty PKGBUILD. Original maintainers and contributors:
### Christian Rebischke <chris.rebischke@archlinux.org>
### Jiachen YANG <farseerfc@archlinux.org>
### Daniel M. Capella <polyzen@archlinux.org>
### kpcyrd <git@rxv.cc>
### quininer <quininer@live.com>
pkgname='alacritty-no-gtk-csds'
pkgdesc="A cross-platform, GPU-accelerated terminal emulator (without GTK-like CSDs)"
pkgver=0.11.0
pkgrel=0
arch=('x86_64')
url="https://github.com/alacritty/alacritty"
license=('Apache')
makedepends=('git' 'rust' 'cargo' 'cmake' 'ncurses' 'desktop-file-utils' 'gdb' 'libxcb')
depends=('freetype2' 'fontconfig' 'libxi' 'libxcursor' 'libxkbcommon' 'libxrandr')
checkdepends=('ttf-dejavu') # for monospace fontconfig test
optdepends=('ncurses: for alacritty terminfo database')
provides=('alacritty')
conflicts=('alacritty')
source=("$pkgname::git+$url.git#tag=v$pkgver?signed"
	'remove-gtk-csds.patch')
validpgpkeys=('4DAA67A9EA8B91FCC15B699C85CDAE3C164BA7B4'  # Christian Dürr <contact@christianduerr.com>
              'A56EF308A9F1256C25ACA3807EA8F8B94622A6A9') # Kirill Chibisov <contact@kchibisov.com>
sha256sums=('SKIP'
            '7f1238805121480c25f00c3c4cb6ff193192152cce1f156542c4d73a194a449d')

prepare() {
  cd "$pkgname"
  patch --forward --strip=1 --input="${srcdir}/remove-gtk-csds.patch"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build(){
  cd "$pkgname"
  CARGO_INCREMENTAL=0 cargo build --release --locked --offline
}

check(){
  cd "$pkgname"
  CARGO_INCREMENTAL=0 cargo test --locked --offline
}

package() {
  cd "$pkgname"
  desktop-file-install -m 644 --dir "$pkgdir/usr/share/applications/" "extra/linux/Alacritty.desktop"
  install -D -m755 "target/release/alacritty" "$pkgdir/usr/bin/alacritty"
  install -D -m644 "extra/alacritty.man" "$pkgdir/usr/share/man/man1/alacritty.1"
  install -D -m644 "extra/alacritty-msg.man" "$pkgdir/usr/share/man/man1/alacritty-msg.1"
  install -D -m644 "extra/linux/org.alacritty.Alacritty.appdata.xml" "$pkgdir/usr/share/appdata/org.alacritty.Alacritty.appdata.xml"
  install -D -m644 "alacritty.yml" "$pkgdir/usr/share/doc/alacritty/example/alacritty.yml"
  install -D -m644 "extra/completions/alacritty.bash" "$pkgdir/usr/share/bash-completion/completions/alacritty"
  install -D -m644 "extra/completions/_alacritty" "$pkgdir/usr/share/zsh/site-functions/_alacritty"
  install -D -m644 "extra/completions/alacritty.fish" "$pkgdir/usr/share/fish/vendor_completions.d/alacritty.fish"
  install -D -m644 "extra/logo/alacritty-term.svg" "$pkgdir/usr/share/pixmaps/Alacritty.svg"
}
