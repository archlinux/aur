# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: joelvaz0x01 <joelvaz dot whitehat at gmail dot com>
# Contributor: Dawid Weglarz <dawid.weglarz95@gmail.com>
# Contributor: candroid_man <candroid_man@protonmail.com>
# Contributor: Ada <adadonderr@gmail.com>
# Contributor: Christian Finnberg <christian@finnberg.net>
pkgname=notesnook
pkgver=2.6.2
pkgrel=1
pkgdesc="A fully open source & end-to-end encrypted note taking alternative to Evernote"
arch=('x86_64')
url="https://notesnook.com/"
_githuburl="https://github.com/streetwriters/notesnook"
license=('GPL3')
provides=("${pkgname}")
conflicts=("${pkgname}")
depends=('libappindicator-gtk3' 'libnotify' 'libsodium' 'libxss' 'libxtst' 'fuse2' 'alsa-lib' 'nspr' 'nss')
makedepends=('nodejs>=18' 'git' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.desktop")
sha256sums=('7f1e368f7e9484af8f2b88e385036b07d4f658454fed3782c98e84136e721b14'
            '102a538ee9432310d854842a578cd3371df0431b4db617479de66aa45b5f2440')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # Build @notesnook/web
    npm install
    npm run build:web
    # Prepare files to pack with electron
    cd apps/desktop
    npm install
    rm -rf ./build
    cp -r ../web/build ./
    sed '155,161d' -i package.json
    npm run build
    # Build with electron
    npx electron-builder --linux --publish=never
}
package() {
    install Dm755 -d "${pkgdir}/"{opt/${pkgname},usr/bin}
    cp -r "${srcdir}/${pkgname}-${pkgver}/apps/desktop/output/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/apps/desktop/output/${X64}/resources/assets/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}