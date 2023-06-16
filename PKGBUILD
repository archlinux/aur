# Maintainer: j4qfrost <j4qfrost at gmail dot com>
# Maintainer: ptolemy753 <dsconce at protonmail dot com>
# Maintainer: peeweep <peeweep at 0x0 dot ee>
# Contributor: Caleb Maclennan <caleb@alerque.com>

pkgname=neovide-git
_pkgname=${pkgname%-git}
pkgver=0.10.4.r17.gf412399
pkgrel=2
pkgdesc='No Nonsense Neovim Client in Rust'
arch=(x86_64)
url="https://github.com/$_pkgname/$_pkgname"
license=(MIT)
depends=(fontconfig
         freetype2
         libglvnd
         neovim
         sndio)
makedepends=(cargo
             cmake
             git
             gtk3
             python
             sdl2)
optdepends=('vulkan-intel: vulkan support for intel')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

prepare() {
	cd "$_pkgname"
	sed -i -e '/^incremental/a opt-level = 3' Cargo.toml
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

pkgver() {
	cd "$_pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=' -ffat-lto-objects'
	cargo build --frozen --release --features embed-fonts
}

package() {
	cd "$_pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "assets/$_pkgname.desktop"
	for px in 16 32 48 256; do
		install -Dm0644 "assets/$_pkgname-${px}x${px}.png" \
			"$pkgdir/usr/share/icons/hicolor/${px}x${px}/apps/$_pkgname.png"
	done
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
