# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>

pkgname='spacedrive'
pkgver=0.2.0
pkgrel=1
pkgdesc='Spacedrive is an open source cross-platform file explorer, powered by a virtual distributed filesystem written in Rust.'
arch=('x86_64')
url='https://spacedrive.com/'
license=('AGPL3')
conflicts=('spacedrive-git')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/spacedriveapp/spacedrive/archive/refs/tags/${pkgver}.tar.gz")
depends=('ffmpeg' 'libheif' 'gtk3' 'webkit2gtk' 'pango' 'gdk-pixbuf2' 'cairo' 'libsoup' 'glib2')
makedepends=('cargo-nightly' 'pnpm' 'clang' 'git')
sha256sums=('83d5635500a82a022429cf639bd4560d19f3a347b83547dfb125e39e17b027c6')

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
