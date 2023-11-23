# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=r3playx-git
_pkgname=R3PLAYX
pkgver=2.7.1.r12.gc531131
pkgrel=1
pkgdesc="A music player forked from YesPlayMusic。高颜值的第三方网易云播放器，支持 Windows / macOS / Linux"
arch=('x86_64')
url="https://github.com/Sherlockouo/music"
license=('AGPL3')
conflicts=("${pkgname%-git}" "yesplaymusic" "r3play")
provides=("yesplaymusic")
depends=(
    'electron23'
    'hicolor-icon-theme'
    'python'
)
makedepends=(
    'gendesk'
    'git'
    'nvm'
    'npm'
    'pnpm>=7.20.0'
    'make'
    'gcc'
)
source=(
    "${pkgname%-git}"::"git+${url}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'f3ecacd977fa9a41efe35eb2e228f0d8e1dc71bca33002d4838bf41df6438055')
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
    _ensure_local_nvm
    gendesk -q -f -n --categories "AudioVideo" --name="${_pkgname}" --exec="${pkgname%-git}"
    cd "${srcdir}/${pkgname%-git}"
    cp .env.example .env
    cd "${srcdir}/${pkgname%-git}/packages/desktop"
    sed -e '106,120d' \
        -e '92,94d' \
        -e '91i\    this.sqlite = new SQLite3(this.dbFilePath)' \
        -i main/db.ts
    npm i prisma fastify-cli turbo tsx electron-builder@23.6.0 -g
    pnpm install
    pnpm package
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
