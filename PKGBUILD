# Maintainer: chrhasse <hasse dot christopher at gmail dot com>
pkgname='alacritty-sixel-git'
_pkgname="alacritty"
pkgver=0.12.0.2066.g53110c6e
pkgrel=1
epoch=1
arch=('x86_64' 'i686')
url="https://github.com/microo8/alacritty-sixel"
pkgdesc="A cross-platform, GPU-accelerated terminal emulator"
license=('Apache')
depends=('freetype2' 'fontconfig' 'libxi' 'libxcursor' 'libxrandr')
makedepends=('rust' 'cargo' 'cmake' 'fontconfig' 'ncurses' 'desktop-file-utils' 'gdb' 'libxcb' 'libxkbcommon' 'git')
checkdepends=('ttf-dejavu') # for monospace fontconfig test
provides=('alacritty')
conflicts=('alacritty')
source=("$_pkgname::git+https://github.com/microo8/alacritty.git")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname/alacritty
	echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build(){
  cd "$_pkgname"
  env CARGO_INCREMENTAL=0 cargo build --release --locked
}

check(){
  cd "$_pkgname"
  env CARGO_INCREMENTAL=0 cargo test --release
}

package_alacritty-sixel-git() {
	cd $_pkgname

	desktop-file-install -m 644 --dir "$pkgdir/usr/share/applications/" "$srcdir/$_pkgname/extra/linux/Alacritty.desktop"

	install -D -m755 "target/release/alacritty" "$pkgdir/usr/bin/alacritty"
	install -D -m644 "extra/alacritty.man" "$pkgdir/usr/share/man/man1/alacritty.1"
	install -D -m644 "extra/linux/org.alacritty.Alacritty.appdata.xml" "$pkgdir/usr/share/appdata/org.alacritty.Alacritty.appdata.xml"
	install -D -m644 "alacritty.yml" "$pkgdir/usr/share/doc/alacritty/example/alacritty.yml"
	install -D -m644 "extra/completions/alacritty.bash" "$pkgdir/usr/share/bash-completion/completions/alacritty"
	install -D -m644 "extra/completions/_alacritty" "$pkgdir/usr/share/zsh/site-functions/_alacritty"
	install -D -m644 "extra/completions/alacritty.fish" "$pkgdir/usr/share/fish/vendor_completions.d/alacritty.fish"
	install -D -m644 "extra/logo/alacritty-term.svg" "$pkgdir/usr/share/pixmaps/Alacritty.svg"
	install -D -m644 "extra/logo/compat/alacritty-term.png" "$pkgdir/usr/share/pixmaps/Alacritty.png"
}
