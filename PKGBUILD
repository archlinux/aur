
# Maintainer: Julian Stauffer <julian.stauffer.js@gmail.com>
# Contributor: Ryan Pepper <pypper@protonmail.com>
# Contributor: Daniel Landau <daniel@landau.fi>
# Contributor: Christian Bundy <christianbundy@fraction.io>
# Contributor: Linus Karlsson <linus@zozs.se>

pkgname=poncho-wonky
_upstream=patchwork
pkgver=4.6.2
pkgrel=1
pkgdesc="A decentralized messaging and sharing app built on top of Secure Scuttlebutt (SSB),fork of patchwork"
arch=('x86_64')
url="https://github.com/soapdog/patchwork"
license=('AGPL3')
depends=('libxtst' 'libxext' 'libxkbfile' 'libsodium' 'libxss' 'gtk4' 'alsa-lib' 'nss' 'electron39')
makedepends=('nodejs' 'npm')
replaces=('ssb-patchwork')
options=(!strip)
source=(
"${url}/archive/v${pkgver}.tar.gz"
'run.sh'
"${pkgname}.desktop"
)

sha256sums=('32df3f0fbbdcfa8ec05c6027408082d37f69cfb8c41518d315ec042b84a5399e'
            'e1518685a1c37abd0a801d0a2872c4e05eb27434402bb9d304c5db8323f4c3a8'
            '26fab2036df5395992a44d92b59238bdda4a6bcebed9883db71c6ab026357f9c')


build() {
    cd "${srcdir}/${_upstream}-${pkgver}"

    # Remove postinstall script that rebuilds for Electron
    # Instead we just build correctly the first time
    sed -i '/postinstall/d' package.json

    # Electron's version.
    export npm_config_target=$(electron39 -v)
    # The architecture of Electron, can be ia32 or x64.
    export npm_config_arch=x64
    export npm_config_target_arch=x64
    # Download headers for Electron.
    export npm_config_disturl=https://nodejs.org/dist
    # Tell node-pre-gyp that we are building for Electron.
    export npm_config_runtime=electron
    # Install all dependencies, and store cache to ~/.electron-gyp.
    HOME=~/.electron-gyp npm install --only=production
}

package() {
    cd "${srcdir}/${_upstream}-${pkgver}"
    install -d "${pkgdir}/opt/${pkgname}"
    cp -a * "${pkgdir}/opt/${pkgname}"
    install -D assets/icon.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"

    cd "${srcdir}"
    install -D run.sh "${pkgdir}/usr/bin/${pkgname}"
    install -D "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop" 
}
