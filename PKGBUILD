# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=redisinsight-git
_pkgname="Redis Insight"
pkgver=2.48.0.r128.g0fb86744d
_electronversion=25
_nodeversion=18
pkgrel=1
pkgdesc="Desktop manager that provides an intuitive and efficient GUI for Redis, allowing you to interact with your databases, monitor, and manage your data."
arch=('any')
url="https://redis.io/insight/"
_ghurl="https://github.com/RedisInsight/RedisInsight"
license=('SSPL-1.0')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    'gtk3'
    'alsa-lib'
    'nss'
    'libsecret'
)
makedepends=(
    'npm'
    'yarn'
    'git'
    'nvm'
    'gendesk'
    'base-devel'
    'gcc'
    'python'
)
source=("${pkgname//-/.}::git+${_ghurl}.git")
sha256sums=('SKIP')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    git describe --long --tags --exclude='*[a-z][a-z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    _ensure_local_nvm
    gendesk -q -f -n --categories="Development" --name="${_pkgname}" --exec="${pkgname%-git} %U"
    cd "${srcdir}/${pkgname//-/.}"
    export npm_config_build_from_source=true
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    export ELECTRONVERSION="${_electronversion}"
    export npm_config_disturl=https://registry.npmmirror.com/-/binary/node/
    HOME="${srcdir}/.electron-gyp"
    mkdir -p "${srcdir}/.electron-gyp"
    touch "${srcdir}/.electron-gyp/.yarnrc"
    if [ `curl -s ipinfo.io/country | grep CN | wc -l ` -ge 1 ];then
        export npm_config_registry=https://registry.npmmirror.com
        export npm_config_electron_mirror=https://registry.npmmirror.com/-/binary/electron/
        export npm_config_electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/
    else
        echo "Your network is OK."
    fi
    sed "s|--linux -p never|--l --dir -p never|g" -i package.json
    yarn --cwd "${pkgname%-git}"/api/ install --ignore-optional --cache-folder "${srcdir}/.yarn_cache"
    yarn --cwd "${pkgname%-git}"/ install --ignore-optional --cache-folder "${srcdir}/.yarn_cache"
    yarn install --cache-folder "${srcdir}/.yarn_cache"
    yarn run build:statics
    yarn run package:linux
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-git}",usr/bin}
    cp -r "${srcdir}/${pkgname//-/.}/release/linux-"*/* "${pkgdir}/opt/${pkgname%-git}"
    ln -sf "/opt/${pkgname%-git}/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname//-/.}/resources/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}