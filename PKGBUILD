# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: LuckyTurtleDev [aur at lukas1818 dot de]

_crate="youtube-tui"
_cratever="0.9.2"
pkgname="youtube-tui"
pkgver=0.9.2
pkgrel=1
pkgdesc='An aesthetically pleasing YouTube TUI written in Rust'
url='https://tui.siri.ws/youtube'
license=('GPL-3.0-or-later')

depends=('gcc-libs' 'libsixel' 'libxcb' 'mpv')
makedepends=('cargo' 'cargo-auditable')
optdepends=('konsole: Default terminal emulator'
            'yt-dlp: Default YouTube downloader')

source=("$_crate-$_cratever.tar.gz::https://static.crates.io/crates/youtube-tui/0.9.2/download")
sha512sums=('72ca61bd4b7d1e98e10d7c345632f5e17f0acff96a71cfe1cef69d56a8914b787ded42cef5c8d3b6efb7005e5e048e66803fcc81cf31842e9a2354c58c12ed02')

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
