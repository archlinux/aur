# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mustang-git
_pkgname=Mustang
pkgver=0.6.6.r1.g729e9e9
_electronversion=32
_nodever=20
pkgrel=1
pkgdesc="New full-featured desktop email, chat and video conference client"
arch=('any')
url="https://mustang.im/"
_ghurl="https://github.com/mustang-im/mustang"
license=('LicenseRef-EUPL-1.2')
conflicts=("${pkgname%-git}")
prodives=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname//-/.}::git+${_ghurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
pkgver() {
    cd "${srcdir}/${pkgname%-git}.git"
    set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodever}"
    nvm use "${_nodever}"
}
build() {
    sed -e "
        s/@electronversion@/${_electronversion}/
        s/@appname@/${pkgname%-git}/
        s/@runname@/app.asar/
        s/@cfgdirname@/${pkgname%-git}/
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/
    " -i "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --pkgname="${pkgname%-git}" --pkgdesc="${pkgdesc}" --categories="Network" --name="${_pkgname}" --exec="${pkgname%-git} %U"
    cd "${srcdir}/${pkgname//-/.}"
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
    cd "${srcdir}/${pkgname//-/.}/app/build"
    sh "${pkgname%-git}-brand.sh"
    cd "${srcdir}/${pkgname//-/.}/app"
    cp "${srcdir}/${pkgname//-/.}/.npmrc" "${srcdir}/${pkgname//-/.}/app"
    NODE_ENV=development    npm install --legacy-peer-deps
    cd "${srcdir}/${pkgname//-/.}/lib"
    cp "${srcdir}/${pkgname//-/.}/.npmrc" "${srcdir}/${pkgname//-/.}/lib"
    NODE_ENV=development    npm install
    cd "${srcdir}/${pkgname//-/.}/backend"
    cp "${srcdir}/${pkgname//-/.}/.npmrc" "${srcdir}/${pkgname//-/.}/backend"
    NODE_ENV=development    npm install
    cd "${srcdir}/${pkgname//-/.}/e2"
    cp "${srcdir}/${pkgname//-/.}/.npmrc" "${srcdir}/${pkgname//-/.}/e2"
    sed "/- AppImage/d;/- snap/d;/- rpm/d;s/- deb/- dir/" -i electron-builder.yml
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/" package.json
    cp build/icon.png resources/
    NODE_ENV=development    npm install --legacy-peer-deps
    NODE_ENV=development    npm install -D semver
    NODE_ENV=production     npm run build:release:linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/e2/dist/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -r "${srcdir}/${pkgname//-/.}/e2/dist/linux-"*/resources/app.asar.unpacked "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/e2/build/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}