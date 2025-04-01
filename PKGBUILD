# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mustang
_pkgname=Mustang
pkgver=0.8.14
_electronversion=32
_nodever=20
pkgrel=1
pkgdesc="New full-featured desktop email, chat and video conference client.(Use system-wide electron)"
arch=('any')
url="https://mustang.im/"
_ghurl="https://github.com/mustang-im/mustang"
license=('EUPL-1.2')
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'npm'
    'nvm'
    'curl'
    'gendesk'
    'git'
)
source=(
    "${pkgname}-${pkgver}::git+${_ghurl}#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('47e69aa3915b3096d0b34662ab7b1e7db6dcffdea711ffef43ff22385ec3bad0'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodever}"
    nvm use "${_nodever}"
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
    gendesk -q -f -n --pkgname="${pkgname}" --pkgdesc="${pkgdesc}" --categories="Network" --name="${_pkgname}" --exec="${pkgname} %U"
    cd "${srcdir}/${pkgname}-${pkgver}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    HOME="${srcdir}/.electron-gyp"
    echo -e '\n'
    #echo 'build_from_source=true'
    echo "cache=${srcdir}/.npm_cache"
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            echo 'registry=https://registry.npmmirror.com'
            echo 'electron_mirror=https://registry.npmmirror.com/-/binary/electron/'
            echo 'electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/'
        } >> .npmrc
        echo '[url "https://github.moeyy.xyz/https://github.com/"]' >> "${srcdir}/${pkgname}-${pkgver}/app/.gitconfig"
        echo '    insteadof = https://github.com/' >> "${srcdir}/${pkgname}-${pkgver}/app/.gitconfig"
        echo app lib backend e2 | xargs -n 1 cp .npmrc
    fi
    cd "${srcdir}/${pkgname}-${pkgver}/app/build"
    sh "${pkgname}-brand.sh"
    cd "${srcdir}/${pkgname}-${pkgver}/app"
    NODE_ENV=development    npm install --legacy-peer-deps
    cd "${srcdir}/${pkgname}-${pkgver}/lib"
    NODE_ENV=development    npm install
    cd "${srcdir}/${pkgname}-${pkgver}/backend"
    NODE_ENV=development    npm install
    cd "${srcdir}/${pkgname}-${pkgver}/e2"
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    cp build/icon.png resources/
    NODE_ENV=development    npm install --legacy-peer-deps
    NODE_ENV=development    npm install -D semver
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}/e2"
    local electronDist="/usr/lib/electron${_electronversion}"
    NODE_ENV=production     npm run build
    NODE_ENV=production     npm exec -c "electron-builder --linux dir -c.electronDist=${electronDist} --config electron-builder.yml"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/e2/dist/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    #cp -Pr --no-preserve=ownership "${srcdir}/${pkgname}-${pkgver}/e2/dist/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/e2/build/icon.png" -t "${pkgdir}/usr/lib/${pkgname}/app.asar.unpacked/resources"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/e2/build/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}