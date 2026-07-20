# Maintainer: mescon <5875228+mescon@users.noreply.github.com>
# Split package: the DKMS driver (module + udev rules), logi-dd (the
# complete headless toolset) and logi-dd-gui (the graphical settings app).
pkgbase=logitech-trueforce-dkms
pkgname=('logitech-trueforce-dkms' 'logi-dd' 'logi-dd-gui')
_dkmsname=logitech-trueforce
pkgver=0.16.1
pkgrel=1
pkgdesc="DKMS kernel driver for Logitech TrueForce direct-drive wheels (RS50, G PRO): force feedback, TrueForce texture routing, and wheel settings via sysfs"
arch=('x86_64')
url="https://github.com/mescon/logitech-trueforce-linux-driver"
# The kernel module and logi-ffb/logi-dd/logi-tf-sim are GPL-2.0-only;
# logi-dd-gui (the Slint settings GUI) is GPL-3.0-or-later. Each split
# package narrows this to its own license.
license=('GPL-2.0-only' 'GPL-3.0-or-later')
makedepends=('cargo')
# !lto: makepkg's default -flto=auto would leave libtrueforce.a (built by
# tf-sim's build.rs and linked statically into logi-tf-sim) as GCC LTO
# bitcode, which rustc's lld link step cannot read (undefined logiTrueForce*
# symbols at link time).
options=('!lto')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# sha256 of the v0.15.0 release tarball. On the next version bump, regenerate:
#   updpkgsums && makepkg --printsrcinfo > .SRCINFO
sha256sums=('dfe36e6d8b160b7d622ef378e5b2dcc7fdb3cff03367d96c21c43e6161dfdc0f')

_src() {
	echo "$srcdir/logitech-trueforce-linux-driver-$pkgver"
}

build() {
	# logi-ffb (DirectInput FFB proxy), logi-dd (settings TUI), logi-dd-gui
	# (Slint settings GUI, GPL-3.0-or-later), and logi-tf-sim (simulated-
	# TrueForce daemon; statically linked against the in-repo libtrueforce,
	# its build.rs runs gcc+make, both in base-devel), the userspace
	# companions to the kernel module. Arch tracks current Rust, so
	# logi-dd-gui's MSRV (1.92, from Slint 1.17.1) is never a problem here;
	# no version guard needed (contrast packaging/debian/rules).
	cargo build --release --manifest-path "$(_src)/userspace/logi-dd/Cargo.toml"
}

package_logitech-trueforce-dkms() {
	pkgdesc="DKMS kernel driver for Logitech TrueForce direct-drive wheels (RS50, G PRO): force feedback, TrueForce texture routing, and wheel settings via sysfs"
	license=('GPL-2.0-only')
	depends=('dkms')
	optdepends=('logi-dd: settings TUI, FFB proxy, simulated TrueForce and shim installer'
	            'oversteer: GUI to configure wheel settings')
	provides=("$_dkmsname")
	conflicts=("$_dkmsname")
	install=$pkgbase.install

	local _src _dst
	_src="$(_src)"
	_dst="$pkgdir/usr/src/$_dkmsname-$pkgver"

	# DKMS module source. The .c keeps its historical name; Kbuild builds
	# it as hid-logitech-dd.ko (scoped to the direct-drive wheels).
	install -Dm644 -t "$_dst" \
		"$_src/mainline/hid-logitech-hidpp.c" \
		"$_src/mainline/hid-ids.h" \
		"$_src/mainline/hidpp_dd_tf_init.h" \
		"$_src/mainline/Kbuild" \
		"$_src/mainline/Makefile"

	# Versioned dkms.conf (PACKAGE_VERSION must match the /usr/src dir).
	sed "s/@PKGVER@/$pkgver/" \
		"$_src/packaging/aur/$pkgbase/dkms.conf" > "$_dst/dkms.conf"

	# Build-time identifier the loaded module reports (Kbuild reads it).
	echo "v$pkgver" > "$_dst/.git_hash"

	# udev rules: hand the wheel's sysfs + hidraw nodes, and /dev/uhid for
	# the logi-ffb virtual-device proxy, to the input group.
	install -Dm644 "$_src/udev/70-logitech-trueforce.rules" \
		"$pkgdir/usr/lib/udev/rules.d/70-logitech-trueforce.rules"
	install -Dm644 "$_src/udev/71-logi-ffb-uhid.rules" \
		"$pkgdir/usr/lib/udev/rules.d/71-logi-ffb-uhid.rules"

	# Docs + license.
	install -Dm644 "$_src/README.md" \
		"$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 "$_src/docs/GETTING_STARTED.md" \
		"$pkgdir/usr/share/doc/$pkgname/GETTING_STARTED.md"
	install -Dm644 "$_src/COPYING" \
		"$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_logi-dd() {
	pkgdesc="Terminal tools for Logitech TrueForce direct-drive wheels: settings TUI, DirectInput FFB proxy, simulated-TrueForce daemon and SDK shim installer"
	license=('GPL-2.0-only')
	depends=('logitech-trueforce-dkms')
	optdepends=('python: required by the TrueForce Proton shim installer'
	            'wine: run Logitech SDK DLLs for TrueForce in Proton sims')

	local _src
	_src="$(_src)"

	install -Dm755 \
		"$_src/userspace/logi-dd/target/release/logi-dd" \
		"$pkgdir/usr/bin/logi-dd"
	install -Dm755 \
		"$_src/userspace/logi-dd/target/release/logi-ffb" \
		"$pkgdir/usr/bin/logi-ffb"
	install -Dm755 \
		"$_src/userspace/logi-dd/target/release/logi-tf-sim" \
		"$pkgdir/usr/bin/logi-tf-sim"

	# TrueForce-in-Proton helper (resolves the SDK DLL dir via --sdk-dir /
	# $LOGITECH_TRUEFORCE_SDK_DIR / ~/.local/share/logitech-trueforce/sdk).
	install -Dm755 "$_src/tools/install-tf-shim.sh" \
		"$pkgdir/usr/bin/logitech-trueforce-install-shim"
}

package_logi-dd-gui() {
	pkgdesc="Graphical settings app for Logitech TrueForce direct-drive wheels"
	license=('GPL-3.0-or-later')
	depends=(
		'logi-dd'
		# Runtime libs for the Slint app: windowing (Wayland/X11), input
		# (xkbcommon), and GL/EGL rendering. Derived from `ldd`/`strings`
		# on the built binary; Slint dlopen's the wayland/X11/GL bits at
		# runtime rather than linking them, so ldd alone would miss them.
		'wayland'
		'libx11'
		'libxcb'
		'libxkbcommon'
		'libxkbcommon-x11'
		'libxcursor'
		'libxi'
		'libxrender'
		'libglvnd'
		'fontconfig'
		'freetype2'
		'hicolor-icon-theme'
	)

	local _src
	_src="$(_src)"

	install -Dm755 \
		"$_src/userspace/logi-dd/target/release/logi-dd-gui" \
		"$pkgdir/usr/bin/logi-dd-gui"

	# Desktop integration.
	install -Dm644 "$_src/desktop/logi-dd-gui.desktop" \
		"$pkgdir/usr/share/applications/logi-dd-gui.desktop"
	install -Dm644 "$_src/desktop/logi-dd-gui.svg" \
		"$pkgdir/usr/share/icons/hicolor/scalable/apps/logi-dd-gui.svg"
}
