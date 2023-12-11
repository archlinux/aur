# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=r3playx-git
_pkgname=R3PLAYX
pkgver=2.7.2.r0.g7e43cba
_electronversion=23
pkgrel=1
pkgdesc="A music player forked from YesPlayMusic。高颜值的第三方网易云播放器，支持 Windows / macOS / Linux"
arch=('x86_64')
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
    'pnpm>=8.6.12'
    'make'
    'gcc'
)
source=(
    "${pkgname%-git}"::"git+${url}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '8915ca75d453698df81f7f3305cce6869f4261d754d90f0c3724b73c7b24ca84')
pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long --tags --exclude='*[a-z][a-z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install 18
    nvm use 18
}
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --categories "AudioVideo" --name="${_pkgname}" --exec="${pkgname%-git}"
    cd "${srcdir}/${pkgname%-git}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    cp .env.example .env
    cd "${srcdir}/${pkgname%-git}/packages/desktop"
    sed -e '106,120d' \
        -e '92,94d' \
        -e '91i\    this.sqlite = new SQLite3(this.dbFilePath)' \
        -i main/db.ts
    pnpm config set store-dir "${srcdir}/.pnpm_store"
    pnpm config set cache-dir "${srcdir}/.pnpm_cache"
    pnpm config set link-workspace-packages true
    #npm add prisma fastify-cli turbo tsx electron-builder@23.6.0
    pnpm install
    pnpm run build
    pnpm run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}/packages/desktop/release/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -r "${srcdir}/${pkgname%-git}/packages/desktop/release/linux-unpacked/resources/"{app.asar.unpacked,bin} "${pkgdir}/usr/lib/${pkgname%-git}"
    for _icons in 16x16 24x24 32x32 64x64 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname%-git}/packages/desktop/build/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
}