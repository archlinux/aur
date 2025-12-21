#!/usr/bin/bash

# Maintainer: bannert <aur@bannert.dev>

pkgname=karere
pkgver=1.1.0
pkgrel=1
pkgdesc="A modern, native GTK4/LibAdwaita wrapper for WhatsApp Web"
arch=('x86_64')
url="https://github.com/tobagin/karere"
license=('GPL3')
depends=('gtk4>=4.10.0' 'libadwaita>=1.8.0' 'webkitgtk-6.0>=2.40.0' 'glib2>=2.70.0' 'hicolor-icon-theme')
makedepends=('meson' 'ninja' 'vala' 'blueprint-compiler' 'desktop-file-utils' 'appstream-glib' 'appstream' 'python')
optdepends=('hunspell: spell checking support')
provides=('karere')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('19e27654bc571c3b14e54a99d0bba958d814f0355618ea42d4baec680d0c1773')

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
