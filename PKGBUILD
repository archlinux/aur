# Maintainer: Radeox <dawid.weglarz95@gmail.com>

pkgname=gnome-shell-extension-forge
_pkgname=forge
_gnomever=44
pkgver=68
pkgrel=1
pkgdesc="Tiling window manager for Gnome-Shell"
arch=('any')
url="https://github.com/jmmaranan/forge"
license=('GPLv3')
depends=('gnome-shell')
makedepends=('intltool' 'gettext' 'git' 'sassc')
source=("https://github.com/jmmaranan/${_pkgname}/archive/refs/tags/v${_gnomever}-${pkgver}.tar.gz")
sha256sums=("4ea5d09aed2ccef03d6c40163e9bfd902662cf4564787b05e6a2c649cab11b1e")

build() {
	cd "${srcdir}/${_pkgname}-${_gnomever}-${pkgver}/"
	make build
}

package() {
	cd "${srcdir}/${_pkgname}-${_gnomever}-${pkgver}/"
	local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)

	# Copy files
	install -d "$pkgdir/usr/share/gnome-shell/extensions/$uuid"
	cp -rT temp "$pkgdir/usr/share/gnome-shell/extensions/$uuid"
	cp -r temp/locale "$pkgdir/usr/share/"

	# Compile schemas
	glib-compile-schemas "$pkgdir/usr/share/gnome-shell/extensions/$uuid/schemas/"

	# Install extension
	install -d "$pkgdir/usr/share/gnome-shell/extensions/$uuid"

	# Remove unnecessary files
	rm -rf "$pkgdir/usr/share/locale"
}
