# Maintainer: Sergey Shatunov <me@aur.rocks>

_pkgname=rubick
pkgname=${_pkgname}-kubernetes
pkgver=4.7.1
pkgrel=1
pkgdesc="Modern cross-platform Kubernetes GUI client"
arch=(x86_64)
url="https://github.com/Dudude-bit/rubick"
license=('GPL-3.0-or-later')
depends=("kubectl" "cairo" "desktop-file-utils" "gdk-pixbuf2" "glib2" "gtk3" "hicolor-icon-theme" "libsoup3" "pango" "webkit2gtk-4.1")
makedepends=("bun" "cargo-tauri")
source=("${_pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz"
        "com.k8s-gui.app.desktop")
sha256sums=('f00e292d97d0e02a2e2dfee8caa99ebde3a94db6a4a4a79f190c476ad485a74b'
            '82f31d2a4c5fa49a3e7c52378c94fe16a62e3adb0082eed9cd9f2787849deb00')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	CFLAGS+=' -ffat-lto-objects'
	export RUSTUP_TOOLCHAIN=stable

	bun install
	cargo tauri build --ci --no-bundle
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	install -Dm755 target/release/Rubick "${pkgdir}/usr/bin/rubick"
	install -Dm755 "${srcdir}/com.k8s-gui.app.desktop" "${pkgdir}/usr/share/applications/com.k8s-gui.app.desktop"
	install -dm755 "${pkgdir}/usr/share/icons/hicolor"
	for i in 32 64 128; do
		install -Dm644 src-tauri/icons/${i}x${i}.png "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/com.k8s-gui.app.png"
	done
	install -Dm644 src-tauri/icons/128x128@2x.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/com.k8s-gui.app.png"
	install -Dm644 src-tauri/icons/icon.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.k8s-gui.app.svg"
}
