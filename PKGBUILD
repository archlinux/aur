# Maintainer: mescon <5875228+mescon@users.noreply.github.com>
# Split package: the DKMS driver (module + udev rules), logi-wheel (the
# complete headless toolset) and logi-wheel-gui (the graphical settings app).
pkgbase=logitech-trueforce-dkms
pkgname=('logitech-trueforce-dkms' 'logi-wheel' 'logi-wheel-gui')
_dkmsname=logitech-trueforce
pkgver=0.39.1
pkgrel=1
pkgdesc="DKMS kernel driver for Logitech racing wheels (RS50, G PRO, G923): force feedback, TrueForce texture routing, and wheel settings via sysfs"
arch=('x86_64')
url="https://github.com/mescon/logitech-trueforce-linux-driver"
# The kernel module and logi-ffb/logi-wheel/logi-tf-sim are GPL-2.0-only;
# logi-wheel-gui (the Slint settings GUI) is GPL-3.0-or-later. Each split
# package narrows this to its own license.
license=('GPL-2.0-only' 'GPL-3.0-or-later')
# fontconfig is a BUILD dependency as well as a runtime one: logi-wheel-gui
# pulls yeslogic-fontconfig-sys, whose build script resolves the system
# library through pkg-config and panics without fontconfig.pc. It went
# unnoticed because any desktop already has fontconfig installed; a clean
# chroot build (devtools, aurutils, paru --chroot) does not.
makedepends=('cargo' 'fontconfig')
# !lto: makepkg's default -flto=auto would leave libtrueforce.a (built by
# tf-sim's build.rs and linked statically into logi-tf-sim) as GCC LTO
# bitcode, which rustc's lld link step cannot read (undefined logiTrueForce*
# symbols at link time).
options=('!lto')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# sha256 of the v0.18.0 release tarball. On the next version bump, regenerate:
#   updpkgsums && makepkg --printsrcinfo > .SRCINFO
sha256sums=('0372862a314684f2b1f325a57f57e18871b4682b2308e66d68cfa1ec66e366c8')

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
	# logi-rpm-bridge: the small C bridge that feeds relayed game RPM to
	# the driver's kernel texture merge; logi-launch starts and stops it
	# around a game session.
	cc -O2 -Wall -o "$(_src)/tools/logi-rpm-bridge" \
		"$(_src)/tools/logi-rpm-bridge.c"
}

package_logitech-trueforce-dkms() {
	pkgdesc="DKMS kernel driver for Logitech racing wheels (RS50, G PRO, G923): force feedback, TrueForce texture routing, and wheel settings via sysfs"
	license=('GPL-2.0-only')
	# No dependency on logi-wheel. This package installs udev rule 73, and
	# that rule dispatches /usr/bin/logi-wheel-modeswitch, so the two have
	# to arrive together or the rule silently does nothing and a G923 Xbox
	# edition stays in console mode looking like dead hardware. Depending
	# on logi-wheel fixed that and created a cycle, since logi-wheel
	# depends on this package: pacman can usually untangle one, but it
	# breaks installing either package on its own.
	#
	# The helper ships here instead, beside the rule that calls it. It is
	# driver infrastructure rather than a user tool, so this is where it
	# belonged anyway.
	depends=('dkms' 'usbutils')
	optdepends=('oversteer: GUI to configure wheel settings'
	            'usb_modeswitch: switch an Xbox edition (G923 c26d, RS50 c275) into PC mode on plug-in')
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
		"$_src/mainline/hidpp_dd_texture_merge.h" \
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
	# Xbox editions (G923 c26d, RS50 c275) boot-mode switch: needs usb_modeswitch
	# (optdepends above), a no-op without it.
	install -Dm644 "$_src/udev/73-logitech-xbox-modeswitch.rules" \
		"$pkgdir/usr/lib/udev/rules.d/73-logitech-xbox-modeswitch.rules"
	# The helper that rule dispatches. Same package, so the rule can never
	# be installed without it.
	install -Dm755 "$_src/tools/xbox-modeswitch.sh" \
		"$pkgdir/usr/bin/logi-wheel-modeswitch"

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
	# configures every supported wheel, including the gear-driven G923.
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
		"$pkgdir/usr/bin/logi-shim"

	# Rebinds a wheel that another driver claimed, which the settings apps'
	# diagnostics offer as a fix. Kept as a script rather than a command in
	# the app because a wheel presents several HID interfaces and all of them
	# have to be moved.
	install -Dm755 "$_src/tools/rebind-wheel.sh" \
		"$pkgdir/usr/bin/logi-rebind-wheel"

	# Steam launch-options wrapper: starts an in-prefix Windows helper
	# (logi-tf-relay, or a telemetry bridge) after the game is up. Useless
	# unless it is on PATH, because the whole point is that a user types
	# `logi-launch %command%` and nothing else.
	install -Dm755 "$_src/tools/logi-launch.sh" \
		"$pkgdir/usr/bin/logi-launch"

	# The rotation proxy the installer stages with --range-proxy. Shipped
	# prebuilt because it is a Windows DLL and the people who need it are
	# on Linux without a cross-compiler; without this, --range-proxy is
	# unreachable for anyone who did not clone the repo.
	install -Dm644 "$_src/tools/tf-range-proxy.dll" \
		"$pkgdir/usr/share/logitech-trueforce/tf-range-proxy.dll"
	# The dinput8 escape proxy logi-launch stages into an SDK game's own
	# directory: it answers the SDK's range getters and relays the game's
	# RPM telemetry for the kernel texture merge. Prebuilt, same reason
	# as the range proxy above.
	install -Dm644 "$_src/tools/dinput8-escape.dll" \
		"$pkgdir/usr/share/logitech-trueforce/dinput8-escape.dll"
	# The RPM feed for the kernel texture merge; logi-launch starts and
	# stops it around a game session.
	install -Dm755 "$_src/tools/logi-rpm-bridge" \
		"$pkgdir/usr/bin/logi-rpm-bridge"
	# The truck sims load this from inside the game rather than from a
	# Proton prefix, so it ships beside the proxy rather than in bin.
	install -Dm644 "$_src/userspace/logi-wheel/target/release/liblogi_tf_scs.so" \
		"$pkgdir/usr/share/logitech-trueforce/liblogi_tf_scs.so"
	# A Windows executable: it runs inside the game's Proton prefix.
	# Prebuilt because no distro builder ships a Rust Windows target.
	install -Dm644 "$_src/tools/logi-tf-relay.exe" \
		"$pkgdir/usr/share/logitech-trueforce/logi-tf-relay.exe"
	# The recorded TrueForce init burst logi-launch replays when
	# LOGI_TF_REARM is set. Without it that recovery path silently
	# cannot work on this channel alone.
	install -Dm644 "$_src/tools/tf-init.bin" \
		"$pkgdir/usr/share/logitech-trueforce/tf-init.bin"

	# G923 Xbox mode-switch helper, dispatched by udev rule 73. Must not be
	# run from the udev worker itself; see the rule's own comment.

	# Transitional symlinks: scripts and habits built around the old
	# `logi-dd` and `logitech-trueforce-install-shim` names keep working.
	# Every binary this project installs is now `logi-*`, so that `pgrep
	# logi-` finds all of them.
	ln -s logi-wheel "$pkgdir/usr/bin/logi-dd"
	ln -s logi-shim "$pkgdir/usr/bin/logitech-trueforce-install-shim"
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
