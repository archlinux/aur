#!/usr/bin/bash

# Maintainer: bannert <aur@bannert.dev>

pkgname=karere
pkgver=2.5.4
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
	'cairo'
	'pango'
)
makedepends=(
	'meson'
	'ninja'
	'rust'
	'desktop-file-utils'
	'appstream-glib'
	'appstream'
	'blueprint-compiler'
	'python-gobject'
)
optdepends=(
	'hunspell: spell checking support'
	'libappindicator-gtk3: system tray support'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d3c8f89b201841ec2e54cc4ab1369c0df3e1d4ede2392ad79c4cc876ed47d8ac')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	export CARGO_HOME="$srcdir/cargo-home"
	mkdir -p "$CARGO_HOME"

	# Fix for "ImportError: cannot import name '_gi'" in blueprint-compiler
	# This occurs when a user Python environment (like Conda) conflicts with system libraries.
	# We force the use of system python for the build process.
	export PYTHON="/usr/bin/python3"
	export PYTHONPATH="/usr/lib/python3.14/site-packages"
	export PATH="/usr/bin:$PATH"

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
