# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Mikael Blomstrand <mbloms ÅT kth DÖT se>
# Contributor: Tobias Umbach <tobias@fastmail.mx>
# Contributor: Wesley Moore <wes@wezm.net>

pkgname=neovim-gtk
pkgver=1.0.1
pkgrel=1
pkgdesc='GTK UI for Neovim written in Rust'
arch=(x86_64 i686)
url="https://github.com/Lyude/$pkgname"
license=(GPL3)
depends=(neovim gtk4 vte3)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('4badee0dedb3f2a22e953a3d940a3ebf90bd347a93d79f852fe7c3ea1bc5c3e3')

prepare() {
	cd "$_archive"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$_archive"
	local RUSTUP_TOOLCHAIN=stable
	local CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$_archive"
	local RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" target/release/nvim-gtk
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	install -Dm0644 -t "$pkgdir/usr/share/nvim-gtk/runtime/" runtime/plugin/nvim_gui_shim.vim
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "desktop/org.daa.NeovimGtk.desktop"
	install -Dm0644 desktop/org.daa.NeovimGtk_48.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/org.daa.NeovimGtk.png"
	install -Dm0644 desktop/org.daa.NeovimGtk_128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/org.daa.NeovimGtk.png"
	install -Dm0644 desktop/org.daa.NeovimGtk.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.daa.NeovimGtk.svg"
}
