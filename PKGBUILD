# Maintainer: qier22 <qier222@outlook.com>

pkgname=yesplaymusic-git
pkgver=0.4.3.36.gd15b58d
pkgrel=1
pkgdesc="高颜值的第三方网易云播放器，支持 Windows / macOS / Linux"
arch=("x86_64" "aarch64")
url="https://music.qier222.com"
license=("MIT")
provides=("yesplaymusic")
depends=("gtk3" "nss")
optdepends=(
    'c-ares'
    'ffmpeg'
    'http-parser'
    'libevent'
    'libvpx'
    'libxslt'
    'minizip'
    're2'
    'snappy'
    'libnotify'
    'libappindicator-gtk3'
)
makedepends=("nodejs-lts-fermium" "yarn" "git" "libvips")
source=("git+https://github.com/qier222/YesPlayMusic" "yesplaymusic.desktop")
sha256sums=('SKIP'
            '54f7ea2d99239749b40fa88109f4962f913421e3954e42f7bec8264d1f8bd89d')
pkgver(){
    cd "${srcdir}/YesPlayMusic"
    git describe --tags | sed "s/-/./g;s/v//"
}
prepare(){
    cd "${srcdir}/YesPlayMusic"
    yarn install
    cp .env.example .env
}
build(){
    cd "${srcdir}/YesPlayMusic"
    yarn electron:build --linux dir
}
package(){
    cd "${srcdir}/YesPlayMusic"
    mkdir -p "${pkgdir}/opt/YesPlayMusic" 
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/applications"
    case ${CARCH} in
        "x86_64")
            _arch="-"
            ;;
        "aarch64")
            _arch="-arm64-"
            ;;
        "*")
            _arch="-${CARCH}-"
            ;;
    esac
    cp -a dist_electron/linux${_arch}unpacked/* "${pkgdir}/opt/YesPlayMusic"
    ln -sf "/opt/YesPlayMusic/yesplaymusic" "${pkgdir}/usr/bin/yesplaymusic"
    for res in 1024x1024 128x128 16x16 24x24 256x256 32x32 48x48 512x512 64x64
    do
        mkdir -p "${pkgdir}/usr/share/icons/hicolor/${res}/apps"
        install -Dm644 build/icons/${res}.png "${pkgdir}/usr/share/icons/hicolor/${res}/apps/yesplaymusic.png"
    done
    install -Dm644 "${srcdir}/yesplaymusic.desktop" "${pkgdir}/usr/share/applications/yesplaymusic.desktop"
}
