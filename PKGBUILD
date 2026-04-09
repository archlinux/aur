# Maintainer: Rongbo <wurongbo2012@hotmail.com>

pkgname=workbuddy-bin
pkgver=4.9.1.25024097
pkgrel=1
_commit=2ff879d4
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
    7z x WorkBuddy-darwin-x64-${pkgver}-${_commit}.dmg
    mkdir -p node_modules
}

build() {
	npm install @vscode/sqlite3 @vscode/ripgrep @vscode/spdlog --no-save
	cp -a node_modules/* WorkBuddy/WorkBuddy.app/Contents/Resources/app/node_modules/
	icns2png -x WorkBuddy/WorkBuddy.app/Contents/Resources/WorkBuddy.icns
}

package() {
    install -D WorkBuddy_512x512x32.png ${pkgdir}/usr/share/icons/hicolor/512x512/apps/WorkBuddy.png
    install -D WorkBuddy_1024x1024x32.png ${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/WorkBuddy.png
    install -D WorkBuddy.desktop ${pkgdir}/usr/share/applications/workbuddy.desktop
    install -d ${pkgdir}/usr/lib/workbuddy
    install -d ${pkgdir}/usr/share/licenses/workbuddy
    mv WorkBuddy/WorkBuddy.app/Contents/Resources/app/*txt ${pkgdir}/usr/share/licenses/workbuddy/
    cp -a WorkBuddy/WorkBuddy.app/Contents/Resources/app/* ${pkgdir}/usr/lib/workbuddy/
    install -Dm 755 /dev/stdin "${pkgdir}/usr/bin/workbuddy" <<EOF
#!/usr/bin/bash
exec electron /usr/lib/workbuddy/out/main.js "\$@"
EOF
}
