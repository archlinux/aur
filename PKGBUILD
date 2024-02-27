# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=monokle
_pkgname=Monokle
pkgver=2.4.5
_electronversion=27
_nodeversion=18
pkgrel=1
pkgdesc="Lets you create, analyze, and deploy YAML manifests with a visual UI, and provides policy validation and cluster management."
arch=('x86_64')
url="https://monokle.io/"
_ghurl="https://github.com/kubeshop/monokle"
license=('MIT')
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}")
depends=(
    'alsa-lib'
    'gtk3'
    'nss'
    'nodejs'
)
makedepends=(
    'npm'
    'nvm'
    'jq'
    'gendesk'
    'git'
    'python>=3'
    'python-setuptools'
)
source=(
    "${pkgname}::git+${_ghurl}#tag=v${pkgver}"
)
sha256sums=('SKIP')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    _ensure_local_nvm
    gendesk -q -f -n --categories="Development" --name="${_pkgname}" --exec="${pkgname} --no-sandbox %U"
    cd "${srcdir}/${pkgname}"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    export ELECTRONVERSION="${_electronversion}"
    export npm_config_disturl=https://electronjs.org/headers
    HOME="${srcdir}/.electron-gyp"
    sed -e "291,297d" -e "268,278d" -e "259,265d" -e 's|"AppImage",|"AppImage"|g' -i package.json
    npm install
    npm run electron:build:ci
    contents="$(jq '.build.artifactName = "${productName}-${os}-${arch}.${ext}"' package.json)" && echo "${contents}" > package.json
    contents="$(jq '.build.appImage.artifactName = "${productName}-${os}-${arch}.${ext}"' package.json)" && echo "${contents}" > package.json
    npm exec -c "electron-builder --publish \"never\""
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname}",usr/bin}
    cp -r "${srcdir}/${pkgname}/dist/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 32 48 64 256;do
        install -Dm644 "${srcdir}/${pkgname}/build/large-icon-${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}x${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}