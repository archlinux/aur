# Maintainer: Rongbo <wurongbo2012@hotmail.com>

pkgname=workbuddy
pkgver=5.3.12.35805101_a981f41f
pkgrel=1
pkgdesc="Work Smart，Not Hard"
arch=('x86_64' 'aarch64')
url="https://www.codebuddy.ai/agents"
license=('custom')
depends=('electron')
makedepends=('asar'
)
checkdepends=()
optdepends=(
	'nodejs-lts: frontend skills'
	'gnome-shell-extension-appindicator'
)
provides=()
conflicts=()
_registry="https://registry.npmjs.org"
source=(
  "v${pkgver}.zip::https://download.codebuddy.cn/workbuddy/saas/darwin-x64/WorkBuddy-darwin-x64-${pkgver//_/-}.zip"
  WorkBuddy.desktop
  icon.svg
  "${_registry}/better-sqlite3/-/better-sqlite3-13.0.3.tgz"
)
sha256sums=('SKIP'
            '6566e616904b2e168886c0523fbea7432a03e14d2e79fcb7b80ae88912e396a9'
            'f7cd6f79585b139f7686e79cdfbc6e64a39adf34370467874569e4e827dd1b00'
            '77e0513dc1a469fb3bceec4c7fb5ad3f403109787eda05be047ec17fd56868cb')
source_x86_64=("node-pty-x86_64.gz::${_registry}/@lydell/node-pty-linux-x64/-/node-pty-linux-x64-1.2.0-beta.14.tgz")
source_aarhc64=("node-pty-aarh64.gz::${_registry}/@lydell/node-pty-linux-arm64/-/node-pty-linux-arm64-1.2.0-beta.14.tgz")
sha256sums_x86_64=('53bee2cd02265b118392f7d99a4c72337f4a5003c0d0f9ee01646c19af59fa1f')
sha256sums_aarch64=('SKIP')
changelog="changelog.md"

options=(!strip !debug)
pkgver() {
    upstream=$(curl 'https://copilot.tencent.com/v2/update?platform=workbuddy-darwin-x64')
    _nfile=$(awk -F '"' '{for(i=1;i<=NF;i++){if($i=="url"){print $(i+2)}}}' <<<$upstream |cut -d'-' -f5,6)
    sed 's/-/_/' <<<${_nfile%.*}
}

noextract=("node-pty-x86_64.gz" "node-pty-aarh64.gz")
prepare() {
    tar xzf node-pty-${CARCH}.gz -C WorkBuddy.app/Contents/Resources/
}

build() {
	cd WorkBuddy.app/Contents/Resources
##	rm -rf app.asar.unpacked/node_modules/@tencent  # no Linux build
	asar e app.asar app.asar.unpacked || continue
	find app.asar.unpacked -type f -exec sed -i "s/process.resourcesPath/\'\/opt\/workbuddy\'/g" {} +
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
    install -Dm644 icon.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/workbuddy.svg
    cd WorkBuddy.app/Contents/Resources
    install -Dm644 app.asar.unpacked/resources/icon.png ${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/workbuddy.png
    install -d ${pkgdir}/opt/workbuddy
    #install -D app.asar ${pkgdir}/opt/workbuddy/app.asar
    cp -a app.asar.unpacked ${pkgdir}/opt/workbuddy/
    install -Dm 755 /dev/stdin "${pkgdir}/usr/bin/workbuddy" <<EOF
#!/usr/bin/bash
exec electron /opt/workbuddy/app.asar.unpacked "\$@"
EOF
}
