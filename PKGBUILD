# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pinac-workspace-git
_pkgname='PINAC Workspace'
pkgver=r30.7836d9a
_nodeversion=22
pkgrel=1
pkgdesc='A local, minimal & secure desktop AI assistant for everyone.'
arch=('any')
url="https://github.com/pinacai/PINAC_Workspace"
license=('MIT')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    'webkit2gtk-4.1'
    'gtk3'
)
makedepends=(
    'gendesk'
    'npm'
    'nvm'
    'curl'
    'git'
    'python'
    'jq'
    'uv'
    'rustup'
)
source=("${pkgname%-git}.git::git+${url}.git")
sha256sums=('SKIP')
pkgver() {
    cd "${srcdir}/${pkgname%-git}.git"
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
    cd "${srcdir}/${pkgname%-git}.git"
    gendesk -f -n -q \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"
	local HOME="${srcdir}/.electron-gyp"
    export CARGO_HOME="${srcdir}/.cargo"
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
    rustup default stable
    _ensure_local_nvm
    cd desktop
    sed -i "s/\"active\"\: true\,/\"active\"\: false\,/g" src-tauri/tauri.conf.json
    NODE_ENV=development    npm install
    cp src-tauri/icons/128x128@2x.png src-tauri/icons/256x256.png
}
build() {
    cd "${srcdir}/${pkgname%-git}.git/backend"
    cp .env.example .env
    python -m venv venv
    source venv/bin/activate
    uv sync
    uv pip install -e .
    cd "${srcdir}/${pkgname%-git}.git/desktop"
    NODE_ENV=production     npm run tauri build
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.git/desktop/src-tauri/target/release/${pkgname%-git}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(32x32 128x128 256x256)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname%-git}.git/desktop/src-tauri/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-git}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}