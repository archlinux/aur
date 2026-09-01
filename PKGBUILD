# Maintainer: Rongbo <wurongbo2012@hotmail.com>

pkgname=workbuddy
pkgver=5.4.7.37521366_b148bd1d
pkgrel=1
pkgdesc="腾讯云代码助手推出的 AI Agent 办公工具(中国版）"
arch=('x86_64' 'aarch64')
url="https://www.workbuddy.cn/app"
license=('custom')
depends=('electron')
makedepends=('asar'
)
checkdepends=()
optdepends=(
	'nodejs-lts: frontend skills'
	'ripgrep'
	'gnome-shell-extension-appindicator'
)
provides=()
conflicts=()
_registry="https://registry.npmjs.org"
source=(
  "v${pkgver}.zip::https://download.codebuddy.cn/workbuddy/saas/darwin-x64/WorkBuddy-darwin-x64-${pkgver//_/-}.zip"
  WorkBuddy.desktop
  "${_registry}/better-sqlite3/-/better-sqlite3-13.0.3.tgz"
)
sha256sums=('SKIP'
            'cd04f9e6b3460d6a3513902b807936a90999d2c4f56f34447f7e8727a8832138'
            '77e0513dc1a469fb3bceec4c7fb5ad3f403109787eda05be047ec17fd56868cb')
source_x86_64=("node-pty-x86_64.tgz::${_registry}/@lydell/node-pty-linux-x64/-/node-pty-linux-x64-1.2.0-beta.15.tgz")
source_aarch64=("node-pty-aarch64.tgz::${_registry}/@lydell/node-pty-linux-arm64/-/node-pty-linux-arm64-1.2.0-beta.15.tgz")
sha256sums_x86_64=('754dae77f06207acbb65423fd45d4482d20a563200c520196c8222f2a6f5ba3c')
sha256sums_aarch64=('f9da59f77496d1f3065d368b61c3af0b9c6785f0b22c5a70144283fcdf6b3036')
changelog="changelog.md"

options=(!strip !debug)
pkgver() {
    upstream=$(curl 'https://copilot.tencent.com/v2/update?platform=workbuddy-darwin-x64')
    _nfile=$(awk -F '"' '{for(i=1;i<=NF;i++){if($i=="url"){print $(i+2)}}}' <<<$upstream |cut -d'-' -f5,6)
    sed 's/-/_/' <<<${_nfile%.*}
}

noextract=("node-pty-x86_64.tgz" "node-pty-aarh64.tgz")
prepare() {
    cd WorkBuddy.app/Contents/Resources
    tar xzf ${srcdir}/node-pty-${CARCH}.tgz
    asar e app.asar app.asar.unpacked || continue
}

build() {
	cd WorkBuddy.app/Contents/Resources
##	rm -rf app.asar.unpacked/node_modules/@tencent  # no Linux build
	find app.asar.unpacked -type f -exec sed -i "s/process.resourcesPath/\'\/opt\/WorkBuddy\'/g" {} +
	#npm install @tencent-ai/codebuddy-code --omit=dev
	rm -rf app.asar.unpacked/node_modules/{better-sqlite3,@lydell/node-pty-linux*}
	mv ${srcdir}/package app.asar.unpacked/node_modules/better-sqlite3
	if [ $CARCH == "x86_64" ]; then
		mv package app.asar.unpacked/node_modules/@lydell/node-pty-linux-x64
	else
		mv package app.asar.unpacked/node_modules/@lydell/node-pty-linux-arm64
	fi
}

package() {
    install -Dm644 WorkBuddy.desktop ${pkgdir}/usr/share/applications/workbuddy.desktop
    cd WorkBuddy.app/Contents/Resources
    install -Dm644 app.asar.unpacked/resources/icon.png ${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/workbuddy.png
    sed -e "s/display-p3 1.0000 0.5608 0.3294/display-p3 0.0565 0.7837 0.6625/g" -e "s/display-p3 1.0000 0.7176 0.0000/display-p3 0.0021 0.7858 0.5246/g" \
    app.asar.unpacked/renderer/assets/header-learnbuddy*.svg |\
    install -Dm644 /dev/stdin ${pkgdir}/usr/share/icons/hicolor/scalable/apps/workbuddy.svg
    install -d ${pkgdir}/opt/WorkBuddy
    cp -a app.asar.unpacked ${pkgdir}/opt/WorkBuddy/
    install -Dm 755 /dev/stdin "${pkgdir}/usr/bin/workbuddy" <<EOF
#!/usr/bin/bash
exec electron /opt/WorkBuddy/app.asar.unpacked "\$@"
EOF
}
