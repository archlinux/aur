pkgname=lwe-git
pkgver=0.0.0
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
	cargo tauri build -b deb
}

package() {
	cd "${srcdir}/lwe"
	cp -a src-tauri/target/release/bundle/deb/lwe-shell_*/data/* "${pkgdir}"
}
