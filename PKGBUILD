# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>

pkgname='spacedrive-git'
pkgver=r2297.8ad468b
pkgrel=3
pkgdesc='Spacedrive is an open source cross-platform file explorer, powered by a virtual distributed filesystem written in Rust.'
arch=('x86_64')
url='https://spacedrive.com/'
license=('AGPL3')
source=('spacedrive::git+https://github.com/spacedriveapp/spacedrive.git')
depends=('ffmpeg' 'libheif' 'gtk3' 'webkit2gtk' 'pango' 'gdk-pixbuf2' 'cairo' 'libsoup' 'glib2')
makedepends=('cargo-nightly' 'pnpm' 'git' 'clang')
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "${pkgname%-git}"

	export CARGO_TARGET_DIR=target

	pnpm install
	pnpm prep
}

build() {
	cd "${pkgname%-git}"

	export CARGO_TARGET_DIR=target

	pnpm tauri build --bundles app
}

package() {
	cd "${pkgname%-git}"

	install -Dm0755 -t "${pkgdir}/usr/bin/" "apps/desktop/src-tauri/target/release/spacedrive"
	install -Dm0755 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
