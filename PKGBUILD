# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=monokle
_pkgname=Monokle
pkgver=2.4.8
_electronversion=28
_nodeversion=18.17.0
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
    'curl'
    'python>=3'
    'python-setuptools'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${_ghurl}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('e7ed708de2e65eaca4d4f82fef8ea0d1d4ec1043f68e936dc0e56761fddeebcb')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    _ensure_local_nvm
    gendesk -q -f -n --categories="Development" --name="${_pkgname}" --exec="${pkgname} %U"
    cd "${srcdir}/${pkgname}-${pkgver}"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    #export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    #export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    #export ELECTRONVERSION="${_electronversion}"
    HOME="${srcdir}/.electron-gyp"
    if [ `curl -s ipinfo.io/country | grep CN | wc -l ` -ge 1 ];then
        export npm_config_registry=https://registry.npmmirror.com
        export npm_config_disturl=https://registry.npmmirror.com/-/binary/node/
        export npm_config_electron_mirror=https://registry.npmmirror.com/-/binary/electron/
        export npm_config_electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/
    else
        echo "Your network is OK."
    fi
    npm install --ignore-scripts --prefer-offline --no-audit --package-lock=false
    contents="$(jq --arg SENTRY_DSN $SENTRY_DSN '.SENTRY_DSN = $SENTRY_DSN' electron/env.json)" && echo "${contents}" > electron/env.json
    contents="$(jq --arg MONOKLE_INSTALLS_URL $MONOKLE_INSTALLS_URL '.MONOKLE_INSTALLS_URL = $MONOKLE_INSTALLS_URL' electron/env.json)" && echo "${contents}" > electron/env.json
    contents="$(jq --arg SEGMENT_API_KEY $SEGMENT_API_KEY '.SEGMENT_API_KEY = $SEGMENT_API_KEY' electron/env.json)" && echo "${contents}" > electron/env.json
    npm run electron:build:ci
    contents="$(jq '.build.artifactName = "${productName}-${os}-${arch}.${ext}"' package.json)" && echo "${contents}" > package.json
    contents="$(jq '.build.appImage.artifactName = "${productName}-${os}-${arch}.${ext}"' package.json)" && echo "${contents}" > package.json
    npx electron-builder -l --dir
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname}",usr/bin}
    cp -r "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 32 48 64 256;do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/build/large-icon-${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}x${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}