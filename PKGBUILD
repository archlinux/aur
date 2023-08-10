# Maintainer: Radeox <dawid.weglarz95@gmail.com>

pkgname=gnome-shell-extension-forge
_pkgname=forge
_gnomever=44
pkgver=72
pkgrel=1
pkgdesc="Tiling window manager for Gnome-Shell"
arch=('any')
url="https://github.com/jmmaranan/forge"
license=('GPLv3')
depends=('gnome-shell')
makedepends=('intltool' 'gettext' 'git' 'sassc')
source=("https://github.com/jmmaranan/${_pkgname}/archive/refs/tags/v${_gnomever}-${pkgver}.tar.gz")
sha256sums=("cddb318f9709099afdb3a68e5351b2274ba4db1fd8e7476ced358d32e3fae94d")

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
