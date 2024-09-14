# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mustang
_pkgname=Mustang
pkgver=0.6.7
_electronversion=32
_nodever=20
pkgrel=1
pkgdesc="New full-featured desktop email, chat and video conference client"
arch=('any')
url="https://mustang.im/"
_ghurl="https://github.com/mustang-im/mustang"
license=('LicenseRef-EUPL-1.2')
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname}.git::git+${_ghurl}.git#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('fcda96fe998aa1370ac79b19ea1d23ecab4d413d602a738aeaf5f92052084c72'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodever}"
    nvm use "${_nodever}"
}
build() {
    sed -e "
        s/@electronversion@/${_electronversion}/
        s/@appname@/${pkgname}/
        s/@runname@/app.asar/
        s/@cfgdirname@/${pkgname}/
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/
    " -i "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --pkgname="${pkgname}" --pkgdesc="${pkgdesc}" --categories="Network" --name="${_pkgname}" --exec="${pkgname} %U"
    cd "${srcdir}/${pkgname}.git"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    HOME="${srcdir}/.electron-gyp"
    {
        #echo 'build_from_source=true'
        echo "cache=${srcdir}/.npm_cache"
        if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
            echo 'registry=https://registry.npmmirror.com'
            echo 'disturl=https://registry.npmmirror.com/-/binary/node/'
            echo 'electron_mirror=https://registry.npmmirror.com/-/binary/electron/'
            echo 'electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/'
        fi
    } >> .npmrc
    cd "${srcdir}/${pkgname}.git/app/build"
    sh "${pkgname}-brand.sh"
    cd "${srcdir}/${pkgname}.git/app"
    cp "${srcdir}/${pkgname}.git/.npmrc" "${srcdir}/${pkgname}.git/app"
    NODE_ENV=development    npm install --legacy-peer-deps
    cd "${srcdir}/${pkgname}.git/lib"
    cp "${srcdir}/${pkgname}.git/.npmrc" "${srcdir}/${pkgname}.git/lib"
    NODE_ENV=development    npm install
    cd "${srcdir}/${pkgname}.git/backend"
    cp "${srcdir}/${pkgname}.git/.npmrc" "${srcdir}/${pkgname}.git/backend"
    NODE_ENV=development    npm install
    cd "${srcdir}/${pkgname}.git/e2"
    cp "${srcdir}/${pkgname}.git/.npmrc" "${srcdir}/${pkgname}.git/e2"
    sed "/- AppImage/d;/- snap/d;/- rpm/d;s/- deb/- dir/" -i electron-builder.yml
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/" package.json
    cp build/icon.png resources/
    NODE_ENV=development    npm install --legacy-peer-deps
    NODE_ENV=development    npm install -D semver
    NODE_ENV=production     npm run build:release:linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/e2/dist/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}.git/e2/dist/linux-"*/resources/app.asar.unpacked "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/e2/build/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}