# Maintainer: stormix <hello@stormix.co>
pkgname=deadlock-modmanager
pkgdesc='A mod manager for the Valve game Deadlock'
_pkgver=2.1.1
pkgver=${_pkgver}
pkgrel=1
arch=('x86_64')
url='https://github.com/deadlock-mod-manager/deadlock-mod-manager'
license=('GPL-3.0-only')
makedepends=('cargo' 'cargo-tauri' 'nodejs' 'pnpm' 'protobuf'
             'libayatana-appindicator')
depends=('webkit2gtk-4.1' 'cairo' 'desktop-file-utils' 'xdg-utils' 'gdk-pixbuf2'
         'glib2' 'gtk3' 'libsoup3' 'pango' 'openssl' 'bzip2' 'hicolor-icon-theme'
         'gst-plugins-good' 'glibc' 'libgcc' 'libstdc++' 'dbus')
conflicts=('deadlock-modmanager-bin' 'deadlock-modmanager-git')
source=("${pkgname}-${_pkgver}.tar.gz::https://github.com/deadlock-mod-manager/deadlock-mod-manager/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('ea49a61a27ed4bc4992c915fe2e65d09a9fbf2833182cd05ffdb2aa3641348a9')

prepare() {
    cd "${srcdir}/deadlock-mod-manager-${_pkgver}/apps/desktop"

    # v1.1.0 pins valveprotos to deadlock-api/valveprotos-rs, which was merged
    # into the deadlock-api monorepo (same rev). Drop once _pkgver moves past 1.1.0.
    sed -i 's#deadlock-api/valveprotos-rs#deadlock-api/deadlock-api#' src-tauri/Cargo.toml Cargo.lock

    # v1.1.0's desktop install still pulls sharp via better-auth's next peer, and a
    # system libvips makes sharp build from source with npm. Drop once _pkgver moves
    # past 1.1.0.
    export SHARP_IGNORE_GLOBAL_LIBVIPS=1
    # The root impeccable devDependency pulls puppeteer, whose postinstall downloads Chrome.
    export PUPPETEER_SKIP_DOWNLOAD=1
    pnpm install --frozen-lockfile --filter @deadlock-mods/desktop...

    cd src-tauri
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export CC=gcc
    export CXX=g++
    export CFLAGS+=" -ffat-lto-objects"
    export CXXFLAGS+=" -ffat-lto-objects"
    export CARGO_TARGET_DIR=target
    export VITE_API_URL="https://api.deadlockmods.app"
    export VITE_WEB_URL="https://deadlockmods.app"
    export VITE_AUTH_URL="https://auth.deadlockmods.app"

    cd "${srcdir}/deadlock-mod-manager-${_pkgver}/apps/desktop"
    cargo tauri build --no-bundle -- --frozen
}

package() {
    local _srcroot="${srcdir}/deadlock-mod-manager-${_pkgver}"
    local _tauri="${_srcroot}/apps/desktop/src-tauri"

    install -Dm644 "${_srcroot}/distribution/aur/deadlock-modmanager.desktop" \
        "${pkgdir}/usr/share/applications/deadlock-modmanager.desktop"

    install -Dm755 "${_tauri}/target/release/deadlock-mod-manager" \
        "${pkgdir}/usr/bin/deadlock-modmanager"
    install -Dm644 "${_tauri}/icons/32x32.png" \
        "${pkgdir}/usr/share/icons/hicolor/32x32/apps/deadlock-modmanager.png"
    install -Dm644 "${_tauri}/icons/128x128.png" \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/deadlock-modmanager.png"
    install -Dm644 "${_tauri}/icons/128x128@2x.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/deadlock-modmanager.png"
    install -Dm644 "${_tauri}/icons/icon.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/deadlock-modmanager.png"

    install -Dm644 "${_tauri}/dev.stormix.deadlock-mod-manager.metainfo.xml" \
        "${pkgdir}/usr/share/metainfo/dev.stormix.deadlock-mod-manager.metainfo.xml"
}
