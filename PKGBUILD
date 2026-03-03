# Maintainer: stormix <hello@stormix.co>
pkgname=deadlock-modmanager-git
pkgver=0.15.0.r39.g45c90ca
pkgrel=1
pkgdesc='A mod manager for the Valve game Deadlock (git)'
arch=('x86_64')
url='https://github.com/deadlock-mod-manager/deadlock-mod-manager'
license=('GPL-3.0-only')
makedepends=('git' 'cargo' 'cargo-tauri' 'pnpm' 'lld' 'gcc')
depends=('webkit2gtk-4.1' 'cairo' 'desktop-file-utils' 'xdg-utils' 'gdk-pixbuf2'
         'glib2' 'gtk3' 'libsoup3' 'pango' 'openssl' 'bzip2' 'hicolor-icon-theme'
         'gst-plugins-good')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "${pkgname%-git}-bin")
options=('!lto')
source=("${pkgname}::git+https://github.com/deadlock-mod-manager/deadlock-mod-manager.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --tags --long --abbrev=7 --match 'v[0-9]*' \
        | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${pkgname}/apps/desktop"
    pnpm install

    cd src-tauri
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTFLAGS="${RUSTFLAGS} -C link-arg=-fuse-ld=lld"
    export CC=gcc
    export CXX=g++
    export CARGO_TARGET_DIR=target
    export VITE_API_URL="https://api.deadlockmods.app"
    export VITE_WEB_URL="https://deadlockmods.app"
    export VITE_AUTH_URL="https://auth.deadlockmods.app"

    cd "${srcdir}/${pkgname}/apps/desktop"
    cargo tauri build --no-bundle -- --frozen
}

package() {
    local _srcroot="${srcdir}/${pkgname}"
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
