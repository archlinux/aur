# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=easyeditor-git
_pkgname=Easyeditor
pkgver=1.7.6.r0.g4471001
_nodeversion=24
pkgrel=1
pkgdesc="An easy markdown editor that allows you to professionally write MarkDown (MD), Mermaid, PlantUML, KaTeX and preview it in real-time. Import only MD, Templates and Docx. You can save, load .md files and export to PDF, PNG, TXT & SSTP."
arch=('any')
url="https://www.easyeditor.co.uk/"
_ghurl="https://github.com/gcclinux/Easyeditor"
license=('AGPL-3.0-only')
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
makedepends=(
    'npm'
    'nvm'
    'git'
    'curl'
    'gendesk'
    'rustup'
)
source=("${pkgname//-/.}::git+${_ghurl}.git")
sha256sums=('SKIP')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    set -o pipefail
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
prepare() {
    cd "${srcdir}/${pkgname//-/.}"
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"
    export CARGO_HOME="${srcdir}/.cargo"
	local HOME="${srcdir}/.electron-gyp"
	export NPM_CONFIG_CACHE="${srcdir}/.npm_cache"
	export NPM_CONFIG_MAXSOCKETS=32
	if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
		{
			export NPM_CONFIG_REGISTRY="https://registry.npmmirror.com"
			export NODEJS_ORG_MIRROR="https://npmmirror.com/mirrors/node"
            export RUSTUP_DIST_SERVER="https://rsproxy.cn"
	        export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"
		}
		find ./ -type f -name "package-lock.json" -exec sed -i "s/registry.npmjs.org/registry.npmmirror.com/g" {} +
	fi
    _ensure_local_nvm
    sed -i "s/\"active\"\: true\,/\"active\"\: false\,/g" src-tauri/tauri.conf.json
    rustup default stable
    NODE_ENV=development    npm install --leagcy-peer-deps
}
build() {
    cd "${srcdir}/${pkgname//-/.}"
    _ensure_local_nvm
    NODE_ENV=production     npm run tauri:build
}
package() {
    install -Dm755 "${srcdir}/${pkgname//-/.}/src-tauri/target/release/${pkgname%-git}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname//-/.}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(32x32 128x128)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname//-/.}/src-tauri/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
}
