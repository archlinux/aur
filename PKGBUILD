#!/usr/bin/bash

# Maintainer: bannert <aur@bannert.dev>

pkgname=karere
pkgver=2.3.2
pkgrel=1
pkgdesc="A fast, native WhatsApp client for Linux with GTK4/LibAdwaita"
arch=('x86_64')
url="https://github.com/tobagin/karere"
license=('GPL-3.0-or-later')
depends=(
	'gtk4'
	'libadwaita'
	'webkitgtk-6.0'
	'glib2'
	'hicolor-icon-theme'
	'dbus'
)
makedepends=(
	'meson'
	'ninja'
	'rust'
	'desktop-file-utils'
	'appstream-glib'
	'appstream'
)
optdepends=(
	'hunspell: spell checking support'
	'libappindicator-gtk3: system tray support'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('08e1f59d767ec82867a52491685d66737a1ae4d86d12dc760ab61d97ef1b8646')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	export CARGO_HOME="$srcdir/cargo-home"
	mkdir -p "$CARGO_HOME"

	# Patch meson.build to remove --offline flag for default profile
	# (upstream uses offline for Flatpak builds with vendored deps)
	sed -i "s/cargo_options += \[ '--release', '--offline' \]/cargo_options += [ '--release' ]/" meson.build

	# Strip source paths from binary to avoid $srcdir references in panic messages
	export RUSTFLAGS="--remap-path-prefix=$srcdir=/build"

	meson setup build \
		--prefix=/usr \
		--buildtype=release \
		-Dprofile=default

	meson compile -C build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	meson install -C build --destdir="$pkgdir"

	# Validate desktop file
	desktop-file-validate "$pkgdir/usr/share/applications/"*.desktop

	# Validate appstream metadata
	appstream-util validate-relax --nonet "$pkgdir/usr/share/metainfo/"*.xml
}
