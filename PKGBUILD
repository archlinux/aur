# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=horen
pkgver=0.9.5
_subver=perfect-lyric
_electronversion=28
_nodeversion=20
pkgrel=4
pkgdesc="A music player by Electron.(Use system-wide electron)"
arch=('any')
url="https://github.com/horenjs/horen"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'curl'
    'npm'
    'pnpm'
    'nvm'
    'icoutils'
    'git'
)
source=(
    "${pkgname}-${pkgver}::git+${url}.git#tag=${_subver}"
    "${pkgname}.sh"
)
sha256sums=('edbed894502eb999c2efddb9a781425ced5574dd3c7d750c236f97bfcb209f4b'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname}/g
        s/@runname@/app/g
        s/@cfgdirname@/${pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname}.sh"
    gendesk -q -f -n --pkgname="${pkgname}" --pkgdesc="${pkgdesc}" --categories="AudioVideo" --name="${pkgname}" --exec="${pkgname} %U"
    _ensure_local_nvm
    cd "${srcdir}/${pkgname}-${pkgver}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    HOME="${srcdir}/.electron-gyp"
    {
        echo -e '\n'
        #echo 'build_from_source=true'
        echo 'link-workspace-packages=true'
        echo 'fetch-retry-maxtimeout=10000'
        echo "cache-dir="${srcdir}"/.pnpm_cache"
        echo "store-dir="${srcdir}"/.pnpm_store"
        echo "shamefully-hoist=true"
        echo "virtual-store-dir-max-length=80"
        echo "node-linker=hoisted"
    } >> .npmrc
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
        echo 'registry=https://registry.npmmirror.com'
        echo 'electron_mirror=https://cdn.npmmirror.com/binaries/electron/'
        echo 'electron_builder_binaries_mirror=https://npmmirror.com/mirrors/electron-builder-binaries/'
        } >> .npmrc
    fi
    icotool -x preview/"${pkgname}.ico" -o preview/"${pkgname}.png"
    sed -i "s/${pkgname}.ico/${pkgname}.png/g" forge.config.js
    sed -i "s/process.env.APPDATA/\'\/home\/${USER}\'/g" app/main/src/constant.ts
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    NODE_ENV=development    pnpm install
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    NODE_ENV=production     pnpm run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname}-${pkgver}/out/${pkgname}-linux-"*/resources/app "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/preview/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/out/${pkgname}-linux-"*/LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}