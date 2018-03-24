pkgname=('alacritty-scrollback-git' 'alacritty-scrollback-terminfo-git')
_pkgname="alacritty"
pkgver=0.1.0.749.g6836308
pkgrel=1
arch=('x86_64' 'i686')
url="https://github.com/neon64/alacritty"
license=('Apache-2.0')
makedepends=('rust' 'cargo' 'cmake' 'fontconfig' 'freetype2' 'git' 'ncurses')
source=("$_pkgname::git+https://github.com/neon64/alacritty.git")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).$(git rev-list --count HEAD).g$(git describe --always)"
}

package_alacritty-scrollback-git() {
	pkgdesc="A cross-platform, GPU-accelerated terminal emulator, with scrollback"
	depends=('freetype2' 'fontconfig' 'xclip')
	provides=('alacritty')
	conflicts=('alacritty')

	cd $_pkgname

	env CARGO_INCREMENTAL=0 cargo build --release

	install -D -m755 "$srcdir/$_pkgname/target/release/alacritty" "$pkgdir/usr/bin/alacritty"
	install -D -m644 "$srcdir/$_pkgname/Alacritty.desktop" "$pkgdir/usr/share/applications/Alacritty.desktop"
	install -D -m644 "$srcdir/$_pkgname/alacritty.man" "$pkgdir/usr/share/man/man1/alacritty.1"
	install -D -m644 "$srcdir/$_pkgname/alacritty-completions.bash" "$pkgdir/usr/share/bash-completion/completions/alacritty"
	install -D -m644 "$srcdir/$_pkgname/alacritty-completions.zsh" "$pkgdir/usr/share/zsh/site-functions/_alacritty"
	install -D -m644 "$srcdir/$_pkgname/alacritty-completions.fish" "$pkgdir/usr/share/fish/completions/alacritty.fish"
}

package_alacritty-scrollback-terminfo-git() {
	pkgdesc="Terminfo files for the alacritty terminal emulator, with scrollback"
	provides=('alacritty-terminfo')
	conflicts=('alacritty-terminfo')

	cd $_pkgname

	install -dm 755 "$pkgdir/usr/share/terminfo/a/"
	tic -o "$pkgdir/usr/share/terminfo" alacritty.info
}
