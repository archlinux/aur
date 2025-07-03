# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=gui-butler
pkgver=2.3.4
_electronversion=28
_nodeversion=20
pkgrel=1
pkgdesc="A wrapper for itch.io's butler which lets you take advantage of the basic features without having to go through a CLI or set up build scripts for each new project.(Use system-wide electron)"
arch=('x86_64')
url="https://seansleblanc.itch.io/gui-butler"
_ghurl="https://github.com/seleb/gui-butler"
license=('MIT')
conflicts=("${pkgname}")
noextract=("butler-${pkgver}.zip")
depends=(
    "electron${_electronversion}"
    'nodejs'
)
makedepends=(
    'npm'
    'gendesk'
    'nvm'
    'curl'
    'git'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname}-${pkgver}::git+${_ghurl}#tag=v${pkgver}"
    "butler-${pkgver}.zip::https://broth.itch.zone/butler/linux-amd64/LATEST/archive/default"
    "${pkgname}.sh"
)
sha256sums=('94ef03cda13f5668bc6d6d3cf076b6f58b1d1c9be494e297e3115b2253d13bfc'
            'bee1d708b5ed3dc7efcda3b5416ad5ca87a04d7e5fb6ebada510f3ba0cba3b69'
            'f2fe8c189974ffb9d445e9a42bd4f1d5b60185607c3fcafae79ab44be224e013')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname}/g
        s/@runname@/app/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -f -n -q \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Development" \
        --name="${pkgname}" \
        --exec="${pkgname} %U"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    HOME="${srcdir}/.electron-gyp"
    {
        echo -e '\n'
        #echo 'build_from_source=true'
        echo "cache=${srcdir}/.npm_cache"
        echo "maxsockets=32"
    } >> .npmrc
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            echo 'registry=https://registry.npmmirror.com'
            echo 'electron_mirror=https://registry.npmmirror.com/-/binary/electron/'
            echo 'electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/'
        } >> .npmrc
        find ./ -type f -name "package-lock.json" -exec sed -i "s/registry.npmjs.org/registry.npmmirror.com/g" {} +
    fi
    sed -i "s/favicon\.ico/favicon\.png/g" package.json
    NODE_ENV=development    npm install --force
    install -Dm755 -d "${srcdir}/${pkgname}-${pkgver}/bin/${pkgname}-linux-x64/resources/app/butler"
    bsdtar -xf "${srcdir}/butler-${pkgver}.zip" -C "${srcdir}/${pkgname}-${pkgver}/bin/${pkgname}-linux-x64/resources/app/butler"
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    NODE_ENV=production     npm run build
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname}-${pkgver}/bin/${pkgname}-linux-x64/resources/app" "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/favicon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}