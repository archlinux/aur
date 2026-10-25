# Maintainer: Echo J. <aidas957 at gmail dot com>
# Contributor: Paragoumba <aur at paragoumba dot fr>
# Contributor: Renaud Littolff <rlittolff@gmail.com>

# shellcheck shell=bash disable=SC2034,SC2164

pkgname=proton-pass
pkgver=1.43.0
pkgrel=1
pkgdesc="Open-source and secure identity manager"
arch=('aarch64' 'x86_64')
url="https://proton.me/pass"
license=('GPL-3.0-or-later')
depends=('bash' 'gcc-libs' 'glibc' 'electron')
makedepends=('nodejs' 'pnpm' 'rust')
conflicts=('proton-pass-bin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ProtonMail/WebClients/archive/refs/tags/${pkgname}@${pkgver}.tar.gz"
        "proton-pass.desktop")
sha256sums=('4bec62194dfc4c7036a9a8af1229252f4f6bf98c42a5d4f05401d9970412f532'
            '1c5c6373a3e3be71e34e42fa6c7486601f04a645763496c5a808bc843456e0fc')

prepare() {
    cd WebClients-${pkgname}-${pkgver}

    # Only define Pass application packages to avoid problematic Proton repo dependencies
    sed -i 's@applications/\*@applications/pass*@' pnpm-workspace.yaml

    # Patch out the usage/resolution of problematic tpe packages
    sed -i '/.*- tests.*/d' pnpm-workspace.yaml
    sed -i -E '/  tests:/{:a;N;/utilities\/ci-pass:/!ba;s/  tests:.*(utilities\/ci-pass:)/  \1/;}' pnpm-lock.yaml
    sed -i -E $'/  \'@tpe\/loki-client/{:a;N;/\'@trivago\/prettier-plugin/!ba;s/  \'@tpe\/loki-client.*(\'@trivago\/prettier-plugin)/  \\1/;}' pnpm-lock.yaml

    # Skip broken internal repo for protontech packages
    sed -i '/@protontech/d' .npmrc

    # Bypass pass-desktop-native build script (removes npm/rustup requirement and Rust target hardcoding)
    sed -i 's@build"@build:napi \&\& pnpm run build:host"@' applications/pass-desktop/package.json

    # Freeze the lockfile when building the Rust component
    sed -i 's@--release@--release --locked@' applications/pass-desktop/native/package.json

    # Skip electron-forge in build step (needed for .asar size improvement below)
    sed -i 's@ && electron-forge package@@' applications/pass-desktop/package.json

    # HACK: Make the tray icon work under system Electron
    sed -i 's@process.resourcesPath@"/usr/share/proton-pass"@' applications/pass-desktop/src/main.ts
}

build() {
    cd WebClients-${pkgname}-${pkgver}/applications/pass-desktop

    # Update Proton logger dependency to a version available on npm
    pnpm add '@protontech/logger@1.0.0' --ignore-scripts

    # preinstall script is ran from a mysterious missing utilities directory
    pnpm install --frozen-lockfile --no-runtime --ignore-scripts

    pnpm run build:desktop

    # HACK: Move Rust target directory to avoid asset-relocator including it (reduces size of .asar file)
    {
        mv native/target ../rust-target
        pnpm exec 'NODE_ENV=production electron-forge package'
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
