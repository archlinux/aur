pkgname=lwe-git
pkgver=0.9.0.beta.94.4acd9fd
pkgrel=1
pkgdesc="Linux dynamic wallpaper shell for Wallpaper Engine content"
arch=('x86_64' 'aarch64')
url="https://github.com/YangYuS8/lwe"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
makedepends=('git' 'openssl' 'appmenu-gtk-module' 'libappindicator-gtk3' 'librsvg' 'cargo' 'cargo-tauri' 'pnpm' 'nodejs')
provides=('lwe')
conflicts=('lwe')
source=("git+${url}.git")
sha256sums=('SKIP')

prepare() {
	cd "${srcdir}/lwe"
	pnpm install --frozen-lockfile
}

build() {
	cd "${srcdir}/lwe"
	cargo tauri build -b deb
}

package() {
	cd "${srcdir}/lwe"
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
