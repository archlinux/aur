# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>

pkgname='spacedrive'
pkgver=0.1.2
pkgrel=5
pkgdesc='Spacedrive is an open source cross-platform file explorer, powered by a virtual distributed filesystem written in Rust.'
arch=('x86_64')
url='https://spacedrive.com/'
license=('AGPL3')
conflicts=('spacedrive-git')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/spacedriveapp/spacedrive/archive/refs/tags/${pkgver}.tar.gz")
depends=('ffmpeg' 'libheif' 'gtk3' 'webkit2gtk' 'pango' 'gdk-pixbuf2' 'cairo' 'libsoup' 'glib2')
makedepends=('cargo-nightly' 'pnpm' 'clang' 'git')
sha256sums=('21ae09726139d445174f1b92dd47ec626291a64b7846ed14cc1f44aa658c2d88')

prepare() {
	cd "${pkgname}-${pkgver}"

	pnpm install
}

build() {
	cd "${pkgname}-${pkgver}"

	export CARGO_TARGET_DIR=target
	export RUSTUP_TOOLCHAIN=1.73

	pnpm prep
	pnpm tauri build --bundles app
}

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm0755 -t "${pkgdir}/usr/bin/" "apps/desktop/src-tauri/target/release/spacedrive"
	install -Dm0755 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
