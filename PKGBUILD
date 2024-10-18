# Maintainer: chrhasse <hasse dot christopher at gmail dot com>
pkgname='alacritty-sixel-git'
_pkgname="alacritty"
pkgdesc="A cross-platform, GPU-accelerated terminal emulator"
pkgver=0.14.0.2427.gc7213774
pkgrel=1
epoch=1
arch=('x86_64')
url="https://github.com/ayosec/alacritty"
license=('Apache-2.0' 'MIT')
depends=('freetype2' 'fontconfig' 'libxi' 'libxcursor' 'libxkbcommon' 'libxkbcommon-x11' 'libxrandr')
makedepends=('rust' 'cargo' 'cmake' 'fontconfig' 'ncurses' 'desktop-file-utils' 'gdb' 'libxcb' 'git' 'scdoc')
checkdepends=('ttf-dejavu') # for monospace fontconfig test
provides=('alacritty')
conflicts=('alacritty')
source=("$_pkgname::git+https://github.com/ayosec/alacritty.git")
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

	desktop-file-install -m 644 --dir "$pkgdir/usr/share/applications/" "extra/linux/Alacritty.desktop"
	install -D -m755 "target/release/alacritty" "$pkgdir/usr/bin/alacritty"

	scdoc < "extra/man/alacritty.1.scd" | install -D -m644 /dev/stdin \
		"$pkgdir/usr/share/man/man1/alacritty.1"
	scdoc < "extra/man/alacritty.5.scd" | install -D -m644 /dev/stdin \
		"$pkgdir/usr/share/man/man5/alacritty.5"
	scdoc < "extra/man/alacritty-msg.1.scd" | install -D -m644 /dev/stdin \
		"$pkgdir/usr/share/man/man1/alacritty-msg.1"
	scdoc < "extra/man/alacritty-bindings.5.scd" | install -D -m644 /dev/stdin \
		"$pkgdir/usr/share/man/man5/alacritty-bindings.5"

	install -D -m644 "extra/linux/org.alacritty.Alacritty.appdata.xml" "$pkgdir/usr/share/appdata/org.alacritty.Alacritty.appdata.xml"
	install -D -m644 "extra/completions/alacritty.bash" "$pkgdir/usr/share/bash-completion/completions/alacritty"
	install -D -m644 "extra/completions/_alacritty" "$pkgdir/usr/share/zsh/site-functions/_alacritty"
	install -D -m644 "extra/completions/alacritty.fish" "$pkgdir/usr/share/fish/vendor_completions.d/alacritty.fish"
	install -D -m644 "extra/logo/alacritty-term.svg" "$pkgdir/usr/share/pixmaps/Alacritty.svg"
}
