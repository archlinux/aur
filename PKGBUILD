# Maintainer:
# Contributor: Paragoumba <aur at paragoumba dot fr>
# Contributor: Renaud Littolff <rlittolff@gmail.com>

pkgname=proton-pass
pkgver=1.30.1.1
pkgrel=1
pkgdesc="Open-source and secure identity manager"
arch=('x86_64')
url="https://proton.me/pass"
license=('GPL-3.0-or-later')
depends=('alsa-lib'
         'at-spi2-core'
         'cairo'
         'dbus'
         'expat'
         'gcc-libs'
         'glib2'
         'glibc'
         'gtk3'
         'libcups'
         'libdrm'
         'libx11'
         'libxcb'
         'libxcomposite'
         'libxdamage'
         'libxext'
         'libxfixes'
         'libxkbcommon'
         'libxrandr'
         'mesa'
         'nspr'
         'nss'
         'pango'
         'systemd-libs')
makedepends=('gendesk' 'npm' 'rustup' 'yarn')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ProtonMail/WebClients/archive/refs/tags/${pkgname}@${pkgver}.tar.gz")
sha256sums=('9e49da3d96e3bc02420eb65ca2c6a987c6df6a94d1fe85ef0b2fe73f0497198c')

prepare() {
    cd "WebClients-${pkgname}-${pkgver}/applications/pass-desktop"
    gendesk -f -n \
        --pkgname "${pkgname}" \
        --pkgdesc "${pkgdesc}" \
        --name 'Proton Pass' \
        --genericname 'Password Manager' \
        --categories 'Utility' \
        --startupnotify

    sed "s/process.resourcesPath/path.dirname(app.getAppPath())/" -i src/main.ts

    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    yarn install
    rustup default stable
}

build() {
    cd "WebClients-${pkgname}-${pkgver}/applications/pass-desktop"
    yarn run build:desktop
}

package() {
    cd "WebClients-${pkgname}-${pkgver}/applications/pass-desktop"
    install -d "${pkgdir}/opt/${pkgname}"
    cp -r "out/Proton Pass-linux-x64/"* "${pkgdir}/opt/${pkgname}"

    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/Proton Pass" "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 assets/logo.svg "${pkgdir}/usr/share/pixmaps/${pkgname}.svg"
    install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
