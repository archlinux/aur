# Maintainer: Sabrina Andersen <sabrina@utd.tf>
pkgname=fw16-led-matrixd-git
pkgver=0.0.0
pkgrel=1
pkgdesc="A cross-platform daemon for controlling the Framework 16 LED Matrixes"
arch=('x86_64' 'i686')
url="https://github.com/NukingDragons/fw16-led-matrixd"
license=('MIT')
makedepends=('git' 'rust')
optdepends=('systemd: systemd service support')
conflicts=('fw16-led-matrixd')
backup=('etc/fw16-led-matrixd/config.toml')
options=('!debug')
source=($pkgname'::git+https://github.com/nukingdragons/fw16-led-matrixd')
sha256sums=('SKIP') # Skip for GIT repo

# Use the Cargo.toml version instead of the pkgver variable above
pkgver()
{
	cd "$pkgname"
	sed -z 's/.*version = "\([^"]*\)".*/\1/g' Cargo.toml
}

prepare()
{
	cd "$pkgname"

	export RUSTUP_TOOLCHAIN=nightly
	cargo update
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build()
{
	cd "$pkgname"

	export RUSTUP_TOOLCHAIN=nightly
	export CARGO_TARGET_DIR="target"
	cargo build --frozen --release --all-features
}

check()
{
	cd "$pkgname"

	export RUSTUP_TOOLCHAIN=nightly
	cargo test --frozen --all-features
}

package()
{
	cd "$pkgname"

	install -Dm755 target/release/fw16-led-matrixd "${pkgdir}/usr/bin/fw16-led-matrixd"
	install -Dm755 target/release/ledcli "${pkgdir}/usr/bin/ledcli"
	install -Dm644 sample-posix-config.toml "${pkgdir}/etc/fw16-led-matrixd/config.toml"
	install -Dm644 daemon/fw16-led-matrixd.service "${pkgdir}/usr/lib/systemd/system/fw16-led-matrixd.service"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
