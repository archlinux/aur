# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=alpha-badger
_pkgname=Alpha-Badger
pkgver=0.4.1
_electronversion=19
_nodeversion=18
pkgrel=12
pkgdesc="UI wrapper around FFmpeg.(Use system-wide electron)"
arch=('any')
url="https://github.com/NoamRa/alpha-badger"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    'ffmpeg'
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'nvm'
    'curl'
    'npm'
    'git'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname}-${pkgver}::git+${url}#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('05521a3c20bddf8de240cad997860eef751ebedc74ec45f5000bd3dde9ff5e12'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
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
        s/@cfgdirname@/${pkgname}/g
        s/@options@//g
    " "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -f -n -q \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="AudioVideo" \
        --name="${_pkgname}" \
        --exec="${pkgname} %U"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    HOME="${srcdir}/.electron-gyp"
    {
        echo -e '\n'
        #echo 'build_from_source=true'
        echo "cache=${srcdir}/.npm_cache"
        echo "maxsockets=10"
    } >> .npmrc
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            echo 'registry=https://registry.npmmirror.com'
            echo 'electron_mirror=https://registry.npmmirror.com/-/binary/electron/'
            echo 'electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/'
        } >> .npmrc
        find ./ -type f -name "package-lock.json" -exec sed -i "s/registry.npmjs.org/registry.npmmirror.com/g" {} +
    fi
    sed -i -e "
        7i\import path from \"path\";
        33i\    icon: path.join(__dirname, \"..\/brand\/logo.png\"),
    " src/main/index.ts
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    NODE_ENV=development    npm install --leagcy-peer-deps
    NODE_ENV=development    npm add -D @electron-forge/plugin-local-electron
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    local electronDist="/usr/lib/electron${_electronversion}"
    sed -i '/"plugins": \[/a\
    [\
        "@electron-forge/plugin-local-electron",\
        {\
            "electronPath": "'"${electronDist}"'"\
        }\
    ],' package.json
    NODE_ENV=production     npm run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname}-${pkgver}/out/${pkgname}-linux-"*/resources/app "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/brand/${_pkgname//-/_}_logo_480x240.png" "${pkgdir}/usr/lib/${pkgname}/app/.webpack/brand/logo.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/brand/${_pkgname//-/_}_logo_1920x960.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}