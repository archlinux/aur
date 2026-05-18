# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: TrialnError <autumn-wind@web.de>
# Contributor: Qingxu <me@linioi.com>
pkgname=switchhosts
_pkgname=SwitchHosts
pkgver=5.0.0
_nodeversion=22
pkgrel=1
pkgdesc="An app for managing hosts file,and switch hosts quickly !"
arch=('any')
url="https://switchhosts.app/"
_ghurl="https://github.com/oldj/SwitchHosts"
license=('Apache-2.0')
conflicts=("${pkgname}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
makedepends=(
    'gendesk'
    'nvm'
    'npm'
    'curl'
    'git'
)
source=("${pkgname}-${pkgver}::git+${_ghurl}#tag=v${pkgver}")
sha256sums=('fae5f86960a5164eeab24fb061e1419476a5ff864bdb82dda57b39c5f6279ec2')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    gendesk -q -f -n \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility"  \
        --name="${_pkgname}" \
        --exec="${pkgname} %U"
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
    _ensure_local_nvm
    sed -i "s/\"active\"\: true\,/\"active\"\: false\,/g" src-tauri/tauri.conf.json
    rustup default stable
    NODE_ENV=development    npm install
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    _ensure_local_nvm
    NODE_ENV=production     npm run tauri:build
}
package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/src-tauri/target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(32x32 64x64 128x128)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src-tauri/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
}