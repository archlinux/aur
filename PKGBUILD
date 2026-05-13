# Maintainer: Ishan Parihar <ishanparihar@gmail.com>
# Contributor: Stoffi05

pkgname=notion-calendar-electron-fixed
pkgver=1.133.0
pkgrel=2
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
sha256sums=('4256d294aec58932b1723760d19d97528a20bf89922db88e66e3931962d63c36'
            'SKIP'
            'SKIP'
            'SKIP')

options=(!emptydirs)

prepare() {
	# bsdtar (makepkg) already extracted the NSIS installer; app.asar is in resources/
	# Clean up Windows-specific files left by the extraction
	rm -f "$srcdir/Notion Calendar Setup ${pkgver}.exe" "$srcdir/Notion Calendar.exe"
	rm -rf "$srcdir/\$PLUGINSDIR" 2>/dev/null || true
	rm -rf "$srcdir/asar_patched" 2>/dev/null || true

	# extracting resources from app.asar
	asar e "$srcdir/resources/app.asar" "$srcdir/asar_patched"

	# Use Python for patching to avoid sed issues with minified JS
	python3 << 'PYEOF'
import sys
import os

main_js = os.path.join(os.getcwd(), 'asar_patched/build/main/main.js')
if not os.path.exists(main_js):
    # Fallback: walk from srcdir env or cwd
    search_root = os.environ.get('srcdir') or os.getcwd()
    for root, dirs, files in os.walk(search_root):
        for f in files:
            if f == 'main.js':
                main_js = os.path.join(root, f)
                break

with open(main_js, 'r', encoding='utf-8') as f:
    content = f.read()

patches = [
    # Patch 1: disable auto updates (Windows-only Squirrel)
    ('if("win32"===process.platform&&!d.default().wasBuiltByUs&&s.existsSync(c.join(a.app.getAppPath(),"../Update.exe")))', 'if(!1)'),
    # Patch 2: fix single instance lock for linux
    ('"win32"!==process.platform||qf||u().app.quit()', 'qf||u().app.quit()'),
    # Patch 3: fix second-instance event to handle linux
    ('"win32"===process.platform&&(tS(),kS(t))', 'tS(),kS(t)'),
    # Patch 4: fix argv protocol handler for linux
    ('"win32"===process.platform&&kS(process.argv)', 'kS(process.argv)'),
    # Patch 5: fix protocol registration for linux
    (',Mf&&"win32"===process.platform', ',Mf'),
    # Patch 6: fix app user model id (not needed on linux)
    ('"win32"===process.platform&&u().app.setAppUserModelId("com.cron.electron");', 'true;'),
    # Patch 7: fix tray popup menu for linux (use win32 pattern instead of darwin)
    ('NS)if("darwin"===process.platform)NS.popUpContextMenu();else{', 'NS)if(false)NS.popUpContextMenu();else{'),
    # Patch 8: fix kS function to work on linux (remove win32-only check)
    ('function kS(e){if("win32"!==process.platform)return;', 'function kS(e){'),
    # Patch 9: prevent URLs from being treated as file paths in kS function
    ('const n=e.slice(1).find((e=>D().existsSync(e)));', 'const n=e.slice(1).find((e=>!e.includes("://")&&D().existsSync(e)));'),
    # Patch 10: disable crash reporter on linux (provide fake DSN to skip throw)
    ('if(!(e=this._options.dsn))throw new ae("Attempted to enable Electron native crash reporter but no DSN was supplied");', 'e=this._options.dsn||"https://fake@sentry.io/0";'),
    # Patch 11: disable autoUpdater on linux (a.autoUpdater is undefined)
    ('_subscribeToElectronEvents(){a.autoUpdater.on("before-quit-for-update",((...e)=>{this._log("info","before-quit-for-update",...e),this.emit("before-quit-for-update",...e)})),i.autoUpdater.on("checking-for-update",((...e)=>{this._log("info","checking-for-update",...e),this.emit("checking-for-update",...e)})),i.autoUpdater.on("download-progress",((...e)=>{this._log("info","download-progress",...e),this.emit("download-progress",...e)})),i.autoUpdater.on("update-available",((...e)=>{this._log("info","update-available",...e),this.emit("update-available",...e)})),i.autoUpdater.on("update-not-available",((...e)=>{this._log("info","update-not-available",...e),this.emit("update-not-available",...e)}))}}', '_subscribeToElectronEvents(){if("linux"===process.platform)return;a.autoUpdater.on("before-quit-for-update",((...e)=>{this._log("info","before-quit-for-update",...e),this.emit("before-quit-for-update",...e)})),i.autoUpdater.on("checking-for-update",((...e)=>{this._log("info","checking-for-update",...e),this.emit("checking-for-update",...e)})),i.autoUpdater.on("download-progress",((...e)=>{this._log("info","download-progress",...e),this.emit("download-progress",...e)})),i.autoUpdater.on("update-available",((...e)=>{this._log("info","update-available",...e),this.emit("update-available",...e)})),i.autoUpdater.on("update-not-available",((...e)=>{this._log("info","update-not-available",...e),this.emit("update-not-available",...e)}))}}'),
    # Patch 12: disable second autoUpdater subscription on linux (Nf.autoUpdater is undefined)
    ('pT=async()=>{Nf.autoUpdater.on("before-quit-for-update",(()=>{bS=!0,SS(),lT="before-quit-for-update",uT(lT)})),Nf.autoUpdater.on("update-available",(()=>{lT="update-available",uT(lT)})),"latest"!==Wf&&sT(Wf),mT(),setInterval(mT,9e5)}', 'pT=async()=>{if("linux"===process.platform)return;Nf.autoUpdater.on("before-quit-for-update",(()=>{bS=!0,SS(),lT="before-quit-for-update",uT(lT)})),Nf.autoUpdater.on("update-available",(()=>{lT="update-available",uT(lT)})),"latest"!==Wf&&sT(Wf),mT(),setInterval(mT,9e5)}'),
]

applied = 0
for old, new in patches:
    if old in content:
        content = content.replace(old, new, 1)
        print(f'Applied: {old[:60]}...')
        applied += 1
    else:
        print(f'WARNING: Not found: {old[:60]}...', file=sys.stderr)

if applied < len(patches):
    print(f'ERROR: Only {applied}/{len(patches)} patches applied!', file=sys.stderr)
    sys.exit(1)

with open(main_js, 'w', encoding='utf-8') as f:
    f.write(content)

print(f'All {applied} patches applied successfully')
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
