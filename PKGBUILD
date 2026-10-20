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
