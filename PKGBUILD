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

	# disabling auto updates (only works on win32/macOS in original)
	sed -i 's#win32"===process.platform&&!c.default().wasBuiltByUs&&s.existsSync(d.join(a.app.getAppPath(),"../Update.exe"))#!1#g' "$srcdir/asar_patched/build/main/main.js"
	# fix single instance lock for linux (only enforced on win32 in original)
	sed -i 's#win32"!==process.platform||kl||ft().app.quit()#kl||ft().app.quit()#g' "$srcdir/asar_patched/build/main/main.js"
	# fix second-instance event to handle linux
	sed -i 's#win32"===process.platform&&(fl(),jl(t))#fl(),jl(t)#g' "$srcdir/asar_patched/build/main/main.js"
	# fix argv protocol handler for linux
	sed -i 's#win32"===process.platform&&jl(process.argv)#jl(process.argv)#g' "$srcdir/asar_patched/build/main/main.js"
	# fix protocol registration for linux
	sed -i 's#tl&&"win32"===process.platform#tl#g' "$srcdir/asar_patched/build/main/main.js"
	# fix app user model id (not needed on linux)
	sed -i 's#win32"===process.platform&&ft().app.setAppUserModelId("com.cron.electron");#true#g' "$srcdir/asar_patched/build/main/main.js"
	# fix tray popup menu for linux (use win32 pattern instead of darwin)
	sed -i 's#Xl)if("darwin"===process.platform)Xl.popUpContextMenu();else{#Xl)if(false)Xl.popUpContextMenu();else{#g' "$srcdir/asar_patched/build/main/main.js"
	# open notion.so/notion.com page links in Notion app via notion:// protocol
	sed -i 's#St.shell.openExternal(t)#St.shell.openExternal(t.replace(/^https:\\/\\/(?:www\\.)?notion\\.(so|com)/,"notion://www.notion.$1"))#g' "$srcdir/asar_patched/build/main/main.js"

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
