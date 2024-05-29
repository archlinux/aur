# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>
# Contributor: AEnterprise <aenterprise2@gmail.com>

pkgname='spacedrive'
pkgver=0.2.14
pkgrel=1
pkgdesc='Spacedrive is an open source cross-platform file explorer, powered by a virtual distributed filesystem written in Rust.'
arch=('x86_64')
url='https://spacedrive.com/'
license=('AGPL3')
conflicts=('spacedrive-git')
source=(
	"${pkgname}-v${pkgver}.tar.gz::https://github.com/spacedriveapp/spacedrive/archive/refs/tags/${pkgver}.tar.gz"
)
depends=('ffmpeg' 'libheif' 'gtk3' 'webkit2gtk' 'pango' 'gdk-pixbuf2' 'cairo' 'libsoup' 'glib2')
makedepends=('cargo' 'pnpm>=9' 'clang' 'git' 'lld')
sha256sums=(
	'94e7e1d1debe3a4e180198e4e0041bc2e9c9549185df92a81ebbdaefbecafb87'
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
	pnpm tauri build --bundles app -- --no-default-features
}

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm0755 -t "${pkgdir}/usr/bin/" "apps/desktop/src-tauri/target/release/spacedrive"
	install -Dm0755 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
