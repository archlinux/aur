# Maintainer: qier22 <qier222@outlook.com>

pkgbase=yesplaymusic-git
pkgname=(yesplaymusic-git yesplaymusic-electron-git)
pkgver=0.4.5.r28.gf9e6164
pkgrel=1
pkgdesc="高颜值的第三方网易云播放器，支持 Windows / macOS / Linux"
arch=("x86_64" "aarch64")
url="https://music.qier222.com"
license=("MIT")
provides=("yesplaymusic")
conflicts=("yesplaymusic")
depends=("gtk3" "nss" "libxss" "c-ares" "ffmpeg" "http-parser" "libevent" "libvpx" "libxslt" "minizip" "re2" "snappy" "libnotify" "libappindicator-gtk3")
makedepends=("yarn" "git" "libvips" "nodejs-lts-gallium")
optdepends=('yt-dlp: Youtube source for built-in UnblockNeteaseMusic')
source=("git+https://github.com/qier222/YesPlayMusic" "yesplaymusic.desktop" "yesplaymusic")
sha256sums=('SKIP'
            '56fb010914c3baad7bde6ccac03d9e92f705652c6f0098547cafbf4fcc613630'
            'dc7e893cbea98f0f20b7ffdf18c8462c45069618421ea2ebd40ee34051f68e66')
_electron=electron13

pkgver(){
    cd "${srcdir}/YesPlayMusic"
    git describe --tags --long | sed 's/v//;s/-/.r/;s/-/./g'
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
package_yesplaymusic-git(){
    cd "${srcdir}/YesPlayMusic"
    mkdir -p "${pkgdir}/opt/YesPlayMusic" 
    mkdir -p "${pkgdir}/usr/bin"
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
        install -Dm644 build/icons/${res}.png "${pkgdir}/usr/share/icons/hicolor/${res}/apps/yesplaymusic.png"
    done
    install -Dm644 "${srcdir}/yesplaymusic.desktop" "${pkgdir}/usr/share/applications/yesplaymusic.desktop"
}
package_yesplaymusic-electron-git(){
    depends+=("${_electron}")
    pkgdesc+=" (with system electrton)"
    conflicts+=("yesplaymusic-electron")
    provides+=("yesplaymusic-electron")
    cd "${srcdir}/YesPlayMusic"
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
    install -Dm644 dist_electron/linux${_arch}unpacked/resources/app.asar "${pkgdir}/usr/lib/yesplaymusic/yesplaymusic.asar"
    install -Dm755 "${srcdir}/yesplaymusic" "${pkgdir}/usr/bin/yesplaymusic"
    install -Dm644 "${srcdir}/yesplaymusic.desktop" "${pkgdir}/usr/share/applications/yesplaymusic.desktop"
    sed -i "s/electron/${_electron}/" "${pkgdir}/usr/bin/yesplaymusic"
    for res in 1024x1024 128x128 16x16 24x24 256x256 32x32 48x48 512x512 64x64
    do
        install -Dm644 build/icons/${res}.png "${pkgdir}/usr/share/icons/hicolor/${res}/apps/yesplaymusic.png"
    done
}
