# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: LuckyTurtleDev [aur at lukas1818 dot de]

_crate="youtube-tui"
pkgname="youtube-tui"
pkgver=0.8.1
pkgrel=1
pkgdesc='An aesthetically pleasing YouTube TUI written in Rust'
url='https://siriusmart.github.io/youtube-tui'
license=('GPL-3.0-or-later')

depends=('gcc-libs' 'libsixel' 'libxcb' 'mpv')
makedepends=('cargo')
optdepends=('konsole: Default terminal emulator'
            'yt-dlp: Default YouTube downloader')

source=("$_crate-0.8.1.tar.gz::https://crates.io/api/v1/crates/youtube-tui/0.8.1/download")
sha512sums=('d203cb4c691e3834e1e65e7ad23c89f397bef5dcecce09c58f5bcd5ff894d4f16b2c82d0b652898556d4e54a38d57e63ab183ae26b66b57d90be668b71f5148d')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

prepare() {
	cd "$srcdir/$_crate-0.8.1"

	export RUSTUP_TOOLCHAIN=stable

	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$_crate-0.8.1"
	
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=" -ffat-lto-objects"

	
	cargo build \
		--offline \
		--locked \
		--release
}

package() {
	cd "$srcdir/$_crate-0.8.1"
	install -Dm755 "target/release/youtube-tui" -t "$pkgdir/usr/bin"
}