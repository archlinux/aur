# Maintainer: Gianluca Mazza <info@gianlucamazza.it>
#
# castbridge — native backend for the Cast browser extension. Builds inside an
# openscreen fork checkout (pinned commit + Wayland/H.264 mirror patch), then
# installs the daemon/relay, the cast_sender mirror helper, and the
# native-messaging manifest system-wide.
#
# NOTE: build() provisions the openscreen fork (depot_tools + `gclient sync`,
# ~GB) and compiles it — this downloads at build time and takes a while. The
# extension itself ships separately via AMO.
pkgname=castbridge
pkgver=0.3.0
pkgrel=1
pkgdesc="Native Chromecast backend for the Cast browser extension (openscreen Cast Streaming)"
arch=('x86_64')
url="https://github.com/gianlucamazza/cast"
license=('BSD-3-Clause')
depends=('ffmpeg' 'libva' 'libvpx' 'opus' 'curl' 'gcc-libs')
optdepends=('hyprland: window mirroring (screen mirroring works on any Wayland compositor)')
makedepends=('git' 'python')
options=('!lto' '!strip')
# pkgver tracks the latest GIT TAG (not the AMO-only extension version).
source=("$pkgname::git+https://github.com/gianlucamazza/cast.git#tag=v$pkgver")
sha256sums=('SKIP')

_forkdir() { echo "$srcdir/openscreen"; }

build() {
	cd "$srcdir/$pkgname"
	export OPENSCREEN_DIR="$(_forkdir)"
	export OUT_DIR="out/Default"

	# Provision the openscreen fork (clone + pin + gclient sync + patch + gn gen).
	bash native/integration/setup-openscreen.sh

	# Build castbridge and the cast_sender mirror helper.
	bash native/integration/build.sh
	NINJA="$(command -v ninja || echo "$srcdir/depot_tools/ninja")"
	(cd "$OPENSCREEN_DIR" && "$NINJA" -C "$OUT_DIR" cast/standalone_sender:cast_sender)
}

package() {
	cd "$srcdir/$pkgname"
	local out="$(_forkdir)/out/Default"

	# Daemon/relay binary + the mirror sender (sibling, found via /proc/self/exe).
	install -Dm755 "$out/castbridge"  "$pkgdir/usr/bin/castbridge"
	install -Dm755 "$out/cast_sender" "$pkgdir/usr/bin/cast_sender"

	# Wrapper the browser launches (the manifest path must exec --nm-host),
	# generated from the shared template in install/.
	sed "s|@BIN@|/usr/bin/castbridge|" install/castbridge-nm-host.sh.in \
		>"$srcdir/castbridge-nm-host"
	install -Dm755 "$srcdir/castbridge-nm-host" "$pkgdir/usr/bin/castbridge-nm-host"

	# Native-messaging manifest, system-wide, for Firefox and LibreWolf.
	local host="it.gianlucamazza.castbridge"
	local template manifest
	template="$(cat "install/$host.json.in")"
	manifest="${template//@PATH@//usr/bin/castbridge-nm-host}"
	local d
	for d in usr/lib/mozilla/native-messaging-hosts \
	         usr/lib/librewolf/native-messaging-hosts; do
		install -dm755 "$pkgdir/$d"
		printf '%s\n' "$manifest" >"$pkgdir/$d/$host.json"
	done

	# Optional warm-daemon systemd --user unit.
	sed "s|@BIN@|/usr/bin/castbridge|" install/castbridge.service \
		>"$srcdir/castbridge.service"
	install -Dm644 "$srcdir/castbridge.service" \
		"$pkgdir/usr/lib/systemd/user/castbridge.service"
}
