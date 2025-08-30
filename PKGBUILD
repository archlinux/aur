# Credit: PKGBUILD from https://aur.archlinux.org/packages/alacritty-git
pkgname='alacritty-smooth-cursor-git'
_pkgname="alacritty"
pkgver=0.17.0.2464.gaf2923b5
pkgrel=1
epoch=1
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/GregTheMadMonk/alacritty-smooth-cursor"
pkgdesc="A cross-platform, GPU-accelerated terminal emulator with a smooth cursor motion patch"
license=('Apache')
depends=('freetype2' 'fontconfig' 'libxi' 'libxcursor' 'libxrandr')
makedepends=('rust' 'cargo' 'cmake' 'fontconfig' 'ncurses' 'desktop-file-utils' 'gdb' 'libxcb' 'libxkbcommon-x11' 'git' 'scdoc' 'gzip')
checkdepends=('ttf-dejavu') # for monospace fontconfig test
provides=('alacritty')
conflicts=('alacritty')
source=("$_pkgname::git+https://github.com/gregthemadmonk/alacritty.git#branch=all-patches")
sha256sums=('SKIP')
install=smooth-cursor.install

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

package_alacritty-smooth-cursor-git() {
	cd $_pkgname

	desktop-file-install -m 644 --dir "$pkgdir/usr/share/applications/" "$srcdir/$_pkgname/extra/linux/Alacritty.desktop"

	mkdir -p "$pkgdir/usr/share/man/man1" "$pkgdir/usr/share/man/man5"
	scdoc < extra/man/alacritty.1.scd | gzip -c | tee "$pkgdir/usr/share/man/man1/alacritty.1.gz" > /dev/null
	scdoc < extra/man/alacritty.5.scd | gzip -c | tee "$pkgdir/usr/share/man/man5/alacritty.5.gz" > /dev/null
	scdoc < extra/man/alacritty-msg.1.scd | gzip -c | tee "$pkgdir/usr/share/man/man1/alacritty-msg.1.gz" > /dev/null
	scdoc < extra/man/alacritty-bindings.5.scd | gzip -c | tee "$pkgdir/usr/share/man/man5/alacritty-bindings.5.gz" > /dev/null

	install -D -m755 "target/release/alacritty" "$pkgdir/usr/bin/alacritty"
	install -D -m644 "extra/linux/org.alacritty.Alacritty.appdata.xml" "$pkgdir/usr/share/appdata/org.alacritty.Alacritty.appdata.xml"
	install -D -m644 "extra/completions/alacritty.bash" "$pkgdir/usr/share/bash-completion/completions/alacritty"
	install -D -m644 "extra/completions/_alacritty" "$pkgdir/usr/share/zsh/site-functions/_alacritty"
	install -D -m644 "extra/completions/alacritty.fish" "$pkgdir/usr/share/fish/vendor_completions.d/alacritty.fish"
	install -D -m644 "extra/logo/alacritty-term.svg" "$pkgdir/usr/share/pixmaps/Alacritty.svg"
	install -D -m644 "extra/logo/compat/alacritty-term.png" "$pkgdir/usr/share/pixmaps/Alacritty.png"
}
