# Maintainer: Nova King <technobaboo@proton.me>

pkgname="stardust-xr-server"
pkgver="0.50.1"
pkgrel="1"
pkgdesc="Usable Linux display server that reinvents human-computer interaction for all kinds of XR"
arch=("x86_64" "aarch64")
url="https://github.com/StardustXR/server"
license=("GPL-2.0-only")
depends=(
	"vulkan-icd-loader"
	"mesa"
	"libx11"
	"fontconfig"
	"libxkbcommon"
)
makedepends=(
	"git"
	"cargo"
	"cmake"
	"pkg-config"
)
provides=("stardust-server")
source=("git+https://github.com/StardustXR/server.git#tag=$pkgver")
sha256sums=("SKIP")
options+=(!lto !debug !strip)

prepare() {
	cd "${srcdir}/server"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "${srcdir}/server"
	cargo build --release --target "${CARCH}-unknown-linux-gnu"
}

package() {
	cd "${srcdir}/server"
	install -Dm755 \
		"target/${CARCH}-unknown-linux-gnu/release/${pkgname}" \
		"${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 \
		LICENSE \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 \
		README.md \
		"${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
