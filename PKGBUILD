# Maintainer: Echo J. <aidas957 at gmail dot com>
# Contributor: Paragoumba <aur at paragoumba dot fr>
# Contributor: Renaud Littolff <rlittolff@gmail.com>

# shellcheck shell=bash disable=SC2034,SC2164

pkgname=proton-pass
pkgver=1.32.10
pkgrel=1
pkgdesc="Open-source and secure identity manager"
arch=('aarch64' 'x86_64')
url="https://proton.me/pass"
license=('GPL-3.0-or-later')
depends=('bash' 'gcc-libs' 'glibc' 'electron')
makedepends=('rust' 'yarn')
conflicts=('proton-pass-bin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ProtonMail/WebClients/archive/refs/tags/${pkgname}@${pkgver}.tar.gz"
        "proton-pass.desktop")
sha256sums=('8923976f1b269c22a7d80280d7f7bf170deac8c2d3e22d2654131cf01fa03f7e'
            '501210c67fc921a2fb4ba591980192ad1da60e26fb6b2fd7d68aad4075eafac7')

prepare() {
    cd WebClients-${pkgname}-${pkgver}

    # Limit workspace applications to avoid mysterious dependency issues
    sed -i 's@"applications/\*",@"applications/pass*",@' package.json

    # Bypass pass-desktop-native build script
    sed -i 's@build:multi@build@' applications/pass-desktop/package.json

    # Skip electron-forge in build step
    sed -i 's@ && electron-forge package@@' applications/pass-desktop/package.json

    # HACK: Make the tray icon work under system Electron
    sed -i 's@process.resourcesPath@"/usr/share/proton-pass"@' applications/pass-desktop/src/main.ts
}

build() {
    cd WebClients-${pkgname}-${pkgver}/applications/pass-desktop

    yarn install
    yarn run build:desktop

    # HACK: Move Rust target directory to avoid asset-relocator including it (reduces size of .asar file)
    {
        mv native/target ../rust-target
        yarn exec 'NODE_ENV=production electron-forge package'
        mv ../rust-target native/target
    }
}

package() {
    cd WebClients-${pkgname}-${pkgver}/applications/pass-desktop

    # Copy the main application archive/assets
    install -d "${pkgdir}"/usr/share/${pkgname}
    cp -ar "out/Proton Pass-linux-"*/resources/* -t "${pkgdir}"/usr/share/${pkgname}

    # Set up the wrapper script
    install -d "${pkgdir}"/usr/bin
    echo -e '#!/bin/bash\n\nexec /usr/bin/electron /usr/share/proton-pass/app.asar "$@"' \
        | tee "${pkgdir}"/usr/bin/${pkgname} > /dev/null
    chmod +x "${pkgdir}"/usr/bin/${pkgname}

    # Copy the desktop file (and associated icon)
    install -Dm644 assets/logo.svg "${pkgdir}"/usr/share/pixmaps/${pkgname}.svg
    install -Dm644 "${srcdir}"/${pkgname}.desktop -t "${pkgdir}"/usr/share/applications
}
