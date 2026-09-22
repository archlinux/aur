# Maintainer: Asuka Minato <i at asukaminato dot eu dot org>
# Maintainer: Kid <hi at xuann dot wang>
# Maintainer: Mateus Honorato <mateush.honorato@gmail.com>
# Contributor: Jaime Martínez Rincón <jaime@jamezrin.name>

pkgname=notion-app-electron
pkgver=7.35.1
_bettersqlite3ver=13.0.1
_bufferutilver=4.0.9
_pipewirever=1.1.0
pkgrel=2
pkgdesc="Your connected workspace for wiki, docs & projects"
arch=(x86_64)
url=https://www.notion.so/desktop
license=(custom)
depends=(
	bash
	glibc
	hicolor-icon-theme
	electron43
    libstdc++
	libpipewire
)
makedepends=(
	p7zip
	asar
	ast-grep
)
install=.install

source=(
	https://desktop-release.notion-static.com/Notion%20Setup%20${pkgver}.exe
	https://registry.npmjs.org/better-sqlite3/-/better-sqlite3-${_bettersqlite3ver}.tgz
	https://github.com/websockets/bufferutil/releases/download/v${_bufferutilver}/v${_bufferutilver}-linux-x64.tar
	https://registry.npmjs.org/node-pipewire/-/node-pipewire-${_pipewirever}.tgz
	node-pipewire-${_pipewirever}-napi-v6-linux-x64.tar.gz::https://github.com/kakxem/node-pipewire/releases/download/${_pipewirever}/napi-v6-linux-x64.tar.gz
	notion-app
	notion.desktop
	notion.png
)
sha256sums=('e85d3c5eb5eb8d30287d54509e53af963c237a87aff372fcf30742de54b5b64a'
            '92935ff8280f933aff78f87e04eb718a21af003aec4e5bd0076f287aa1709da4'
            '2139aae79c5a4fd4d07467bd9b7872ea109483aa43b3dfd6c8d3725ccba009be'
            'ed7425c2f287df8e192656f89b5c6645f67837aaaba64692e493dc8e8e0d55fe'
            'ec6ea34a3c1ce1cf71bd1c88fe70eb11f26330d33a44e7051f2b37a53e008200'
            '5684fbb75a9b15dab6cf4ded317ccaf899d2b03ce7d7cf0090ebcf9298089a1c'
            '19a5f973f1e9291081aa05512e07c61447e8c30e1a43dd22d0cc1090837d1e19'
            'da801d659d8916320e0d76c8c62154e97a1d44f71762f2a18d1c8c185624d5be')

options=(!emptydirs)
noextract=(
	better-sqlite3-${_bettersqlite3ver}.tgz
	node-pipewire-${_pipewirever}.tgz
	node-pipewire-${_pipewirever}-napi-v6-linux-x64.tar.gz
)

prepare() {
	# extracting app.asar from installer with 7z and ignoring errors
	7z x "./Notion%20Setup%20${pkgver}.exe" "\$PLUGINSDIR/app-64.7z" -y -bse0 -bso0 || true
	7z x "./\$PLUGINSDIR/app-64.7z" "resources/app.asar" "resources/app.asar.unpacked" -y -bse0 -bso0 || true
	rm "./Notion%20Setup%20${pkgver}.exe"
	rm "./\$PLUGINSDIR/app-64.7z"
	# extracting resources from app.asar
	# Discard previous extraction and unpacked output so removed files cannot survive a rebuild.
	rm -rf "$srcdir/asar_patched" "$srcdir/app.asar.unpacked"
	asar e "$srcdir/resources/app.asar" "$srcdir/asar_patched"
	# Match Notion's JS version using the upstream Linux Node-API prebuild.
	bsdtar -xOf "$srcdir/better-sqlite3-${_bettersqlite3ver}.tgz" package/prebuilds/linux-x64.node \
		> "$srcdir/asar_patched/node_modules/better-sqlite3/build/Release/better_sqlite3.node"
	# replacing bufferutil release in the patched resources
	install -vDm644 "$srcdir/linux-x64/bufferutil.node" "$srcdir/asar_patched/node_modules/bufferutil/build/Release/bufferutil.node"
	# Remove Windows/macOS-only resources from the Windows installer.
	rm -f \
		"$srcdir/asar_patched/.webpack/main/native_modules/build/Release/winregistry.node" \
		"$srcdir/asar_patched/.webpack/main/native_modules/adjust_get_current_system_volume_vista_plus.exe" \
		"$srcdir/asar_patched/node_modules/@notionhq/desktop-native/build/Release/win_utils.node" \
		"$srcdir/asar_patched/node_modules/better-sqlite3/build/Release/test_extension.node"
	rm -rf \
		"$srcdir/asar_patched/node_modules/cf-prefs" \
		"$srcdir/asar_patched/node_modules/node-mac-window"
	# The Windows progress-bar DLL cannot load on Linux. Its Linux prebuild uses
	# GTK4, which conflicts with system Electron's linked GTK3; retain the existing fallback.
	rm -f "$srcdir/asar_patched/node_modules/@jasonscheirer/native-progress-bar/build/Release/progress_bar.node"
	# Notion's desktop-native Linux implementation uses node-pipewire for audio detection.
	local pipewire_dir="$srcdir/asar_patched/node_modules/node-pipewire"
	install -d "$pipewire_dir/dist/binding/napi-v6"
	bsdtar -xf "$srcdir/node-pipewire-${_pipewirever}.tgz" -C "$pipewire_dir" \
		--strip-components 1 package/package.json package/LICENSE package/dist/index.js
	bsdtar -xOf "$srcdir/node-pipewire-${_pipewirever}-napi-v6-linux-x64.tar.gz" \
		napi-v6/index.node > "$pipewire_dir/dist/binding/napi-v6/index.node"
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
	asar p "$srcdir/asar_patched" "$srcdir/app.asar" --unpack '*.node'
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
