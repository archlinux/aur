# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: joelvaz0x01 <joelvaz dot whitehat at gmail dot com>
# Contributor: Dawid Weglarz <dawid.weglarz95@gmail.com>
# Contributor: candroid_man <candroid_man@protonmail.com>
# Contributor: Ada <adadonderr@gmail.com>
# Contributor: Christian Finnberg <christian@finnberg.net>
pkgname=notesnook
pkgver=2.6.1
pkgrel=1
pkgdesc="A fully open source & end-to-end encrypted note taking alternative to Evernote"
arch=('any')
url="https://notesnook.com/"
_githuburl="https://github.com/streetwriters/notesnook"
license=('GPL3')
provides=("${pkgname}")
conflicts=("${pkgname}")
depends=('libappindicator-gtk3' 'libnotify' 'libsodium' 'libxss' 'libxtst' 'fuse2' 'alsa-lib' 'nspr' 'nss')
makedepends=('nodejs>=18' 'git' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.desktop")
sha256sums=('81905d22d8d67417b2852070541802aafc4c588d213d8eca8fcb9a11b72cdb42'
            '0b8a124a5236be2ddb1797606b148b8ca144162b7f2aa628c252e2f35b2f8aea')
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
    local X64=linux-unpacked ARM64=linux-arm64-unpacked
    cp -r "${srcdir}/${pkgname}-${pkgver}/apps/desktop/output/${X64}/"* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/apps/desktop/output/${X64}/resources/assets/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}