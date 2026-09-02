# Maintainer: Simon Keimer <dc0sk at secure dot mailbox dot org>
# Contributor: Helmut Stult
pkgname=antscope2-git
pkgver=2.0.3.r0.g0000000
pkgrel=1
epoch=0
pkgdesc="Control and graphing software for RigExpert antenna and cable analyzers (AA/AA-N/AA-BT series, and third-party NanoVNA devices) - git version, tracking a patched branch pending upstream review"
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
provides=('antscope2')
conflicts=('antscope2')
replaces=()
backup=()
options=()
install=
changelog=
# Tracks the tip of a maintainer's fork branch that merges two sets of
# fixes (flickering popups/title bar, and out-of-bounds reads plus a
# completed firmware-update fix) submitted upstream as:
#   https://github.com/rigexpert/AntScope2/pull/29
#   https://github.com/rigexpert/AntScope2/pull/30
# Not yet merged as of packaging. Once they are, this should point back at
# upstream rigexpert/AntScope2 directly. The versioned antscope2 package
# pins a specific commit and applies these as patch files instead; this
# -git package exists for people who want the fixes without waiting for a
# repackage every time the fork branch moves.
source=("${pkgname}::git+https://github.com/dc0sk/AntScope2.git#branch=linux-packaging"
		"linux-fixed-system-data-path.patch"
		"66-rigexpert.rules"
		"antscope2.desktop")
noextract=()
sha256sums=('SKIP'
			'e2e99afcc8da7c1d6ddf8c61356838489841242694c03b38fd872d76c3806db0'
			'c51f359050265216e6728a429dfaa84c7afe498c2f6625b5709b56a79627a7c8'
			'131a376137f36f1eb394d5bd5e1d2897bc0148b92e9d7f52d9a1d37bd967b6d4')
validpgpkeys=()

pkgver() {
	cd "${srcdir}/${pkgname}"
	local ver
	ver=$(grep -m1 ANTSCOPE2VER AntScope.pro | grep -oE '[0-9]+\.[0-9]+\.[0-9]+')
	[ -n "${ver}" ] || ver=0.0.0
	printf "%s.r%s.g%s" "${ver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${pkgname}"

	# Settings::localDataPath()/localDataFolder() resolve every data file -
	# cables.txt, the ITU band-plan file, saved calibrations - relative to
	# QCoreApplication::applicationDirPath()/.., a portable-folder
	# assumption from Windows/Mac packaging that does not hold once the
	# binary lives in /usr/bin. The same two functions already carry a
	# special case for Raspbian that reads/writes a fixed
	# /usr/share/RigExpert/AntScope2 instead - exactly a distribution
	# package's shape, just gated to one OS flavour. This patch takes that
	# branch unconditionally on Linux; see package() below for the matching
	# install layout. This is Linux-packaging-specific, not part of the
	# fork branch itself (it would make no sense for the Windows/Mac builds
	# this same source also feeds).
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
