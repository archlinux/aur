# Maintainer: Martin Rys <https://rys.rs/contact>

pkgname=samrewritten
pkgver=1.4.3
pkgrel=1
pkgdesc="Unlock achievements and stats on Steam, and more!"
url="https://github.com/PaulCombal/SamRewritten"
license=('GPL-3.0-only')
arch=('x86_64')
depends=('gtk4')
makedepends=('cargo' 'pkg-config')
optdepends=('libadwaita: for Adwaita styling')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/PaulCombal/SamRewritten/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('77b9990b043a06b39676ddc946ae220cb1d5f5bc538f42178ad7c7245bcec833')

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

	for dir in locale/*/; do
		install -Dm644 \
			"${dir}/LC_MESSAGES/"*.mo \
			-t "${pkgdir}/usr/share/locale/$(basename "${dir}")/LC_MESSAGES"
	done

}
