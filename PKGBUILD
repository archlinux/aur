# Maintainer: Martin Rys <https://rys.rs/contact>

pkgname=samrewritten
pkgver=1.2.0
pkgrel=1
pkgdesc="Unlock achievements and stats on Steam, and more!"
url="https://github.com/PaulCombal/SamRewritten"
license=('GPL-3.0-only')
arch=('x86_64')
makedepends=('cargo' 'gtk4' 'pkg-config')
depends=('gtk4')
optdepends=('libadwaita: for Adwaita styling')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/PaulCombal/SamRewritten/archive/v${pkgver}.tar.gz")
sha256sums=('16be10af55b984c161e7a510ab0cc5fe4b0edf7a0dc82d47217ce136c152fb43')

prepare() {
	cd "${srcdir}/SamRewritten-${pkgver}"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target host-tuple
}

build() {
	cd "${srcdir}/SamRewritten-${pkgver}"
	export CARGO_TARGET_DIR=target

	# Might break builds, just let cargo be in charge
	unset CFLAGS
	unset CXXFLAGS
	unset LDFLAGS

	cargo build --release --frozen
}

package() {
	cd "${srcdir}/SamRewritten-${pkgver}"

	install -Dm755 "target/release/samrewritten" "${pkgdir}/usr/bin/samrewritten"
	install -Dm644 "assets/icon_64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/samrewritten.png"
	install -Dm644 "assets/icon_256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/samrewritten.png"
	install -Dm644 "package/samrewritten.desktop" "${pkgdir}/usr/share/applications/samrewritten.desktop"
	install -Dm644 "assets/org.samrewritten.SamRewritten.gschema.xml" "${pkgdir}/usr/share/glib-2.0/schemas/org.samrewritten.SamRewritten.gschema.xml"
}
