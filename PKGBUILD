# This PKGBUILD is based off the PKGBUILD for alacritty-git package
pkgname='alacritty-smooth-cursor-git'
_pkgname="alacritty"
pkgver=0.13.0.2084.g255a1e5
pkgrel=1
epoch=1
arch=('x86_64' 'i686')
url="https://github.com/gregthemadmonk/alacritty"
pkgdesc="A cross-platform, GPU-accelerated terminal emulator"
license=('Apache')
depends=('freetype2' 'fontconfig' 'libxi' 'libxcursor' 'libxrandr')
makedepends=('rust' 'cargo' 'cmake' 'fontconfig' 'ncurses' 'desktop-file-utils' 'gdb' 'libxcb' 'libxkbcommon' 'git')
checkdepends=('ttf-dejavu') # for monospace fontconfig test
provides=('alacritty')
conflicts=('alacritty')
source=("$_pkgname::git+$url.git#branch=smooth-cursor")
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

package() {
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
