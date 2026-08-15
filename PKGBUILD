# Maintainer: Sergey Shatunov <me@aur.rocks>

pkgname=rubick-kubernetes
pkgver=4.0.0
pkgrel=1
pkgdesc="Modern cross-platform Kubernetes GUI client"
arch=(x86_64)
url="https://github.com/Dudude-bit/rubick"
license=('GPL-3.0-or-later')
groups=()
depends=("gtk3" "webkit2gtk-4.1")
makedepends=("git" "bun" "cargo-tauri")
_commit=90c0ad378486a46992f8a6be53e179bab407f3ed
source=("$pkgname::git+$url.git#commit=$_commit"
        "com.k8s-gui.app.desktop")
sha256sums=('cc16e88e5aee1be1571d5ad77c2cddab794ea6288139c3668b887b2751992d67'
            '82f31d2a4c5fa49a3e7c52378c94fe16a62e3adb0082eed9cd9f2787849deb00')

pkgver() {
	cd "$srcdir/$pkgname"

	printf "%s" "$(git describe | sed 's/^v//g')"
}

build() {
	cd "$srcdir/$pkgname"

	CFLAGS+=' -ffat-lto-objects'
	export RUSTUP_TOOLCHAIN=stable

	bun install
	cargo tauri build --ci --no-bundle
}

package() {
	cd "$srcdir/$pkgname"

	install -Dm755 target/release/k8s-gui "${pkgdir}/usr/bin/rubick"
	install -Dm755 "${srcdir}/com.k8s-gui.app.desktop" "${pkgdir}/usr/share/applications/com.k8s-gui.app.desktop"
	install -dm755 "${pkgdir}/usr/share/icons/hicolor"
	for i in 32 64 128 256; do
		install -Dm644 src-tauri/icons/${i}x${i}.png "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/com.k8s-gui.app.png"
	done
	install -Dm644 src-tauri/icons/icon.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.k8s-gui.app.svg"
}
