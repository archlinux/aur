# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>

pkgname='spacedrive'
pkgver=0.2.13
pkgrel=1
pkgdesc='Spacedrive is an open source cross-platform file explorer, powered by a virtual distributed filesystem written in Rust.'
arch=('x86_64')
url='https://spacedrive.com/'
license=('AGPL3')
conflicts=('spacedrive-git')
source=(
	"${pkgname}-v${pkgver}.tar.gz::https://github.com/spacedriveapp/spacedrive/archive/refs/tags/${pkgver}.tar.gz"
	"0001-Fix-BLAKE3-2441.patch"
)
depends=('ffmpeg' 'libheif' 'gtk3' 'webkit2gtk' 'pango' 'gdk-pixbuf2' 'cairo' 'libsoup' 'glib2')
makedepends=('cargo' 'pnpm>=9' 'clang' 'git' 'lld')
sha256sums=(
	'446b4ddf66ca1dd3be88ca6e250017569a1ba190e2f60cb9fb56f1e6bc4ca4cc'
	'41ed3c7dbc4c6658972c248187d3c9b4e00668d449478297b5c92aa9e7412096'
)
makeopts=(!lto)

prepare() {
	cd "${pkgname}-${pkgver}"

	patch -p1 -i ../0001-Fix-BLAKE3-2441.patch
	pnpm install
}

build() {
	cd "${pkgname}-${pkgver}"

	export CARGO_TARGET_DIR=target
	export RUSTFLAGS='-Clinker=clang -Clink-arg=-fuse-ld=lld'
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
