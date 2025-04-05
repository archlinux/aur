# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Mikel Pintado <mikelaitornube2010@gmail.com>
_appname=nuclear
pkgname="${_appname}-player"
_pkgname="Nuclear Player"
pkgver=0.6.46
_electronversion=33
_nodeversion=22
pkgrel=1
pkgdesc="A free, multiplatform music player app that streams from multiple sources.(Use system-wide electron)"
arch=('any')
url="http://nuclear.gumblert.tech/"
_ghurl="https://github.com/nukeop/nuclear"
license=('AGPL-3.0-only')
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'npm'
    'nvm'
    'curl'
    'rust'
    'git'
)
source=(
    "${pkgname}-${pkgver}::git+${_ghurl}#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('12a857080c978a3e72fd73242d2c5258a5f24e2fc8278f7d8cdfde82e7405a71'
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
        s/@cfgdirname@/${_appname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --pkgname="${pkgname}" --pkgdesc="${pkgdesc}" --categories="AudioVideo" --name="${_pkgname}" --exec="${pkgname} %U"
    cd "${srcdir}/${pkgname}-${pkgver}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export CARGO_HOME="${srcdir}/.cargo"
    HOME="${srcdir}/.electron-gyp"
    {
        echo -e '\n'
        #echo 'build_from_source=true'
        echo "cache=${srcdir}/.npm_cache"
    } >> .npmrc
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
        export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
        {
            echo 'registry=https://registry.npmmirror.com'
            echo 'electron_mirror=https://registry.npmmirror.com/-/binary/electron/'
            echo 'electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/'
        } >> .npmrc
        find ./ -type f -name "package-lock.json" -exec sed -i "s/registry.npmjs.org/registry.npmmirror.com/g" {} +
        echo packages/{app,core,i18n,main,scanner,ui} | xargs -n 1 cp .npmrc
    fi
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    NODE_ENV=development    npm install
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    local electronDist="/usr/lib/electron${_electronversion}"
    NODE_ENV=production     npx shx rm -rf dist
    NODE_ENV=production     npx lerna run build
    NODE_ENV=production NODE_OPTIONS='--max-old-space-size=8192' npm exec -c "electron-builder --linux dir -c.electronDist=${electronDist} -c.extraMetadata.main=dist/main.js" 

}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/release/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname}-${pkgver}/release/linux-"*/resources/{app.asar.unpacked,bin,media,musicgenresicons} "${pkgdir}/usr/lib/${pkgname}"
    _icon_sizes=(16 24 32 48 64 96 128 256 512 1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/packages/app/resources/media/presskit/icons/color/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}x${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
