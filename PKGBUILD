#!/usr/bin/bash

# Maintainer: bannert <aur@bannert.dev>

pkgname=karere
pkgver=4.2.5 # renovate: datasource=github-tags depName=tobagin/karere
pkgrel=3
pkgdesc="A fast, native WhatsApp client for Linux with GTK4/LibAdwaita"
arch=('x86_64')
url="https://github.com/tobagin/karere"
license=('GPL-3.0-or-later')
options=('!lto')
depends=(
	'gtk4'
	'libadwaita'
	'glib2'
	'hicolor-icon-theme'
	'dbus'
	'cairo'
	'pango'
	# libcef.so runtime libraries (readelf -d NEEDED)
	'nss'
	'nspr'
	'alsa-lib'
	'libx11'
	'libxcb'
	'libxcomposite'
	'libxdamage'
	'libxext'
	'libxfixes'
	'libxrandr'
	'libxkbcommon'
	'mesa'
	'systemd-libs'
	'libcups'
)
makedepends=(
	'meson'
	'ninja'
	'rust'
	'cmake'
	'patchelf'
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
_cefver='150.0.10+g8042e43+chromium-150.0.7871.101'
_cefdir="cef_binary_${_cefver}_linux64_minimal"
source=(
	"${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
	"${_cefdir}.zip::${url}/releases/download/cef-150.0.10-proprietary-codecs/${_cefdir//+/%2B}.zip"
)
sha256sums=(
	'29caf406780ba1450a68166b2bd3f653045f7510841f662d2e66fa475932e24d'
	'3bbe298368c4d87c19ad9b7ed4e8449ea91b32ffa3cefc8672791a1b96c9c3b9'
)

build() {
	cd "$srcdir/$pkgname-$pkgver"

	# Fix for "ImportError: cannot import name '_gi'" in blueprint-compiler
	# This occurs when a user Python environment (like Conda) conflicts with system libraries.
	# We force the use of system python for the build process.
	export PYTHON="/usr/bin/python3"
	export PYTHONPATH="$(/usr/bin/python3 -c 'import site; print(site.getsitepackages()[0])')"
	export PATH="/usr/bin:$PATH"

	# Use Karere's patched CEF build. The generic CEF downloaded by cef-dll-sys
	# contains an unused GLib WorkSource that busy-loops with external_message_pump.
	export CEF_PATH="$srcdir/$_cefdir/Release"

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

	# meson's cargo target is build_always_stale, so meson install re-runs cargo
	# inside fakeroot. Re-export the exact build env or the changed RUSTFLAGS
	# trigger a full rebuild that embeds $srcdir into the binary.
	export RUSTFLAGS="--remap-path-prefix=$srcdir=/build"
	export CEF_PATH="$srcdir/$_cefdir/Release"

	meson install -C build --destdir="$pkgdir"

	# Ship the verified Karere-patched CEF runtime rather than cef-dll-sys' generic
	# download. CEF requires its libraries and resources to remain version-matched.
	local cef_release="$srcdir/$_cefdir/Release"
	local cef_resources="$srcdir/$_cefdir/Resources"
	[[ -f "$cef_release/libcef.so" ]] || { echo "CEF runtime not found in $cef_release" >&2; return 1; }

	install -d "$pkgdir/usr/lib/karere"
	install -m755 -t "$pkgdir/usr/lib/karere" \
		"$cef_release"/libcef.so \
		"$cef_release"/libEGL.so \
		"$cef_release"/libGLESv2.so \
		"$cef_release"/libvk_swiftshader.so \
		"$cef_release"/libvulkan.so.1 \
		"$cef_release"/chrome-sandbox
	install -m644 -t "$pkgdir/usr/lib/karere" \
		"$cef_resources"/*.pak \
		"$cef_resources"/icudtl.dat \
		"$cef_release"/v8_context_snapshot.bin \
		"$cef_release"/vk_swiftshader_icd.json
	cp -a "$cef_resources/locales" "$pkgdir/usr/lib/karere/locales"

	mv "$pkgdir/usr/bin/karere" "$pkgdir/usr/lib/karere/karere"
	patchelf --set-rpath '$ORIGIN' "$pkgdir/usr/lib/karere/karere"
	ln -s ../lib/karere/karere "$pkgdir/usr/bin/karere"

	# Validate desktop file
	desktop-file-validate "$pkgdir/usr/share/applications/"*.desktop

	# Validate appstream metadata
	appstream-util validate-relax --nonet "$pkgdir/usr/share/metainfo/"*.xml
}
