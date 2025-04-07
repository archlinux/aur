# Maintainer: ZhangHua <zhanghuadedn at gmail dot com>
# Maintainer: Icalinguaplusplus <https://github.com/Icalinguaplusplus>
# Contributor: Clansty <i at gao4 dot pw>

pkgname=("icalingua++-git" "icalingua++-electron-git")
pkgver=2.12.28.r8.gd36c81a0
pkgrel=1
pkgdesc='A Linux client for QQ and more(fork to upgrading)'
license=('AGPL')
depends=('ffmpeg' 'libappindicator-gtk3' 'libvips')
makedepends=('git' 'ts-node'  'python-setuptools' 'nodejs' 'node-gyp')
optdepends=('mongodb: Provides storage'
            'redis: Provides storage')
arch=('aarch64' 'x86_64' 'i686')
url="https://github.com/Icalingua-plus-plus/Icalingua-plus-plus"
provides=('electron-qq' 'icalingua')
conflicts=('electron-qq' 'icalingua')
replaces=('electron-qq')
source=("Icalingua::git+${url}#branch=develop")
sha256sums=('SKIP')
_electron=electron22

prepare() {
    cd "${srcdir}/Icalingua"
    corepack use pnpm
    corepack pnpm install
    sed -i '/externals/a "bindings",' icalingua/.electron-vue/webpack.main.config.ts
}
pkgver(){
    cd "${srcdir}/Icalingua"
    git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

build(){
    cd "${srcdir}/Icalingua"
    export NODE_OPTIONS=--openssl-legacy-provider
    cd icalingua
    corepack pnpm run build:dir
}
package_icalingua++-git(){
    depends+=(
        # Electron depends
        "c-ares"  "gtk3"  "libevent"  "nss"  "wayland"  "fontconfig"
        "woff2"  "aom"  "brotli"  "libjpeg"  "icu"  "dav1d"  "flac"
        "snappy" "libxml2"  "ffmpeg"  "libwebp"  "minizip"  "opus"
        "harfbuzz"  "jsoncpp"  "libxslt"  "libpng"  "freetype2"
    )
    optdepends+=(
        # Electron optdepends
        "kde-cli-tools: file deletion support (kioclient5)"
        "pipewire: WebRTC desktop sharing under Wayland"
        "qt5-base: enable Qt5 with --enable-features=AllowQt"
        "trash-cli: file deletion support (trash-put)"
        "xdg-utils: open URLs with desktop’s default (xdg-email, xdg-open)"
    )
    case ${CARCH} in
        "x86_64")
            _arch="-";;
        "aarch64")
            _arch="-arm64-";;
        "i686")
            _arch="-ia32-";;
        "*")
            _arch="-${CARCH}-";;
    esac
    mkdir -p "${pkgdir}/opt/icalingua"
    mkdir -p "${pkgdir}/usr/bin"
    cd "${srcdir}/Icalingua/icalingua"
    cp -a build/linux${_arch}unpacked/* "${pkgdir}/opt/icalingua"
    cd "${srcdir}/Icalingua/pkgres"
    install -Dm644 512x512.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/icalingua.png"
    install -Dm644 icalingua.desktop "${pkgdir}/usr/share/applications/icalingua.desktop"
    ln -s "/opt/icalingua/icalingua" "${pkgdir}/usr/bin/icalingua"
}
package_icalingua++-electron-git(){
    conflicts+=("icalingua-electron")
    provides+=("icalingua-electron")
    depends+=("${_electron}")
    pkgdesc+=' with system electron'
    case ${CARCH} in
        "x86_64")
            _arch="-";;
        "aarch64")
            _arch="-arm64-";;
        "i686")
            _arch="-ia32-";;
        "*")
            _arch="-${CARCH}-";;
    esac
    mkdir -p "${pkgdir}/usr/bin"
    cd "${srcdir}/Icalingua/icalingua/build/linux${_arch}unpacked"
    install -Dm644 "resources/app.asar" "${pkgdir}/usr/lib/icalingua/icalingua.asar"
    cd "${srcdir}/Icalingua/pkgres"
    install -Dm644 512x512.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/icalingua.png"
    install -Dm644 icalingua.desktop "${pkgdir}/usr/share/applications/icalingua.desktop"
    install -Dm755 icalingua "${pkgdir}/usr/bin/icalingua"
    sed -i "s/^electron[0-9]*/${_electron}/" "${pkgdir}/usr/bin/icalingua"
}
