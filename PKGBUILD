# Maintainer: Rongbo <wurongbo2012@hotmail.com>

pkgname=workbuddy
pkgver=5.5.3.37748631_104760a2
pkgrel=1
pkgdesc="腾讯云代码助手推出的 AI Agent 办公工具"
arch=('x86_64' 'aarch64')
url="https://www.workbuddy.cn/app"
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
  WorkBuddy.desktop
  "${_registry}/better-sqlite3/-/better-sqlite3-13.0.3.tgz"
)
sha256sums=('SKIP'
            '77e0513dc1a469fb3bceec4c7fb5ad3f403109787eda05be047ec17fd56868cb')
source_x86_64=("v${pkgver}-x86_64.deb::https://download.codebuddy.cn/workbuddy/saas/linux-x64-deb/WorkBuddy-linux-x64-deb-${pkgver//_/-}.deb")
source_aarch64=("v${pkgver}-aarch64.deb::https://download.codebuddy.cn/workbuddy/saas/linux-arm64-deb/WorkBuddy-linux-arm64-deb-${pkgver//_/-}.deb")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

options=(!strip !debug)
pkgver() {
    upstream=$(curl 'https://copilot.tencent.com/v2/update?platform=workbuddy-linux-x64-deb')
    _nfile=$(awk -F '"' '{for(i=1;i<=NF;i++){if($i=="url"){print $(i+2)}}}' <<<$upstream |cut -d'-' -f7,8)
    sed 's/-/_/' <<<${_nfile%.*}
}

prepare() {
    tar xf data.tar.xz
}

build() {
    cd opt/WorkBuddy/resources
    rm -rf app.asar.unpacked/node_modules/better-sqlite3
    mv ${srcdir}/package app.asar.unpacked/node_modules/better-sqlite3
    asar e app.asar app.asar.unpacked || true
    find app.asar.unpacked -type f -exec sed -i "s/process.resourcesPath/\'\/opt\/WorkBuddy\'/g" {} +
}

package() {
    install -d ${pkgdir}/opt/WorkBuddy
    cp -a usr ${pkgdir}/
    install -m644 WorkBuddy.desktop ${pkgdir}/usr/share/applications/workbuddy.desktop
    cd opt/WorkBuddy/resources
    cp -a app.asar.unpacked ${pkgdir}/opt/WorkBuddy/
    install -Dm 755 /dev/stdin "${pkgdir}/usr/bin/workbuddy" <<EOF
#!/usr/bin/bash
exec electron /opt/WorkBuddy/app.asar.unpacked "\$@"
EOF
}
