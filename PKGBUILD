# Maintainer: Standa Lukeš <archpkg@exyi.cz>

pkgname=mullvad-udp-over-tcp
pkgdesc="Proxy UDP traffic over a TCP stream (provides tcp2udp and udp2tcp binaries)"
pkgver=0.4.0
pkgrel=1
arch=(x86_64)
url=https://github.com/mullvad/udp-over-tcp
license=(MIT)
depends=()
makedepends=(git cargo rust)
optdepends=()
provides=()
conflicts=()
options=()
source=("$pkgname::git+https://github.com/mullvad/udp-over-tcp#tag=v${pkgver}")

sha256sums=('dc233e10c211f19afc63efe1def5fda7f78cb0e62fcdb9057c89a74f87caee44')

function prepare() {
	cd "${pkgname}"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "${pkgname}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --frozen --all-features --locked
}

function package() {
	cd "${pkgname}"
	install -Dm 755 ./target/release/udp2tcp "${pkgdir}/usr/bin/udp2tcp"
	install -Dm 755 ./target/release/tcp2udp "${pkgdir}/usr/bin/tcp2udp"
}

