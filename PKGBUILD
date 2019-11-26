# Maintainer: Ryan Pepper <pypper@protonmail.com>
# Maintainer: Daniel Landau <daniel@landau.fi>

pkgname=ssb-patchwork
_upstream=patchwork
pkgver=3.17.1
pkgrel=1
pkgdesc="A decentralized messaging and sharing app built on top of Secure Scuttlebutt (SSB)"
arch=('i686' 'x86_64')
url="https://github.com/ssbc/patchwork"
license=('AGPL3')
depends=('libxtst' 'libxext' 'libxkbfile' 'gconf' 'libsodium' 'libxss' 'gtk2' 'alsa-lib' 'nss' 'electron6')
makedepends=('nodejs' 'npm')
options=(!strip)
source=(
"https://github.com/ssbc/${_upstream}/archive/v${pkgver}.tar.gz"
'run.sh'
"${pkgname}.desktop"
)

sha256sums=(
'73a13f23bf5c20cc521cbcdd4a53833d1381e20518d6a5451fbcef50c4e10eee'
'5db66d7942606df5f48ea0db2d90b584fa3a984bc2de7bb678d25897f64e3a2f'
'b226436970db40030ad03e9cd847c103aa534d775cd81212308e86a23917d76a'
)


build() {
    cd "${srcdir}/${_upstream}-${pkgver}"

    # Remove postinstall script that rebuilds for Electron
    # Instead we just build correctly the first time
    sed -i '/postinstall/d' package.json

    # Electron's version.
    export npm_config_target=$(electron4 -v)
    # The architecture of Electron, can be ia32 or x64.
    export npm_config_arch=x64
    export npm_config_target_arch=x64
    # Download headers for Electron.
    export npm_config_disturl=https://atom.io/download/electron
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
