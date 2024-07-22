# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=apk-installer
pkgver=1.6.0
_electronversion=10
_nodeversion=16
pkgrel=9
pkgdesc="一款Apk安装器软件,快速安装Apk至手机。"
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
    "${pkgname}.git::git+${url}.git#tag=${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('1d206ce9d5a3716df749ecc0b3b003278547bddcfe20fd8a7afa378033e09314'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${pkgname}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname}.sh"
    gendesk -f -n -q --pkgname="${pkgname}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${pkgname}" --exec="${pkgname} %U"
    _ensure_local_nvm
    cd "${srcdir}/${pkgname}.git"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    #export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    #export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    #export ELECTRONVERSION="${_electronversion}"
    HOME="${srcdir}/.electron-gyp"
    if [ `curl -s ipinfo.io/country | grep CN | wc -l ` -ge 1 ];then
        export npm_config_registry=https://registry.npmmirror.com
        export npm_config_disturl=https://registry.npmmirror.com/-/binary/node/
        export npm_config_electron_mirror=https://registry.npmmirror.com/-/binary/electron/
        export npm_config_electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/
    else
        echo "Your network is OK."
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
    sed 's|"deb", "rpm", "AppImage"|"dir"|g;s|\/\/ icon|icon|g;s|icon.icns|icon.png|g' -i build.config.js
    NODE_ENV=development npm install
    NODE_ENV=production npx electron-builder --config build.config.js
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/packages/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}.git/packages/linux-"*/resources/adb "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/packages/linux-"*/swiftshader/* -t "${pkgdir}/usr/lib/${pkgname}/swiftshader"
    install -Dm644 "${srcdir}/${pkgname}.git/resource/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}