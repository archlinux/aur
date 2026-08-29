# Maintainer: Asuka Minato <i at asukaminato dot eu dot org>
# Maintainer: Kid <hi at xuann dot wang>
# Maintainer: Mateus Honorato <mateush.honorato@gmail.com>
# Contributor: Jaime Martínez Rincón <jaime@jamezrin.name>

pkgname=notion-app-electron
pkgver=7.31.3
_bettersqlite3ver=12.9.0
_bufferutilver=4.0.9
_elecronver=145 # whenever update the bettersqlite, update this one by one to try the proper version.
pkgrel=1
pkgdesc="Your connected workspace for wiki, docs & projects"
arch=(x86_64)
url=https://www.notion.so/desktop
license=(custom)
depends=(
	bash
	gcc-libs
	glibc
	hicolor-icon-theme
	electron41
)
makedepends=(
	p7zip
	asar
	ast-grep
)
install=.install

source=(
	https://desktop-release.notion-static.com/Notion%20Setup%20${pkgver}.exe
	https://github.com/WiseLibs/better-sqlite3/releases/download/v${_bettersqlite3ver}/better-sqlite3-v${_bettersqlite3ver}-electron-v${_elecronver}-linux-x64.tar.gz
	https://github.com/websockets/bufferutil/releases/download/v${_bufferutilver}/v${_bufferutilver}-linux-x64.tar
	notion-app
	notion.desktop
	notion.png
)
sha256sums=('589ddabe7fdf162ee1ef3f59005929e31b96159b553fd5557af3c2dd208f2b09'
            '59d9e3beed32ff516fa79fc09bfb819a7abd84d077a77abfc68d85a6d79ac757'
            '2139aae79c5a4fd4d07467bd9b7872ea109483aa43b3dfd6c8d3725ccba009be'
            '916f75f612d353651d3d04a414c29d157521a06765683742a66279acac904744'
            '19a5f973f1e9291081aa05512e07c61447e8c30e1a43dd22d0cc1090837d1e19'
            'da801d659d8916320e0d76c8c62154e97a1d44f71762f2a18d1c8c185624d5be')

options=(!emptydirs)

prepare() {
	# extracting app.asar from installer with 7z and ignoring errors
	7z x "./Notion%20Setup%20${pkgver}.exe" "\$PLUGINSDIR/app-64.7z" -y -bse0 -bso0 || true
	7z x "./\$PLUGINSDIR/app-64.7z" "resources/app.asar" "resources/app.asar.unpacked" -y -bse0 -bso0 || true
	rm "./Notion%20Setup%20${pkgver}.exe"
	rm "./\$PLUGINSDIR/app-64.7z"
	# extracting resources from app.asar
	asar e "$srcdir/resources/app.asar" "$srcdir/asar_patched"
	# replacing better_sqlite3 release in the patched resources
	install -vDm644 "$srcdir/build/Release/better_sqlite3.node" -t "$srcdir/asar_patched/node_modules/better-sqlite3/build/Release/"
	# replacing bufferutil release in the patched resources
	install -vDm644 "$srcdir/linux-x64/bufferutil.node" "$srcdir/asar_patched/node_modules/bufferutil/build/Release/bufferutil.node"
	# removing some unnecessary files (keeping them in this version to see if it improves stability)
	# rm "$srcdir/asar_patched/node_modules/node-mac-window" -r
	# rm "$srcdir/asar_patched/node_modules/better-sqlite3/build/Release/test_extension.node"
	# adding tray icon to the unpacked resources
	install -vDm644 "$srcdir/notion.png" "$srcdir/asar_patched/.webpack/main/trayIcon.png"
	local index_js="$srcdir/asar_patched/.webpack/main/index.js"
	local sg_flags=(--lang javascript -U)
	sg_patch() {
		ast-grep run "${sg_flags[@]}" -p "$1" -r "$2" "$index_js" >/dev/null 2>&1
	}
	sg_patch_select() {
		ast-grep run "${sg_flags[@]}" --selector "$1" -p "$2" -r "$3" "$index_js" >/dev/null 2>&1
	}
	# Linux desktop patches. Match on behavior anchors instead of exact minified variable names.
	sg_patch \
		'this.tray.on("click",()=>{this.onClick()})' \
		'this.tray.setContextMenu(this.trayMenu),this.tray.on("click",()=>{this.onClick()})'
	sg_patch_select method_definition \
		'class X { getIcon(){ $$$BODY } }' \
		'getIcon(){return require("path").resolve(__dirname,"trayIcon.png");}'
	sg_patch \
		'$S.setUserAgent(`${$S.getUserAgent()} WantsServiceWorker`)' \
		'$S.setUserAgent(`${$S.getUserAgent().replace("Linux", "Windows")} WantsServiceWorker`)'
	sg_patch \
		'function $F(){const $$$P;if("darwin"===process.platform){$$$A}if("win32"===process.platform){$$$B}return!1}' \
		'function $F(){return!0}'
	sg_patch \
		'if("darwin"===process.platform)$MAC;else if("win32"===process.platform){const $UNINSTALL=$ARGS=>$ARGS.find($ARG=>"--uninstall"===$ARG);$$$B}' \
		'if("darwin"===process.platform)$MAC;else if("linux"===process.platform){const $UNINSTALL=$ARGS=>$ARGS.find($ARG=>"--uninstall"===$ARG);$$$B}'
	# System Electron includes app.asar in argv; do not treat it as a Markdown file.
	sg_patch \
		'function $F($ARG){const $EXT=$PATH.default.extname($ARG).toLowerCase();return!$ARG.startsWith("-")&&!$ARG.startsWith(`${$CONFIG.default.protocol}:`)&&$EXT.length>0&&".exe"!==$EXT}' \
		'function $F($ARG){const $EXT=$PATH.default.extname($ARG).toLowerCase();return!$ARG.startsWith("-")&&!$ARG.startsWith(`${$CONFIG.default.protocol}:`)&&$EXT.length>0&&".exe"!==$EXT&&".asar"!==$EXT}'
	sg_patch \
		'($$$PRE,function(){$$$INIT}(),0)' \
		'($$$PRE,function(){$$$INIT}())'
	sg_patch_select ternary_expression \
		'"win32"===process.platform?function($E,$T){$$$A}($E,$T):$ALT' \
		'"linux"===process.platform?function($E,$T){$$$A}($E,$T):$ALT'
	# this can disable app menu when the options won't work. disbled in the current version because it's working now, but it's here for future reference
	# sed -i 's|Menu.setApplicationMenu(p(e))|Menu.setApplicationMenu(null)|g' "$srcdir/asar_patched/.webpack/main/index.js"
	# repacking asar with all the patches
	asar p "$srcdir/asar_patched" "$srcdir/app.asar" --unpack *.node
}

package() {
	local usr="$pkgdir/usr"
	local share="$usr/share"
	local lib="$usr/lib/notion-app"

	install -d "$lib"
	cp "$srcdir/app.asar" "$lib"
	cp "$srcdir/app.asar.unpacked" "$lib" -r
	install -vDm644 "$srcdir/asar_patched/package.json" "$lib/package.json"
	install -vDm755 notion-app -t "$usr/bin"
	install -vDm644 "$srcdir/notion.desktop" -t "$share/applications"
	install -vDm644 "$srcdir/notion.png" -t "$share/icons/hicolor/256x256/apps"
}
