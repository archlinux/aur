# Maintainer:
# Contributor: Paragoumba <aur at paragoumba dot fr>
# Contributor: Renaud Littolff <rlittolff@gmail.com>

pkgname=proton-pass
pkgver=1.26.0
_pkgver="${pkgver}-rc9"
pkgrel=2
pkgdesc="Open-source and secure identity manager"
arch=('x86_64')
url="https://proton.me/pass"
license=('GPL-3.0-or-later')
_electron=electron33
depends=('alsa-lib'
         'at-spi2-core'
         'cairo'
         'dbus'
         "${_electron}"
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ProtonMail/WebClients/archive/refs/tags/${pkgname}@${_pkgver}.tar.gz")
sha256sums=('34d6f5f76120a76e3c288beb38782d9f5d0dbbf385059f7544cccf013a852292')

prepare() {
    cd "WebClients-${pkgname}-${_pkgver}/applications/pass-desktop"
    gendesk -f -n \
        --pkgname "${pkgname}" \
        --pkgdesc "${pkgdesc}" \
        --name 'Proton Pass' \
        --genericname 'Password Manager' \
        --categories 'Utility'

    sed "s/process.resourcesPath/path.dirname(app.getAppPath())/" -i src/main.ts

    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    yarn install
    rustup default stable
}

build() {
    cd "WebClients-${pkgname}-${_pkgver}/applications/pass-desktop"
    yarn run build:desktop
}

package() {
    cd "WebClients-${pkgname}-${_pkgver}/applications/pass-desktop"
    install -d "${pkgdir}/opt/${pkgname}"
    cp -r "out/Proton Pass-linux-x64/"* "${pkgdir}/opt/${pkgname}"

    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/Proton Pass" "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 assets/logo.svg "${pkgdir}/usr/share/pixmaps/${pkgname}.svg"
    install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
