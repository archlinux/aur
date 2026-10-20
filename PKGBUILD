# Maintainer: Ishan Parihar <ishanparihar@gmail.com>
# Contributor: Stoffi05

pkgname=notion-calendar-electron-fixed
pkgver=1.141.0
pkgrel=1
pkgdesc="Notion Calendar Desktop Client - your calendar, tasks, and schedule in one place (official installer, electron41)"
arch=(x86_64)
url=https://www.notion.so/product/calendar
license=(custom)
depends=(
	bash
	electron41
	gcc-libs
	glibc
	hicolor-icon-theme
)
makedepends=(
	7zip
	asar
	curl
	electron41
	python
)
provides=('notion-calendar-electron')
conflicts=('notion-calendar-electron')
install=.install

_manifest() {
	curl -fsSL "https://calendar-desktop-release.notion-static.com/latest.yml"
}
_upstream_ver() {
	_manifest | sed -n 's/^version: *//p' | head -1
}
_upstream_sha512_hex() {
	_manifest | awk '/sha512:/{print $2; exit}' | base64 -d | od -An -tx1 | tr -d ' \n'
}

pkgver() {
	_upstream_ver
}

source=(
	"notion-calendar-electron-fixed::git+https://aur.archlinux.org/notion-calendar-electron-fixed.git"
	patch_notion_calendar.py
)
sha256sums=('SKIP'
            'SKIP')

options=(!emptydirs)

prepare() {
	local ver exe url want got
	ver=$(_upstream_ver)
	exe="Notion Calendar Setup ${ver}.exe"
	url="https://calendar-desktop-release.notion-static.com/Notion%20Calendar%20Setup%20${ver}.exe"
	want=$(_upstream_sha512_hex)
	if [[ ! -f "$srcdir/$exe" ]]; then
		curl -fL -o "$srcdir/$exe" "$url"
	fi
	got=$(sha512sum "$srcdir/$exe" | cut -d' ' -f1)
	if [[ "$got" != "$want" ]]; then
		echo "CHECKSUM MISMATCH for $exe" >&2
		echo "  got:  $got" >&2
		echo "  want: $want" >&2
		exit 1
	fi
	echo "==> checksum verified: $exe (upstream $ver)"

	# makepkg only auto-extracts files listed in source(); since we fetch the
	# installer ourselves in prepare(), extract it here.
	if [[ ! -d "$srcdir/resources" ]]; then
		bsdtar -xf "$srcdir/$exe" -C "$srcdir"
	fi

	# bsdtar (makepkg) already extracted the NSIS installer; app.asar is in resources/
	# Clean up Windows-specific files left by the extraction
	rm -f "$srcdir/Notion Calendar Setup ${ver}.exe" "$srcdir/Notion Calendar.exe"
	rm -rf "$srcdir/\$PLUGINSDIR" 2>/dev/null || true
	rm -rf "$srcdir/asar_patched" 2>/dev/null || true

	# extracting resources from app.asar
	asar e "$srcdir/resources/app.asar" "$srcdir/asar_patched"

	# Use Python for patching to avoid sed issues with minified JS
	python3 "$srcdir/patch_notion_calendar.py"

	# repacking asar with all the patches
	asar p "$srcdir/asar_patched" "$srcdir/app.asar" --unpack *.node

	# --- runtime smoke test ---------------------------------------------
	# The 1.141.0 bundle initialises Sentry with an undefined DSN and
	# enableNative defaults to true, so @sentry/electron throws during
	# startup and the app never opens a window. The patch above fixes it,
	# but a future upstream re-minify could reintroduce it (or break
	# something else) without the build noticing. So: actually RUN the
	# patched app and require that it starts and stays up.
	#
	# --headless runs the real electron runtime with no display server,
	# which is what a build sandbox has. The signal we need is exact: the
	# Sentry throw happens during startup, before any window would exist,
	# so "the process reached its event loop and stayed alive" means the
	# startup path is clean.
	echo "==> smoke test: launching the patched app (headless)"
	local _log="$srcdir/smoke.log"
	local _pid
	env -u DISPLAY -u WAYLAND_DISPLAY \
		electron41 --headless "$srcdir/app.asar" >"$_log" 2>&1 &
	_pid=$!

	# Give it time to start. If the Sentry bug is present the process dies
	# within a second or two.
	local _i
	for _i in $(seq 1 20); do
		sleep 0.5
		kill -0 "$_pid" 2>/dev/null || break
	done

	local _alive=0
	kill -0 "$_pid" 2>/dev/null && _alive=1

	if [[ $_alive -eq 0 ]]; then
		echo "SMOKE TEST FAILED: the app exited during startup" >&2
		cat "$_log" >&2
		exit 1
	fi

	# It is running. Now check it did not log the fatal startup errors.
	# NOTE: makepkg runs PKGBUILD functions under `set -e`, and `wait` returns
	# 143 when the process was killed by SIGTERM. Without the `|| true` here
	# the whole prepare() aborts silently with no diagnostic.
	kill -TERM "$_pid" 2>/dev/null || true
	wait "$_pid" 2>/dev/null || true

	if grep -qE "Attempted to enable Electron native crash reporter|SentryError" "$_log"; then
		echo "SMOKE TEST FAILED: a fatal startup error was logged" >&2
		grep -E "SentryError|Attempted to enable" "$_log" >&2
		exit 1
	fi

	# A syntax error in the patched bundle means the app cannot even load.
	if grep -qE "SyntaxError|Uncaught Exception" "$_log"; then
		echo "SMOKE TEST FAILED: the app threw during load" >&2
		grep -E "SyntaxError|Uncaught Exception" "$_log" >&2
		exit 1
	fi

	# The patched main.js must actually be in the asar we are about to ship.
	# (A patch script that silently did nothing must not pass the build.)
	if ! asar e "$srcdir/app.asar" "$srcdir/.verify" 2>/dev/null; then
		echo "SMOKE TEST FAILED: could not read back the repacked asar" >&2
		exit 1
	fi
	if ! grep -q "enableNative:!1" "$srcdir/.verify/build/main/main.js"; then
		echo "SMOKE TEST FAILED: the sentry guard is missing from the packed asar" >&2
		exit 1
	fi
	rm -rf "$srcdir/.verify"

	echo "==> smoke test passed"
}

package() {
	local usr="$pkgdir/usr"
	local share="$usr/share"
	local lib="$usr/lib/notion-calendar"

	install -d "$lib"
	cp "$srcdir/app.asar" "$lib"
	cp -r "$srcdir/app.asar.unpacked" "$lib" 2>/dev/null || true
	install -vDm755 "$srcdir/notion-calendar-electron-fixed/notion-calendar" -t "$usr/bin"
	install -vDm644 "$srcdir/notion-calendar-electron-fixed/notion-calendar.desktop" -t "$share/applications"
	install -vDm644 "$srcdir/notion-calendar-electron-fixed/notion-calendar.png" -t "$share/icons/hicolor/256x256/apps"
}
