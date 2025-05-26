# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=apk-installer
pkgver=1.6.0
_electronversion=10
_nodeversion=16
pkgrel=13
pkgdesc="Apk installer software, quickly install Apk to mobile phones.(Use system-wide electron)一款Apk安装器软件,快速安装Apk至手机。"
arch=('any')
url="https://github.com/zhujiaming/apk-installer"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
    'android-sdk-platform-tools'
)
mkdenpends=(
    'nvm'
    'npm'
    'gendesk'
    'curl'
    'git'
)
source=(
    "${pkgname}-${pkgver}::git+${url}#tag=${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('1d206ce9d5a3716df749ecc0b3b003278547bddcfe20fd8a7afa378033e09314'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
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
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname}/g
        s/@options@//g
    " "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -f -n -q \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${pkgname}" \
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
    # Use Linux adb instead of MacOS adb
    rm -rf resource/adb/*
    ln -sf "/opt/android-sdk/platform-tools/adb" resource/adb/adb
    ln -sf "/opt/android-sdk/platform-tools/fastboot" resource/adb/fastboot
    ln -sf "/opt/android-sdk/platform-tools/make_f2fs" resource/adb/make_f2fs
    ln -sf "/opt/android-sdk/platform-tools/make_f2fs_casefold" resource/adb/make_f2fs_casefold
    ln -sf "/opt/android-sdk/platform-tools/hprof-conv" resource/adb/hprof-conv
    ln -sf "/opt/android-sdk/platform-tools/mke2fs" resource/adb/mke2fs
    ln -sf "/opt/android-sdk/platform-tools/sqlite3" resource/adb/sqlite3
    sed -i "s/\/\/ icon/icon/g;s/icon\.icns/icon\.png/g" build.config.js
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    NODE_ENV=development    npm install
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    local electronDist="/usr/lib/electron${_electronversion}"
    NODE_ENV=production     npm exec -c "electron-builder --linux dir -c.electronDist=${electronDist} --config build.config.js"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/packages/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname}-${pkgver}/packages/linux-"*/resources/adb "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/resource/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}