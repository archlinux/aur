# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=before-dawn
pkgver=0.28.0
_electronversion=28
_nodeversion=18
pkgrel=1
pkgdesc="A desktop screensaver app using web technologies"
arch=('any')
url="https://github.com/muffinista/before-dawn"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
    'hicolor-icon-theme'
)
makedepends=(
    'npm'
    'gendesk'
    'nvm'
    'git'
    'ruby'
)
source=(
    "${pkgname}.git::git+${url}.git#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            'a0cc6826161c9d7f95d984bc8a6af91611cd42fc11d8af339a4362f2911848c6')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --categories "Utility" --name "Before Dawn" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}.git"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    npm ci
    sed '141,155d' -i package.json
    sed '124,139d' -i package.json
    sed "s|deb|AppImage|g" -i package.json
    npm run pack
    cd "${srcdir}/${pkgname}.git/dist/.icon-set"
    cp icon_16x16.png icon_16.png
    cp icon_48x48.png icon_48.png
    cp icon_128x128.png icon_128.png
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}/"{output,data/savers}
    cp -r "${srcdir}/${pkgname}.git/output/system-savers" "${pkgdir}/usr/lib/${pkgname}/output"
    cp -r "${srcdir}/${pkgname}.git/output/system-savers" "${pkgdir}/usr/lib/${pkgname}/data/savers"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16 32 48 64 128 256 512 1024;do
        install -Dm644 "${srcdir}/${pkgname}.git/dist/.icon-set/icon_${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644  "${srcdir}/${pkgname}.git/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}