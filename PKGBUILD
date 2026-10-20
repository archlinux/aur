# Maintainer: ilovemikael <itsmeguys2247 at gmail dot com>
pkgname='alacritty-git'
_pkgname="alacritty"
pkgver=0.17.0.2561.g3d658d2e
pkgrel=1
epoch=1
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/alacritty/alacritty"
pkgdesc="A cross-platform, GPU-accelerated terminal emulator"
license=('Apache')
depends=('freetype2' 'fontconfig' 'libxi' 'libxcursor' 'libxrandr')
makedepends=('rust' 'cargo' 'cmake' 'fontconfig' 'ncurses' 'desktop-file-utils' 'gdb' 'libxcb' 'libxkbcommon-x11' 'git' 'scdoc' 'gzip')
checkdepends=('ttf-dejavu') # for monospace fontconfig test
provides=('alacritty')
conflicts=('alacritty')
source=("$_pkgname::git+https://github.com/alacritty/alacritty.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname/alacritty"
	echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d- -f1).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build(){
  cd "$_pkgname"
  cargo build --release
}

check(){
  cd "$_pkgname"
  cargo test --release
}

package() {
	cd "$_pkgname"

	desktop-file-install -m 644 --dir "$pkgdir/usr/share/applications/" "extra/linux/Alacritty.desktop"
	install -Dm755 "target/release/alacritty" "$pkgdir/usr/bin/alacritty"
	install -Dm644 "extra/linux/org.alacritty.Alacritty.appdata.xml" "$pkgdir/usr/share/appdata/org.alacritty.Alacritty.appdata.xml"
	install -Dm644 "extra/completions/alacritty.bash" "$pkgdir/usr/share/bash-completion/completions/alacritty"
	install -Dm644 "extra/completions/_alacritty" "$pkgdir/usr/share/zsh/site-functions/_alacritty"
	install -Dm644 "extra/completions/alacritty.fish" "$pkgdir/usr/share/fish/vendor_completions.d/alacritty.fish"
	install -Dm644 "extra/logo/alacritty-term.svg" "$pkgdir/usr/share/pixmaps/Alacritty.svg"
	install -Dm644 "extra/logo/compat/alacritty-term.png" "$pkgdir/usr/share/pixmaps/Alacritty.png"

  for i in 1 5 7;
    do mkdir -p "$pkgdir/usr/share/man/man$i"; done

  cd extra/man
	scdoc < alacritty.1.scd | gzip -c | tee "$pkgdir/usr/share/man/man1/alacritty.1.gz" > /dev/null
	scdoc < alacritty.5.scd | gzip -c | tee "$pkgdir/usr/share/man/man5/alacritty.5.gz" > /dev/null
	scdoc < alacritty-msg.1.scd | gzip -c | tee "$pkgdir/usr/share/man/man1/alacritty-msg.1.gz" > /dev/null
	scdoc < alacritty-bindings.5.scd | gzip -c | tee "$pkgdir/usr/share/man/man5/alacritty-bindings.5.gz" > /dev/null
	scdoc < alacritty-escapes.7.scd | gzip -c | tee "$pkgdir/usr/share/man/man7/alacritty-escapes.7.gz" > /dev/null
}
