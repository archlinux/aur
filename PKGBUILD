# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=r3playx-git
_pkgname=R3PLAYX
pkgver=2.7.4.r2.gfcaedd4
_electronversion=28
_nodeversion=18
pkgrel=1
pkgdesc="A music player forked from YesPlayMusic。高颜值的第三方网易云播放器，支持 Windows / macOS / Linux"
arch=('any')
url="https://github.com/Sherlockouo/music"
license=('AGPL3')
conflicts=("${pkgname%-git}" "yesplaymusic" "r3play")
provides=("yesplaymusic")
depends=(
    "electron${_electronversion}"
    'hicolor-icon-theme'
    'python'
)
makedepends=(
    'gendesk'
    'git'
    'nvm'
    'npm'
    'pnpm'
    'make'
    'gcc'
)
source=(
    "${pkgname//-/.}::git+${url}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'd4272fed78cdcacd9edfb019134ac485d65b43f4d8c7a4179edbaed56af9b231')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    git describe --long --tags --exclude='*[a-z][a-z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-git}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --categories "AudioVideo" --name="${_pkgname}" --exec="${pkgname%-git} %U"
    cd "${srcdir}/${pkgname//-/.}"
    export npm_config_build_from_source=true
    #export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    #export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    #export ELECTRONVERSION="${_electronversion}"
    pnpm config set store-dir "${srcdir}/.pnpm_store"
    pnpm config set cache-dir "${srcdir}/.pnpm_cache"
    pnpm config set link-workspace-packages true
    cp .env.example .env
    cd "${srcdir}/${pkgname//-/.}"
    sed '87d;78,84d' -i packages/desktop/.electron-builder.config.js
    #sed -e '106,120d' \
    #    -e '92,94d' \
    #    -e '91i\    this.sqlite = new SQLite3(this.dbFilePath)' \
    #    -i packages/desktop/main/db.ts
    pnpm install
    pnpm run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/packages/desktop/release/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -r "${srcdir}/${pkgname//-/.}/packages/desktop/release/linux-unpacked/resources/"{app.asar.unpacked,bin} "${pkgdir}/usr/lib/${pkgname%-git}"
    for _icons in 16x16 24x24 32x32 64x64 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname//-/.}/packages/desktop/build/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
}