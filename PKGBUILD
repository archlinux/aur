# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: LuckyTurtleDev [aur at lukas1818 dot de]

_crate="youtube-tui"
_cratever="0.9.3"
pkgname="youtube-tui"
pkgver=0.9.3
pkgrel=1
pkgdesc='An aesthetically pleasing YouTube TUI written in Rust'
url='https://tui.siri.ws/youtube'
license=('GPL-3.0-or-later')

depends=('gcc-libs' 'libsixel' 'libxcb' 'mpv')
makedepends=('cargo' 'cargo-auditable')
optdepends=('konsole: Default terminal emulator'
            'yt-dlp: Default YouTube downloader')

source=("$_crate-$_cratever.tar.gz::https://static.crates.io/crates/youtube-tui/0.9.3/download")
sha512sums=('1823018f8b1a35e2160bd6a5e2939f093f915ab6d4248706288f45a75838f8dcdf9fc581bc3d4f9d0b938582936550f373ae3ed092d05fb606f804978b1eced8')

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
