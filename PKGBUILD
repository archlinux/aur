# Maintainer: Echo J. <aidas957 at gmail dot com>
# Contributor: Paragoumba <aur at paragoumba dot fr>
# Contributor: Renaud Littolff <rlittolff@gmail.com>

# shellcheck shell=bash disable=SC2034,SC2164

pkgname=proton-pass
pkgver=1.32.6
pkgrel=2
pkgdesc="Open-source and secure identity manager"
arch=('aarch64' 'x86_64')
url="https://proton.me/pass"
license=('GPL-3.0-or-later')
depends=('bash' 'gcc-libs' 'glibc' 'electron')
makedepends=('rust' 'yarn')
conflicts=('proton-pass-bin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ProtonMail/WebClients/archive/refs/tags/${pkgname}@${pkgver}.tar.gz"
        "proton-pass.desktop"
        "7d910a0ebe6bc69dc145fa7569c0094748d280cd.patch")
sha256sums=('67a5b939f0131974c7a3845a91737c55939de872f5415eb4d660f50508abf893'
            '501210c67fc921a2fb4ba591980192ad1da60e26fb6b2fd7d68aad4075eafac7'
            '7f576b4db49378fedf722f6dc8c13b09a62cda0d6c7b86948a9717352c02610b')

prepare() {
    cd WebClients-${pkgname}-${pkgver}

    # Fix collect-metrics workspace error (https://github.com/ProtonMail/WebClients/commit/7d910a0ebe6bc69dc145fa7569c0094748d280cd)
    patch --no-backup-if-mismatch -Np1 -i ../7d910a0ebe6bc69dc145fa7569c0094748d280cd.patch

    # Limit workspace applications to avoid mysterious dependency issues
    sed -i 's@"applications/\*",@"applications/pass*",@' package.json

    # Use the NPM version of the Drive SDK (because the Proton (Tech) servers are inaccessible)
    sed -i -e 's@proton/drive-sdk@protontech/drive-sdk@' -e 's@0.0.9@0.0.10@' packages/drive/package.json

    # Disable the rustup command (because we don't use that tool)
    sed -i 's@execSync(`rustup@//execSync(`rustup@' applications/pass-desktop/native/build.js

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

    # HACK: Move Rust target directory to avoid asset-relocator including it
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
