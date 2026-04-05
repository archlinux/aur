pkgname=lwe-git
pkgver=0.0.0
pkgrel=3
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

pkgver() {
	cd "${srcdir}/lwe"
	if git describe --long --abbrev=7 --tags >/dev/null 2>&1; then
		git describe --long --abbrev=7 --tags | sed 's/^v//;s/-/./g'
	else
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	fi
}

prepare() {
	cd "${srcdir}/lwe"
	pnpm install --frozen-lockfile
}

build() {
	cd "${srcdir}/lwe"
	unset CARGO_ENCODED_RUSTFLAGS
	export RUSTFLAGS="-C linker=cc -C link-arg=-fuse-ld=bfd -C link-arg=-Wl,--no-as-needed -C link-arg=-lsqlite3"
	export CARGO_PROFILE_RELEASE_LTO=false
	export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=16
	export CARGO_PROFILE_RELEASE_STRIP=false
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
