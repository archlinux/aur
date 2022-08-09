# Maintainer: Shi Liang
# Contributor: KuoHuanHuan <hi@nekohuan.cyou>
# Contributor: Grassblock <hi@imgb.space>

pkgname=("yesplaymusicosd-origin-git" "yesplaymusicosd-origin-electron-git")
pkgver=0.4.5.r37.g1d43e60
pkgrel=1
pkgdesc="高颜值的第三方网易云播放器，支持 Windows / macOS / Linux :electron: 支持桌面歌词！(no fork)."
arch=("x86_64" "aarch64")
url="https://github.com/shih-liang/YesPlayMusicOSD" 
license=("MIT")
provides=("yesplaymusicosd")
conflicts=("yesplaymusicosd")
depends=(
    "gtk3" "nss" "libxss" "c-ares" "ffmpeg" "http-parser" "libevent" "libvpx" "libxslt" "minizip" "re2" 
    "snappy" "libnotify" "libappindicator-gtk3")
makedepends=("git" "libvips" "nodejs=16.16.0" "yarn")
optdepends=('yt-dlp: Youtube source for built-in UnblockNeteaseMusic')
source=(
    "git+https://github.com/shih-liang/YesPlayMusicOSD.git"
    "yesplaymusic.desktop"
    "yesplaymusic")
sha256sums=('SKIP'
            '5b53cb0b2dfea09b992671e6e58057264fa4628fd61851d216bd0d7c7f8e0969'
            '1a668db904a1d8f5c849aace5916d7013949021f44b0ce9c8e40bf4d643821f3')
_electron=electron13

prepare(){
    cd "${srcdir}/YesPlayMusicOSD"
    cp .env.example .env
    yarn install
}
pkgver(){
    cd "${srcdir}/YesPlayMusicOSD"
    git describe --tags --long | sed 's/v//;s/-/.r/;s/-/./g'
}
build(){
    cd "${srcdir}/YesPlayMusicOSD"
    yarn run electron:build --linux --dir
}
package_yesplaymusicosd-origin-git(){
    cd "${srcdir}/YesPlayMusicOSD"
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
package_yesplaymusicosd-origin-electron-git(){
    depends+=("${_electron}")
    pkgdesc+=" (with system electrton)"
    conflicts+=("yesplaymusicosd-electron")
    provides+=("yesplaymusicosd-electron")
    cd "${srcdir}/YesPlayMusicOSD"
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
