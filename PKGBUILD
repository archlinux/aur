# Maintainer: Saurabh Kumar Sharma <saurabh000345 at gmail dot com>
pkgname=udeler-bin
pkgver=1.0
pkgrel=2
pkgdesc="Unofficail binary installer for Udeler"
arch=("x86_64")
url="https://github.com/FaisalUmair/udemy-downloader-gui"
license=("GPL")
depends=("wget" "imagemagick") 
options=('!strip')

source=("udeler.desktop" "udeler.png")
sha256sums=("eb1ae20c4666b161ba9a41f28a45980a38649a64fccbd62c3fc2bda3ef30126f"
            "7fc27879ee96d966375390dee238e8fb3841437e17fa69b1a6f1fb65b3a7af46")

prepare(){
    # Getting latest package version
    latver=$(curl --silent 'https://api.github.com/repos/FaisalUmair/udemy-downloader-gui/releases/latest' | grep ".*tag_name.*" | sed -E 's/.*"([^"]+)".*/\1/' | sed -e 's/.\(.*\)/\1/')
    echo "Downloading Udeler v$latver"
    mkdir -p udeler-bin
    echo "https://github.com/FaisalUmair/udemy-downloader-gui/releases/download/v${latver}/Udeler-${latver}-linux-x86_x64.AppImage" 
    wget -q --show-progress "https://github.com/FaisalUmair/udemy-downloader-gui/releases/download/v${latver}/Udeler-${latver}-linux-x86_x64.AppImage" -O udeler-bin/udeler.appimage
    chmod +x udeler-bin/udeler.appimage
}

package(){
    install -dm755 "${pkgdir}/"{opt,usr/share/applications}
    cp -rL "${srcdir}/${pkgname}" "${pkgdir}/opt/${pkgname}"
    install -Dm644 "${srcdir}/udeler.desktop" "${pkgdir}/usr/share/applications/udeler.desktop"
    for _size in "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"
    do
        install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
        convert "${srcdir}/udeler.png" -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/udeler.png"
    done
}
