# Maintainer: Darkest Medium <darkestmedium@gmail.com>

pkgname=gnome-shell-extension-launch-new-instance-git
extensionname=launch-new-instance
pkgver=47.0.74.gfde934f
pkgrel=1
pkgdesc="Changes application icons to always launch a new instance when activated."
arch=("any")
url="https://extensions.gnome.org/extension/600/launch-new-instance/"
license=("GPL-2.0-or-later")
depends=("gnome-shell")
makedepends=("git" "glib2" "meson" "ninja")
source=("git+https://gitlab.gnome.org/GNOME/gnome-shell-extensions.git")
sha256sums=("SKIP")

# Automatically update pkgver based on latest Git commit
pkgver() {
	cd "${srcdir}/gnome-shell-extensions"
	git describe --tags | sed 's/^v//;s/-/./g'
}

build() {
	cd "${srcdir}/gnome-shell-extensions"
	# Configure meson to build only the desired extension
	meson setup build --prefix=/usr \
		-Denable_extensions="${extensionname}"
	meson compile -C build
}

package() {
	cd "${srcdir}/gnome-shell-extensions"
	meson install -C build --destdir "${pkgdir}"
	# Remove shared localization files to avoid conflicts with other shell-extensions
	rm -rf "${pkgdir}/usr/share/locale"/*
}
