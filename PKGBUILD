# Maintainer: arc-d3v <arc.nix0@gmail.com>
pkgname='alacritty-graphics'
_pkgname="alacritty"
pkgdesc="A cross-platform, GPU-accelerated terminal emulator"
pkgver=0.16.0
pkgrel=1
arch=('x86_64')
url="https://github.com/ayosec/alacritty"
license=('Apache-2.0' 'MIT')
depends=('freetype2' 'fontconfig' 'libxi' 'libxcursor' 'libxkbcommon' 'libxkbcommon-x11' 'libxrandr')
makedepends=('rust' 'cargo' 'cmake' 'fontconfig' 'ncurses' 'desktop-file-utils' 'gdb' 'libxcb' 'git' 'scdoc')
checkdepends=('ttf-dejavu') # for monospace fontconfig test
provides=('alacritty')
conflicts=("${_pkgname}" "${_pkgname}-git" "alacritty-sixel-git")
source=("${_pkgname}-${pkgver}-graphics.tar.gz::${url}/archive/v${pkgver}-graphics.tar.gz")
sha512sums=('c2155a0e6f01ac5fae827c05d72a7f9b9feede34605d62005a5a0e326b59e02863141c8d7eb3cbec995e13cbe6cbbe55e92646c59d8827944d9c084aa9570fcb')

build(){
  cd "${_pkgname}-${pkgver}-graphics"
  env CARGO_INCREMENTAL=0 cargo build --release --locked
}

check(){
  cd "${_pkgname}-${pkgver}-graphics"
  env CARGO_INCREMENTAL=0 cargo test --release
}

package_alacritty-graphics() {
	cd "${_pkgname}-${pkgver}-graphics"

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
