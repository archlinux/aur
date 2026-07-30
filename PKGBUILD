# Maintainer: Rongbo <wurongbo2012@hotmail.com>

pkgname=workbuddy
pkgver=5.3.5.34189228
pkgrel=1
_commit=8044e898
pkgdesc="Work Smart，Not Hard"
arch=('x86_64' 'aarch64')
url="https://www.codebuddy.ai/agents"
license=('custom')
depends=('electron')
makedepends=('7zip'
	'npm'
	'libicns'
	'asar'
)
checkdepends=()
optdepends=(
	'gnome-shell-extension-appindicator'
)
provides=()
conflicts=()
source=("https://download.codebuddy.cn/workbuddy/saas/darwin-x64/WorkBuddy-darwin-x64-${pkgver}-${_commit}.dmg"
WorkBuddy.desktop
)
sha256sums=('SKIP'
'SKIP'
)

options=(!strip)
prepare() {
    rm -rf WorkBuddy/WorkBuddy.app/Contents/Resources/
    7z x -snld WorkBuddy-darwin-x64-${pkgver}-${_commit}.dmg
    mkdir -p WorkBuddy.app/Contents/Resources/node_modules
}

build() {
	cd WorkBuddy.app/Contents/Resources
	icns2png -x icon.icns
	asar e app.asar app.asar.unpacked || continue
	find app.asar.unpacked -type f -exec sed -i "s/process.resourcesPath/\'\/opt\/workbuddy\'/g" {} +
	#npm install @tencent-ai/codebuddy-code --omit=dev
	npm install @lydell/node-pty better-sqlite3@13 --omit=dev
	cp -a node_modules/* app.asar.unpacked/node_modules
	#cd app.asar.unpacked/
	#rm -rf cli && mv node_modules/@tencent-ai/codebuddy-code cli
#	#npm install @vscode/ripgrep @vscode/sqlite3 @vscode/spdlog --omit=dev
#	#cp -a node_modules/* app/node_modules/
}

package() {
    install -D WorkBuddy.desktop ${pkgdir}/usr/share/applications/workbuddy.desktop
    cd WorkBuddy.app/Contents/Resources
    install -D icon_512x512x32.png ${pkgdir}/usr/share/icons/hicolor/512x512/apps/WorkBuddy.png
    install -D icon_1024x1024x32.png ${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/WorkBuddy.png
    install -d ${pkgdir}/opt/workbuddy
    install -d ${pkgdir}/usr/share/licenses/workbuddy
    cp -a app.asar.unpacked ${pkgdir}/opt/workbuddy/
    install -Dm 755 /dev/stdin "${pkgdir}/usr/bin/workbuddy" <<EOF
#!/usr/bin/bash
exec electron /opt/workbuddy/app.asar.unpacked "\$@"
EOF
}
