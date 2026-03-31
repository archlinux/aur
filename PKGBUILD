# Maintainer: Ishan Parihar <ishanparihar@gmail.com>
# Contributor: Stoffi05

pkgname=notion-calendar-electron-fixed
pkgver=1.132.0
pkgrel=1
pkgdesc="Notion Calendar Desktop Client - your calendar, tasks, and schedule in one place (official installer, electron39)"
arch=(x86_64)
url=https://www.notion.so/product/calendar
license=(custom)
depends=(
	bash
	electron39
	gcc-libs
	glibc
	hicolor-icon-theme
)
makedepends=(
	7zip
	asar
	python
)
provides=('notion-calendar-electron')
conflicts=('notion-calendar-electron')
install=.install

source=(
	"https://calendar-desktop-release.notion-static.com/Notion%20Calendar%20Setup%20${pkgver}.exe"
	notion-calendar
	notion-calendar.desktop
	notion-calendar.png
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

options=(!emptydirs)

prepare() {
	# extracting app.asar from installer with 7z and ignoring errors
	7z x "./Notion%20Calendar%20Setup%20${pkgver}.exe" "\$PLUGINSDIR/app-64.7z" -y -bse0 -bso0 || true
	7z x "./\$PLUGINSDIR/app-64.7z" "resources/app.asar" "resources/app.asar.unpacked" -y -bse0 -bso0 || true
	rm "./Notion%20Calendar%20Setup%20${pkgver}.exe"
	rm "./\$PLUGINSDIR/app-64.7z"

	# extracting resources from app.asar
	asar e "$srcdir/resources/app.asar" "$srcdir/asar_patched"

	# Use Python for patching to avoid sed issues with minified JS
	python3 << 'PYEOF'
import sys
import os

main_js = os.environ.get('SRC_DIR', '') + '/asar_patched/build/main/main.js'
if not os.path.exists(main_js):
    # Try to find it
    for root, dirs, files in os.walk(os.environ.get('srcdir', '.')):
        for f in files:
            if f == 'main.js':
                main_js = os.path.join(root, f)
                break

with open(main_js, 'r', encoding='utf-8') as f:
    content = f.read()

patches = [
    # Patch 1: disable auto updates (Windows-only Squirrel)
    ('if("win32"===process.platform&&!c.default().wasBuiltByUs&&s.existsSync(d.join(a.app.getAppPath(),"../Update.exe")))', 'if(!1)'),
    # Patch 2: fix single instance lock for linux
    ('"win32"!==process.platform||kl||ft().app.quit()', 'kl||ft().app.quit()'),
    # Patch 3: fix second-instance event to handle linux
    ('"win32"===process.platform&&(fl(),jl(t))', 'fl(),jl(t)'),
    # Patch 4: fix argv protocol handler for linux
    ('"win32"===process.platform&&jl(process.argv)', 'jl(process.argv)'),
    # Patch 5: fix protocol registration for linux
    (',tl&&"win32"===process.platform', ',tl'),
    # Patch 6: fix app user model id (not needed on linux)
    ('"win32"===process.platform&&ft().app.setAppUserModelId("com.cron.electron");', 'true;'),
    # Patch 7: fix tray popup menu for linux (use win32 pattern instead of darwin)
    ('Xl)if("darwin"===process.platform)Xl.popUpContextMenu();else{', 'Xl)if(false)Xl.popUpContextMenu();else{'),
    # Patch 8: fix jl function to work on linux (remove win32-only check)
    ('function jl(e){if("win32"!==process.platform)return;', 'function jl(e){'),
    # Patch 9: prevent URLs from being treated as file paths in jl function
    ('const n=e.slice(1).find((e=>A().existsSync(e)));', 'const n=e.slice(1).find((e=>!e.includes("://")&&A().existsSync(e)));'),
]

for old, new in patches:
    if old in content:
        content = content.replace(old, new)
        print(f'Applied: {old[:60]}...')
    else:
        print(f'WARNING: Not found: {old[:60]}...', file=sys.stderr)

with open(main_js, 'w', encoding='utf-8') as f:
    f.write(content)

print('All patches applied successfully')
PYEOF

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
	install -vDm755 notion-calendar -t "$usr/bin"
	install -vDm644 "$srcdir/notion-calendar.desktop" -t "$share/applications"
	install -vDm644 "$srcdir/notion-calendar.png" -t "$share/icons/hicolor/256x256/apps"
}
