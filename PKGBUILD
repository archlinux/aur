# Maintainer: jaoppb <joaopedroperes06@gmail.com>
pkgname=cranky
pkgver=0.3.0
pkgrel=1
pkgdesc="A minimalist, performant, and modular bar for Hyprland"
arch=('x86_64' 'aarch64')
url="https://github.com/jaoppb/cranky"
license=('MIT' 'Apache')
depends=('wayland' 'libxkbcommon' 'fontconfig' 'dbus')
optdepends=('uwsm: for systemd session management')
makedepends=('cargo' 'pkg-config')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('28039fd86be1b3f18344437e435ce7c0bd73bdd92c569c072a30c06ed1d3475c')

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
