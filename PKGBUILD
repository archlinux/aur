# Maintainer: Rongbo <wurongbo2012@hotmail.com>

pkgname=workbuddy-bin
pkgver=4.10.4.26327962
pkgrel=1
_commit=85c7979b
pkgdesc="Work Smart，Not Hard"
arch=('x86_64' 'aarch64')
url="https://www.codebuddy.ai/agents"
license=('custom')
depends=('electron')
makedepends=('7zip'
	'npm'
	'libicns'
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

prepare() {
    rm -rf WorkBuddy/WorkBuddy.app/Contents/Resources/app
    7z x WorkBuddy-darwin-x64-${pkgver}-${_commit}.dmg
    mkdir -p WorkBuddy/WorkBuddy.app/Contents/Resources/node_modules
}

build() {
	cd WorkBuddy/WorkBuddy.app/Contents/Resources
	npm install @vscode/ripgrep @vscode/sqlite3 @vscode/spdlog --omit=dev
	cp -a node_modules/* app/node_modules/
	icns2png -x WorkBuddy.icns
}

package() {
    install -D WorkBuddy.desktop ${pkgdir}/usr/share/applications/workbuddy.desktop
    cd WorkBuddy/WorkBuddy.app/Contents/Resources
    install -D WorkBuddy_512x512x32.png ${pkgdir}/usr/share/icons/hicolor/512x512/apps/WorkBuddy.png
    install -D WorkBuddy_1024x1024x32.png ${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/WorkBuddy.png
    install -d ${pkgdir}/usr/lib/workbuddy
    install -d ${pkgdir}/usr/share/licenses/workbuddy
    mv app/*txt ${pkgdir}/usr/share/licenses/workbuddy/
    cp -a app/* ${pkgdir}/usr/lib/workbuddy/
    install -Dm 755 /dev/stdin "${pkgdir}/usr/bin/workbuddy" <<EOF
#!/usr/bin/bash
exec electron /usr/lib/workbuddy/out/main.js "\$@"
EOF
}
