pkgname=lwe
pkgver=0.6.0
pkgrel=1
pkgdesc="Linux dynamic wallpaper shell for Wallpaper Engine content"
arch=('x86_64' 'aarch64')
url="https://github.com/YangYuS8/lwe"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
makedepends=('git' 'openssl' 'appmenu-gtk-module' 'libappindicator-gtk3' 'librsvg' 'cargo' 'cargo-tauri' 'pnpm' 'nodejs')
provides=('lwe')
conflicts=('lwe-git')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
	cd "${srcdir}/lwe-${pkgver}"
	pnpm install --frozen-lockfile
}

build() {
	cd "${srcdir}/lwe-${pkgver}"
	cargo tauri build -b "deb,rpm,appimage"
}

package() {
	cd "${srcdir}/lwe-${pkgver}"
	local deb_data_dirs=(
		src-tauri/target/release/bundle/deb/*/data
		target/release/bundle/deb/*/data
	)
	local deb_data_dir=""
	local candidate

	for candidate in "${deb_data_dirs[@]}"; do
		if [ -d "${candidate}" ]; then
			deb_data_dir="${candidate}"
			break
		fi
	done

	if [ -z "${deb_data_dir}" ]; then
		echo "No Debian bundle data directory found under src-tauri/target or target"
		return 1
	fi

	cp -a "${deb_data_dir}"/* "${pkgdir}"
}
