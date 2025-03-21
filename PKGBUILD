# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>
# Contributor: AEnterprise <aenterprise2@gmail.com>

pkgname='spacedrive'
pkgver=0.4.3
pkgrel=2
pkgdesc='Spacedrive is an open source cross-platform file explorer, powered by a virtual distributed filesystem written in Rust.'
arch=('x86_64')
url='https://spacedrive.com/'
license=('AGPL-3.0-only')
conflicts=('spacedrive-git')
source=(
	"${pkgname}-v${pkgver}.tar.gz::https://github.com/spacedriveapp/spacedrive/archive/refs/tags/${pkgver}.tar.gz"
	"spacedrive.desktop"
)
depends=('ffmpeg' 'libheif' 'gtk3' 'webkit2gtk-4.1' 'pango' 'gdk-pixbuf2' 'cairo' 'libsoup' 'glib2' 'xdotool')
makedepends=('cargo' 'pnpm>=9' 'clang' 'git' 'lld')
sha256sums=(
	'55489e711e3714c812736abf20cf86c52377602ceefc7e9b665088900d09edf0'
	'0d9149faa1b17c8fea16e2ea344ca394c7fe93b33e746bb0168af81302ed164e'
)

prepare() {
	cd "${pkgname}-${pkgver}"

	pnpm install
}

build() {
	cd "${pkgname}-${pkgver}"

	export CARGO_TARGET_DIR=target
	export RUSTFLAGS='-Clinker-plugin-lto -Clinker=clang -Clink-arg=-fuse-ld=lld'
	export CFLAGS='-ffat-lto-objects'
	export CC=clang
	export COREPACK_ENABLE_STRICT=0

	pnpm prep
	pnpm exec tauri build --no-bundle -- --no-default-features
}

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm0755 "apps/desktop/src-tauri/target/release/sd-desktop" "${pkgdir}/usr/bin/spacedrive"
	install -Dm0755 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
	install -Dm0755 -t "${pkgdir}/usr/share/applications/" ../spacedrive.desktop
	install -Dm0644 apps/desktop/app-icon.png "${pkgdir}/usr/share/icons/spacedrive.png"
}
