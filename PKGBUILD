#!/usr/bin/bash

# Maintainer: bannert <aur@bannert.dev>

pkgname=karere
pkgver=0.8.0
pkgrel=1
pkgdesc="A modern, native GTK4/LibAdwaita wrapper for WhatsApp Web"
arch=('x86_64')
url="https://github.com/tobagin/karere"
license=('GPL3')
depends=('libadwaita' 'webkitgtk-6.0' 'libsecret' 'hicolor-icon-theme')
makedepends=('meson' 'ninja' 'vala' 'blueprint-compiler' 'gobject-introspection' 'desktop-file-utils' 'appstream-glib' 'gettext')
optdepends=('gspell: spell checking support')
provides=('karere')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('301c87d965c2f848c8798370c18af3a42625f4ffb5ac70102d6f02e1cb031bf7')

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
