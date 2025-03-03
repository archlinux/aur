# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=monokle
_pkgname=Monokle
pkgver=2.4.8
_electronversion=28
_nodeversion=20
pkgrel=3
pkgdesc="Lets you create, analyze, and deploy YAML manifests with a visual UI, and provides policy validation and cluster management.(Use system-wide electron)"
arch=('x86_64')
url="https://monokle.io/"
_ghurl="https://github.com/kubeshop/monokle"
license=('MIT')
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
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
    "${pkgname}.sh"
)
sha256sums=('e7ed708de2e65eaca4d4f82fef8ea0d1d4ec1043f68e936dc0e56761fddeebcb'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --pkgname="${pkgname}" --pkgdesc="${pkgdesc}" --categories="Development" --name="${_pkgname}" --exec="${pkgname} %U"
    cd "${srcdir}/${pkgname}-${pkgver}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    HOME="${srcdir}/.electron-gyp"
    {
        echo -e '\n'	
        #echo 'build_from_source=true'
        echo "cache=${srcdir}/.npm_cache"
    } >> .npmrc
    if [[ "$(curl -s cip.cc)" == *"中国"* ]]; then
        {
            echo 'registry=https://registry.npmmirror.com'
            echo 'electron_mirror=https://registry.npmmirror.com/-/binary/electron/'
            echo 'electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/'
        } >> .npmrc
        find ./ -type f -name "package-lock.json" -exec sed -i "s/registry.npmjs.org/registry.npmmirror.com/g" {} +
    fi
    find src -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname}\'/g" {} +
    #NODE_ENV=development    npm install --ignore-scripts --prefer-offline --no-audit
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    local electronDist="/usr/lib/electron${_electronversion}"
    contents="$(jq --arg SENTRY_DSN $SENTRY_DSN '.SENTRY_DSN = $SENTRY_DSN' electron/env.json)" && echo "${contents}" > electron/env.json
    contents="$(jq --arg MONOKLE_INSTALLS_URL $MONOKLE_INSTALLS_URL '.MONOKLE_INSTALLS_URL = $MONOKLE_INSTALLS_URL' electron/env.json)" && echo "${contents}" > electron/env.json
    contents="$(jq --arg SEGMENT_API_KEY $SEGMENT_API_KEY '.SEGMENT_API_KEY = $SEGMENT_API_KEY' electron/env.json)" && echo "${contents}" > electron/env.json
    NODE_ENV=production npm run electron:build:ci
    contents="$(jq '.build.artifactName = "${productName}-${os}-${arch}.${ext}"' package.json)" && echo "${contents}" > package.json
    contents="$(jq '.build.appImage.artifactName = "${productName}-${os}-${arch}.${ext}"' package.json)" && echo "${contents}" > package.json
    NODE_ENV=production     npm exec -c "electron-builder --linux dir -c.electronDist=${electronDist}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644  "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/"{app,resources} "${pkgdir}/usr/lib/${pkgname}"
    ln -sf "/opt/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(32 48 64 256)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/build/large-icon-${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}x${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}