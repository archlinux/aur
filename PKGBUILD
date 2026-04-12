# Maintainer: jaoppb <joaopedroperes06@gmail.com>
pkgname=cranky
pkgver=0.2.0
pkgrel=1
pkgdesc="A minimalist, performant, and modular bar for Hyprland"
arch=('x86_64' 'aarch64')
url="https://github.com/jaoppb/cranky"
license=('MIT' 'Apache')
depends=('wayland' 'libxkbcommon' 'fontconfig' 'dbus')
optdepends=('uwsm: for systemd session management')
makedepends=('cargo' 'pkg-config')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('773b6f5a6d67718748ae81190c096727b5d30e2c6be32b8fc5c609f7bd380690')

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$pkgname-$pkgver"
	cargo test --frozen
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "contrib/systemd/${pkgname}.service" "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"
	install -Dm644 "contrib/systemd/${pkgname}-uwsm.service" "${pkgdir}/usr/lib/systemd/user/${pkgname}-uwsm.service"
}
