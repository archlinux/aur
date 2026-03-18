# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: LuckyTurtleDev [aur at lukas1818 dot de]

_crate="youtube-tui"
_cratever="0.9.4"
pkgname="youtube-tui"
pkgver=0.9.4
pkgrel=1
pkgdesc='An aesthetically pleasing YouTube TUI written in Rust'
url='https://tui.siri.ws/youtube'
license=('GPL-3.0-or-later')

depends=('libgcc' 'libsixel' 'libxcb' 'mpv')
makedepends=('cargo' 'cargo-auditable')
optdepends=('konsole: Default terminal emulator'
            'yt-dlp: Default YouTube downloader')

source=("$_crate-$_cratever.tar.gz::https://static.crates.io/crates/youtube-tui/0.9.4/download")
sha512sums=('6ecf20586264abf41a3f7cc2c2cc36ebe7f55fdad31a56f11fac4503fda6c95b23efae1dd5f924774d2fe622cca275446dc470b9e5d2279f72fd6ac513111f9d')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

prepare() {
	cd "$srcdir/$_crate-$_cratever"

	export RUSTUP_TOOLCHAIN=stable

	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$_crate-$_cratever"
	
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=" -ffat-lto-objects"

	cargo auditable build \
		--frozen \
		--release
}

package() {
	cd "$srcdir/$_crate-$_cratever"
	install -Dm755 "target/release/youtube-tui" -t "$pkgdir/usr/bin"
}
