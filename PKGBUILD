# Maintainer: Boris Novikov <boris.novikov95@gmail.com>

pkgname=claurst-git
pkgver=0.1.1.r1.gc21436c
pkgrel=1
pkgdesc="Open-source, multi-provider terminal coding agent built in Rust (clean-room reimplementation of Claude Code)"
arch=('x86_64' 'aarch64')
url="https://github.com/kuberwastaken/claurst"
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs' 'alsa-lib' 'openssl' 'xdotool')
makedepends=('git' 'cargo')
provides=('claurst')
conflicts=('claurst')
options=('!lto')
source=("claurst::git+https://github.com/kuberwastaken/claurst.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/claurst"
	git describe --long --abbrev=7 --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/claurst/src-rust"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/claurst/src-rust"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --package claurst
}

package() {
	cd "$srcdir/claurst"
	install -Dm755 "src-rust/target/release/claurst" "$pkgdir/usr/bin/claurst"
	install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
	install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
