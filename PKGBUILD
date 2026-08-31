# Maintainer: Simon Keimer <dc0sk at secure dot mailbox dot org>
# Contributor: Helmut Stult
pkgname=antscope2
pkgver=2.0.3
pkgrel=2
epoch=0
pkgdesc="Control and graphing software for RigExpert antenna and cable analyzers (AA/AA-N/AA-BT series, and third-party NanoVNA devices)"
arch=('x86_64' 'i686')
url="https://github.com/rigexpert/AntScope2"
# AntScope2's own code is upstream's MIT LICENSE.txt. qcustomplot.cpp is
# vendored (not a system library) and carries its own GPL-3.0-or-later
# header, and is compiled directly into the same binary, so the binary as
# distributed is bound by the stronger copyleft license, not just MIT.
license=('MIT' 'GPL-3.0-or-later')
groups=()
depends=('qt6-base' 'qt6-serialport' 'qt6-connectivity' 'libusb')
makedepends=('git' 'desktop-file-utils')
checkdepends=()
optdepends=('bluez: for Bluetooth-connected RigExpert AA-BT analyzers')
provides=()
conflicts=('antscope2-git')
replaces=()
backup=()
options=()
install=
changelog=
# Upstream cuts no tags and no releases for Linux (only Windows/Mac get
# installers); the head commit is pinned as of packaging. 2.0.3 is
# ANTSCOPE2VER in AntScope.pro at this commit.
source=("${pkgname}::git+https://github.com/rigexpert/AntScope2.git#commit=bc7b74db4ea419968d04522d3690f601c4032884"
		"0001-Fix-m_1secTimer-firing-at-10Hz-instead-of-1Hz.patch"
		"0002-Remove-dead-include-declaration-referencing-nonexist.patch"
		"0003-Fix-flickering-popups-caused-by-a-WindowActivate-Win.patch"
		"0004-Fix-missing-semicolon-in-PopUp-s-default-label-style.patch"
		"0005-Convert-graph-marker-hint-popups-to-embedded-child-w.patch"
		"0006-Initialize-Measurements-m_focus-and-Markers-m_focus.patch"
		"0007-Fix-missing-semicolon-in-OneFqWidget-s-default-label.patch"
		"0008-Guard-against-stacking-multiple-SelectDeviceDialog-i.patch"
		"0009-Enforce-TLS-certificate-verification-on-all-network-.patch"
		"0010-Fix-out-of-bounds-stack-read-of-device-supplied-HID-.patch"
		"0011-Reject-BLE-notifications-shorter-than-a-full-packet-.patch"
		"0012-Fix-out-of-bounds-read-of-a-short-firmware-info-resp.patch"
		"0013-Fix-one-byte-out-of-bounds-read-in-HID-firmware-info.patch"
		"linux-fixed-system-data-path.patch"
		"66-rigexpert.rules"
		"antscope2.desktop")
noextract=()
sha256sums=('SKIP'
			'01ecbf308389c25d4ace731491d0cc446d1a11c1157a8ed5c68586c6fb2f9369'
			'0ae0384ab8f15a7c023e96da30205d5110e34ad17871d2ac270100e759285493'
			'ab44a3fae0d3f3326fdc0eb1c455bac75446f4309886528b179f1b82015a341e'
			'9664e37c51a36b4206b5199ce301b502a9bc3e51e2191d2e3950dea9375a6642'
			'1b802321f49dd5bac4661060f1272d0f7565c334efb45f4a6b4342f9182b2b6f'
			'6e6eada9affdd5e37655c34af1d713f9f304dbed993274a6eb1f0e894330570a'
			'e01b2c30c6af0edd5912652aa46580d597031992055970b8b2185ba153a2cfe1'
			'187905adc57b7476bcbc5db91efd9d112463693cfb4f9f31e0101f522891d7b3'
			'6ca1c205d627080bcf58b25f7e4c65ba107faac52e2d5a6302b49b41fc3b8ce0'
			'cd6c85dc54a9eaccc319e77c96bde1fba09040ad7fb6caecdd11e96d45446a0a'
			'365fdc07b19d1d8e04e2bcf61a9df08524b96acd5e798af8888451794f57b155'
			'3a8fe2afdc58a75c6b11605f47a42d7f197e4549565c4072c8e081acd6d367e9'
			'51189e7f8dd1000042ee77ddac7df9402799fb8e52d4cae69523e3bcae316327'
			'e2e99afcc8da7c1d6ddf8c61356838489841242694c03b38fd872d76c3806db0'
			'c51f359050265216e6728a429dfaa84c7afe498c2f6625b5709b56a79627a7c8'
			'131a376137f36f1eb394d5bd5e1d2897bc0148b92e9d7f52d9a1d37bd967b6d4')
validpgpkeys=()

