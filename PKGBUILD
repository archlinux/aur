# Maintainer: mescon <5875228+mescon@users.noreply.github.com>
# Split package: the DKMS driver (module + udev rules), logi-wheel (the
# complete headless toolset) and logi-wheel-gui (the graphical settings app).
pkgbase=logitech-trueforce-dkms
pkgname=('logitech-trueforce-dkms' 'logi-wheel' 'logi-wheel-gui')
_dkmsname=logitech-trueforce
pkgver=0.20.0
pkgrel=1
pkgdesc="DKMS kernel driver for Logitech TrueForce direct-drive wheels (RS50, G PRO): force feedback, TrueForce texture routing, and wheel settings via sysfs"
arch=('x86_64')
url="https://github.com/mescon/logitech-trueforce-linux-driver"
# The kernel module and logi-ffb/logi-wheel/logi-tf-sim are GPL-2.0-only;
# logi-wheel-gui (the Slint settings GUI) is GPL-3.0-or-later. Each split
# package narrows this to its own license.
license=('GPL-2.0-only' 'GPL-3.0-or-later')
makedepends=('cargo')
# !lto: makepkg's default -flto=auto would leave libtrueforce.a (built by
# tf-sim's build.rs and linked statically into logi-tf-sim) as GCC LTO
# bitcode, which rustc's lld link step cannot read (undefined logiTrueForce*
# symbols at link time).
options=('!lto')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# sha256 of the v0.18.0 release tarball. On the next version bump, regenerate:
#   updpkgsums && makepkg --printsrcinfo > .SRCINFO
sha256sums=('ef9efa065ed4cd91807a4bf7f01cd6c89062b3195b2cfb23e3d189604a649b9f')

_src() {
	echo "$srcdir/logitech-trueforce-linux-driver-$pkgver"
}

build() {
	# logi-ffb (DirectInput FFB proxy), logi-wheel (settings TUI), logi-wheel-gui
	# (Slint settings GUI, GPL-3.0-or-later), and logi-tf-sim (simulated-
	# TrueForce daemon; statically linked against the in-repo libtrueforce,
	# its build.rs runs gcc+make, both in base-devel), the userspace
	# companions to the kernel module. Arch tracks current Rust, so
	# logi-wheel-gui's MSRV (1.92, from Slint 1.17.1) is never a problem here;
	# no version guard needed (contrast packaging/debian/rules).
	cargo build --release --manifest-path "$(_src)/userspace/logi-wheel/Cargo.toml"
}

