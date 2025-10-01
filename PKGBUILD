# Maintainer: Martin Rys <https://rys.rs/contact>

pkgname=samrewritten
pkgver=20250919.1
pkgrel=1
pkgdesc="Unlock achievements and stats on Steam, and more!"
url="https://github.com/PaulCombal/SamRewritten"
license=('GPL-3.0-only')
arch=('x86_64')
makedepends=('cargo' 'gtk4' 'pkg-config')
depends=('gtk4')
optdepends=('libadwaita: for Adwaita styling')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/PaulCombal/SamRewritten/archive/${pkgver}.tar.gz")
sha256sums=('7253ed0815f8b1a346ee4962fbb8e95569ebef68d406dc7c970984a92749d09b')

prepare() {
	cd "${srcdir}/SamRewritten-${pkgver}"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "${srcdir}/SamRewritten-${pkgver}"
	export CARGO_TARGET_DIR=target
	cargo build --release --frozen
}

package() {
	cd "${srcdir}/SamRewritten-${pkgver}"

	install -Dm755 "target/release/samrewritten" "${pkgdir}/usr/bin/samrewritten"
	install -Dm644 "assets/icon_64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/samrewritten.png"
	install -Dm644 "assets/icon_256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/samrewritten.png"
	install -Dm644 "package/samrewritten.desktop" "${pkgdir}/usr/share/applications/samrewritten.desktop"
}
