# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: joelvaz0x01 <joelvaz dot whitehat at gmail dot com>
# Contributor: Dawid Weglarz <dawid.weglarz95@gmail.com>
# Contributor: candroid_man <candroid_man@protonmail.com>
# Contributor: Ada <adadonderr@gmail.com>
# Contributor: Christian Finnberg <christian@finnberg.net>
pkgname=notesnook
pkgver=2.6.10
pkgrel=1
pkgdesc="A fully open source & end-to-end encrypted note taking alternative to Evernote"
arch=('x86_64')
url="https://notesnook.com/"
_ghurl="https://github.com/streetwriters/notesnook"
license=('GPL3')
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}")
depends=(
    'libappindicator-gtk3'
    'libnotify'
    'libsodium'
    'libxss'
    'libxtst'
    'fuse2'
    'alsa-lib'
    'nspr'
    'nss'
)
makedepends=(
    'nvm'
    'npm'
    'git'
)
source=(
    "${pkgname}-${pkgver}::git+${_ghurl}.git#tag=v${pkgver}"
    "${pkgname}.desktop"
)
sha256sums=('SKIP'
            '102a538ee9432310d854842a578cd3371df0431b4db617479de66aa45b5f2440')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install 16
    nvm use 16
}
build() {
    _ensure_local_nvm
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -e "3i\  \"version\": \"${pkgver}\"," \
        -e "3i\  \"description\": \"${pkgdesc}\"," \
        -e "3i\  \"author\": \"Streetwriters (Private) Limited,support@streetwriters.co,https://streetwriters.co\"," \
        -e "55i\    \"electron\": \"25.9.3\"," \
        -i package.json
    npm install --ignore-scripts --prefer-offline --no-audit --cache "${srcdir}/npm-cache" 
    npm run bootstrap -- --scope=desktop
    npx nx build:desktop @notesnook/web
    npx nx run release --project @notesnook/desktop
    npx electron-builder --linux tar.xz -p never
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/${pkgname},usr/bin}
    cp -r "${srcdir}/${pkgname}-${pkgver}/apps/desktop/output/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/apps/desktop/assets/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}