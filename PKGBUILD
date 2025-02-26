# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: LuckyTurtleDev [aur at lukas1818 dot de]

_pkgtag=2.3.0 #auto updated by CI
_crate="tauri-cli"
pkgname="tauri-cli-prerelease"
pkgver=${_pkgtag/-/_}
pkgrel=1 #auto reset by CI
pkgdesc='Command line interface for building Tauri apps'
url='https://tauri.app'
license=('Apache-2.0' 'MIT')

depends=('gcc-libs' 'cargo' 'gcc' 'webkit2gtk-4.1' 'curl' 'wget' 'file' 'openssl' 'appmenu-gtk-module' 'libappindicator-gtk3' 'librsvg')
makedepends=('cargo')
conflicts=('tauri-cli')
provides=("tauri-cli=$pkgver")

source=("$_crate-$_pkgtag.tar.gz::https://crates.io/api/v1/crates/tauri-cli/$_pkgtag/download")
sha512sums=('e7ce1b3e3dcee7c15ca04ea0dd00485b38daf8273d61d0ee82f463f960e838635ede6c824e0c7e75d02eed6e59dbb9ee89ba9c8066be5e0c9333597b4c335c83')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

prepare() {
	cd "$srcdir/$_crate-$_pkgtag"

	export RUSTUP_TOOLCHAIN=stable

	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$_crate-$_pkgtag"
	
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=" -ffat-lto-objects"

	
	cargo build \
		--offline \
		--locked \
		--release
}

package() {
	cd "$srcdir/$_crate-$_pkgtag"
	install -Dm755 "target/release/cargo-tauri" -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE_MIT' -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 'LICENSE_APACHE-2.0' -t "$pkgdir/usr/share/licenses/$pkgname/"
}