package_logitech-trueforce-dkms() {
	pkgdesc="DKMS kernel driver for Logitech TrueForce direct-drive wheels (RS50, G PRO): force feedback, TrueForce texture routing, and wheel settings via sysfs"
	license=('GPL-2.0-only')
	depends=('dkms')
	optdepends=('logi-wheel: settings TUI, FFB proxy, simulated TrueForce and shim installer'
	            'oversteer: GUI to configure wheel settings'
	            'usb_modeswitch: switch the G923 Xbox edition (c26d) into PC mode on plug-in')
	provides=("$_dkmsname")
	conflicts=("$_dkmsname")
	install=$pkgbase.install

	local _src _dst
	_src="$(_src)"
	_dst="$pkgdir/usr/src/$_dkmsname-$pkgver"

	# DKMS module source. The .c keeps its historical name; Kbuild builds
	# it as hid-logitech-dd.ko (scoped to the direct-drive wheels).
	# dd-lg4ff.c/.h carry the ported classic force-feedback engine for the
	# G923 (c266/c267); the Kbuild links it into the same module.
	install -Dm644 -t "$_dst" \
		"$_src/mainline/hid-logitech-hidpp.c" \
		"$_src/mainline/dd-lg4ff.c" \
		"$_src/mainline/dd-lg4ff.h" \
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
	# G923 (c266/c267/c26e) driver pre-emption: reclaims the wheel from a
	# competing driver that won the bind race, PID-scoped only.
	install -Dm644 "$_src/udev/72-logitech-g923-rebind.rules" \
		"$pkgdir/usr/lib/udev/rules.d/72-logitech-g923-rebind.rules"
	# G923 Xbox edition (c26d) boot-mode switch: needs usb_modeswitch
	# (optdepends above), a no-op without it.
	install -Dm644 "$_src/udev/73-logitech-g923-xbox-modeswitch.rules" \
		"$pkgdir/usr/lib/udev/rules.d/73-logitech-g923-xbox-modeswitch.rules"

	# softdep ordering hint for the G923 PIDs, plus a narrow blacklist of
	# the standalone new-lg4ff DKMS fork (see the file for why that one
	# blacklist entry is safe).
	install -Dm644 "$_src/packaging/modprobe.d/hid-logitech-dd.conf" \
		"$pkgdir/etc/modprobe.d/hid-logitech-dd.conf"

	# Docs + license.
	install -Dm644 "$_src/README.md" \
		"$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 "$_src/COPYING" \
		"$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_logi-wheel() {
	pkgdesc="Terminal settings app for Logitech TrueForce wheels: settings TUI, DirectInput FFB proxy, simulated-TrueForce daemon and SDK shim installer"
	license=('GPL-2.0-only')
	depends=('logitech-trueforce-dkms')
	optdepends=('python: required by the TrueForce Proton shim installer'
	            'wine: run Logitech SDK DLLs for TrueForce in Proton sims')
	# Renamed from logi-dd (v0.20.0): "dd" meant direct-drive, but the app
	# configures every supported wheel, including the belt-driven G923.
	# These let pacman/paru move an existing logi-dd install onto this
	# package automatically instead of leaving it orphaned.
	provides=('logi-dd')
	replaces=('logi-dd')
	conflicts=('logi-dd')

	local _src
	_src="$(_src)"

	install -Dm755 \
		"$_src/userspace/logi-wheel/target/release/logi-wheel" \
		"$pkgdir/usr/bin/logi-wheel"
	install -Dm755 \
		"$_src/userspace/logi-wheel/target/release/logi-ffb" \
		"$pkgdir/usr/bin/logi-ffb"
	install -Dm755 \
		"$_src/userspace/logi-wheel/target/release/logi-tf-sim" \
		"$pkgdir/usr/bin/logi-tf-sim"

	# TrueForce-in-Proton helper (resolves the SDK DLL dir via --sdk-dir /
	# $LOGITECH_TRUEFORCE_SDK_DIR / ~/.local/share/logitech-trueforce/sdk).
	install -Dm755 "$_src/tools/install-tf-shim.sh" \
		"$pkgdir/usr/bin/logitech-trueforce-install-shim"

	# Transitional symlink: scripts and habits built around the old
	# `logi-dd` binary name keep working.
	ln -s logi-wheel "$pkgdir/usr/bin/logi-dd"
}

package_logi-wheel-gui() {
	pkgdesc="Graphical settings app for Logitech TrueForce wheels"
	license=('GPL-3.0-or-later')
	depends=(
		'logi-wheel'
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
	# Renamed from logi-dd-gui (v0.20.0); see logi-wheel's package() for why.
	provides=('logi-dd-gui')
	replaces=('logi-dd-gui')
	conflicts=('logi-dd-gui')

	local _src
	_src="$(_src)"

	install -Dm755 \
		"$_src/userspace/logi-wheel/target/release/logi-wheel-gui" \
		"$pkgdir/usr/bin/logi-wheel-gui"

	# Desktop integration.
	install -Dm644 "$_src/desktop/logi-wheel-gui.desktop" \
		"$pkgdir/usr/share/applications/logi-wheel-gui.desktop"
	install -Dm644 "$_src/desktop/logi-wheel-gui.svg" \
		"$pkgdir/usr/share/icons/hicolor/scalable/apps/logi-wheel-gui.svg"

	# Transitional symlink: scripts and habits built around the old
	# `logi-dd-gui` binary name keep working.
	ln -s logi-wheel-gui "$pkgdir/usr/bin/logi-dd-gui"
}