prepare() {
	cd "${srcdir}/${pkgname}"

	# Fixes for a flickering-popups/title-bar bug (a WindowActivate/
	# WindowDeactivate feedback loop against certain Wayland compositors)
	# and its underlying defects (a mistyped timer interval, two missing-
	# semicolon stylesheet bugs, an uninitialized bool, a dialog
	# reentrancy risk, and a dead include that breaks the build on any
	# platform), plus a set of out-of-bounds reads in device/network
	# parsing and disabled TLS certificate verification. Submitted
	# upstream as:
	#   https://github.com/rigexpert/AntScope2/pull/29
	#   https://github.com/rigexpert/AntScope2/pull/30
	# Not yet merged as of packaging; applied here in the meantime. Using
	# git-apply rather than patch(1) since these are git-format-patch
	# output and one of them (0002, touching the CRLF-terminated
	# ble_analyzer.h) needs git's own patch parser to apply cleanly.
	for p in "${srcdir}"/0*.patch; do
		git apply -p1 "$p"
	done

	# Settings::localDataPath()/localDataFolder() resolve every data file -
	# cables.txt, the ITU band-plan file, saved calibrations - relative to
	# QCoreApplication::applicationDirPath()/.., a portable-folder
	# assumption from Windows/Mac packaging that does not hold once the
	# binary lives in /usr/bin. The same two functions already carry a
	# special case for Raspbian that reads/writes a fixed
	# /usr/share/RigExpert/AntScope2 instead - exactly a distribution
	# package's shape, just gated to one OS flavour. This patch takes that
	# branch unconditionally on Linux; see package() below for the matching
	# install layout. This one is Linux-packaging-specific, not part of
	# the upstream PRs above.
	git apply -p1 "${srcdir}/linux-fixed-system-data-path.patch"
}

build() {
	cd "${srcdir}/${pkgname}"
	qmake6 CONFIG+=release \
		QMAKE_CFLAGS_RELEASE="${CFLAGS}" \
		QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}" \
		QMAKE_LFLAGS="${LDFLAGS}" \
		AntScope.pro
	make
}

# AntScope.pro carries no unix INSTALLS block and no test target; upstream's
# own README still lists Linux as "to do". There is nothing to check() -
# the binary is a GUI application whose real behaviour needs actual
# RigExpert hardware and a display.

package() {
	cd "${srcdir}/${pkgname}"

	install -Dm755 build/release/AntScope2 "${pkgdir}/usr/bin/AntScope2"

	# The fixed path prepare()'s patch now sends localDataPath()/
	# localDataFolder() to. cables.txt and itu-regions-defaults.txt are
	# upstream's own shipped defaults. itu-regions.txt itself is a user
	# override that loadBands() already falls back to the "-defaults" file
	# when it is missing, as on a fresh install, so it is deliberately not
	# shipped here. cal_open/cal_short/cal_load.s1p are what the
	# Open/Short/Load calibration dialogs default to; upstream never
	# creates them either, it just expects them to exist.
	#
	# All of this lives under a root-owned directory - unlike a per-user
	# config directory, an ordinary user cannot write to it. Loading the
	# shipped defaults works out of the box; saving a calibration file or a
	# custom band plan does not unless run as root. That is a real gap
	# against upstream's own Windows/Mac builds (writable next to the
	# binary or under the user's profile); fixing it needs upstream to
	# separate "read-only shipped data" from "per-user state" in its own
	# code, which the current single data-path function does not do.
	install -Dm644 cables.txt "${pkgdir}/usr/share/RigExpert/AntScope2/cables.txt"
	install -Dm644 itu-regions-defaults.txt "${pkgdir}/usr/share/RigExpert/AntScope2/itu-regions-defaults.txt"
	install -Dm644 Calibration/cal_load.s1p "${pkgdir}/usr/share/RigExpert/AntScope2/cal_load.s1p"
	install -Dm644 Calibration/cal_open.s1p "${pkgdir}/usr/share/RigExpert/AntScope2/cal_open.s1p"
	install -Dm644 Calibration/cal_short.s1p "${pkgdir}/usr/share/RigExpert/AntScope2/cal_short.s1p"

	# No icon other than the 64x64 AntScope2.png exists anywhere in the
	# upstream tree that isn't Windows (.ico) or Mac (.icns) specific.
	install -Dm644 AntScope2.png "${pkgdir}/usr/share/icons/hicolor/64x64/apps/antscope2.png"

	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"

	install -Dm644 "${srcdir}/66-rigexpert.rules" "${pkgdir}/usr/lib/udev/rules.d/66-rigexpert.rules"
	install -Dm644 "${srcdir}/antscope2.desktop" "${pkgdir}/usr/share/applications/antscope2.desktop"
	desktop-file-validate "${pkgdir}/usr/share/applications/antscope2.desktop"
}
