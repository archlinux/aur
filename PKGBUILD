#!/usr/bin/bash

# Maintainer: bannert <aur@bannert.dev>

pkgname=karere
pkgver=1.0.3
pkgrel=1
pkgdesc="A modern, native GTK4/LibAdwaita wrapper for WhatsApp Web"
arch=('x86_64')
url="https://github.com/tobagin/karere"
license=('GPL3')
depends=('gtk4' 'libadwaita' 'webkitgtk-6.0' 'libsoup' 'glib2' 'json-glib' 'libgee' 'hicolor-icon-theme')
makedepends=('meson' 'ninja' 'vala' 'blueprint-compiler' 'gobject-introspection' 'desktop-file-utils' 'appstream-glib' 'gettext' 'aspell' 'nuspell')
optdepends=('gspell: spell checking support' 'libvoikko: Finnish spell-checker' 'hspell: Hebrew spell-checker')
provides=('karere')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('625f5f1f864c01e41a6174fb83d083b01a402c7ca14a66fbe81021f724a41989')

build() {
	set -euo pipefail
	cd "$srcdir/$pkgname-$pkgver"

	# Configure the build
	meson setup build --prefix=/usr

	# Compile the project
	meson compile -C build
}

package() {
	set -euo pipefail
	cd "$srcdir/$pkgname-$pkgver"

	# Install the compiled files
	meson install -C build --destdir="$pkgdir"

	# Validate desktop files
	desktop-file-validate "$pkgdir/usr/share/applications/"*.desktop

	# Validate appstream metadata
	appstream-util validate-relax --nonet "$pkgdir/usr/share/metainfo/"*.xml
}
