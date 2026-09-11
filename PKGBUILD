#!/usr/bin/bash

# Maintainer: bannert <aur@bannert.dev>

pkgname=karere
pkgver=4.2.5 # renovate: datasource=github-tags depName=tobagin/karere
pkgrel=2
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
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('29caf406780ba1450a68166b2bd3f653045f7510841f662d2e66fa475932e24d')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	# Fix for "ImportError: cannot import name '_gi'" in blueprint-compiler
	# This occurs when a user Python environment (like Conda) conflicts with system libraries.
	# We force the use of system python for the build process.
	export PYTHON="/usr/bin/python3"
	export PYTHONPATH="$(/usr/bin/python3 -c 'import site; print(site.getsitepackages()[0])')"
	export PATH="/usr/bin:$PATH"

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

	meson install -C build --destdir="$pkgdir"

	# cef-dll-sys copies the CEF runtime (libcef.so, resources, locales) next to
	# the built binary, and CEF resolves resources relative to /proc/self/exe.
	# Ship binary + runtime together in /usr/lib/karere with rpath $ORIGIN and a
	# /usr/bin/karere symlink (procfs resolves through it, so lookup still works).
	local rundir="$srcdir/$pkgname-$pkgver/build/target/release"
	[[ -f "$rundir/libcef.so" ]] || { echo "CEF runtime not found in $rundir" >&2; return 1; }

	install -d "$pkgdir/usr/lib/karere"
	install -m755 -t "$pkgdir/usr/lib/karere" \
		"$rundir"/libcef.so \
		"$rundir"/libEGL.so \
		"$rundir"/libGLESv2.so \
		"$rundir"/libvk_swiftshader.so \
		"$rundir"/libvulkan.so.1 \
		"$rundir"/chrome-sandbox
	install -m644 -t "$pkgdir/usr/lib/karere" \
		"$rundir"/*.pak \
		"$rundir"/icudtl.dat \
		"$rundir"/v8_context_snapshot.bin \
		"$rundir"/vk_swiftshader_icd.json
	cp -a "$rundir/locales" "$pkgdir/usr/lib/karere/locales"

	mv "$pkgdir/usr/bin/karere" "$pkgdir/usr/lib/karere/karere"
	patchelf --set-rpath '$ORIGIN' "$pkgdir/usr/lib/karere/karere"
	ln -s ../lib/karere/karere "$pkgdir/usr/bin/karere"

	# Validate desktop file
	desktop-file-validate "$pkgdir/usr/share/applications/"*.desktop

	# Validate appstream metadata
	appstream-util validate-relax --nonet "$pkgdir/usr/share/metainfo/"*.xml
}
