# Maintainer: Saurabh Kumar Sharma <saurabh000345 at gmail dot com>
_appname_=imgbrd-grabber
pkgname="${_appname_}-bin"
pkgver=1.0
pkgrel=1
pkgdesc="Unofficial binary installer for ImgBrd Grabber"
arch=("x86_64")
url="https://github.com/Bionus/imgbrd-grabber"
license=("GPL")
depends=("wget" "imagemagick") 
options=('!strip')
conflicts=('imgbrd-grabber-git')

source=("${_appname_}.desktop" "${_appname_}.png")
sha256sums=("c43bf8672d239ebcc98f175e01f4ec6015b279a90e713522acd76bedb0e353ff"
            "f0300d4576141332016d2e89ca8bc1cd48244197b48c0302b2d0018c87c0b6fd")

prepare(){
    # Getting latest package version
    latver=$(curl --silent 'https://api.github.com/repos/Bionus/imgbrd-grabber/releases/latest' | grep ".*tag_name.*" | sed -E 's/.*"([^"]+)".*/\1/' | sed -e 's/.\(.*\)/\1/')
    echo "Downloading ImgBrd Grabber v$latver"
    mkdir -p ${_appname_}
    downloadlink=$(curl --silent 'https://api.github.com/repos/Bionus/imgbrd-grabber/releases/latest' | grep ".*browser_download_url.*AppImage*" | sed -E 's/.*"([^"]+)".*/\1/')
    echo "  Downloading through: ${downloadlink}"
    wget -q -N -c --show-progress "${downloadlink}" -O ${_appname_}/${_appname_}.appimage
    chmod +x ${_appname_}/${_appname_}.appimage
}

package(){
    install -dm755 "${pkgdir}/"{opt,usr/share/applications}
    cp -rL "${srcdir}/${_appname_}" "${pkgdir}/opt/${pkgname}"
    install -Dm644 "${srcdir}/${_appname_}.desktop" "${pkgdir}/usr/share/applications/${_appname_}.desktop"
    for _size in "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"
    do
        install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
        convert "${srcdir}/${_appname_}.png" -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${_appname_}.png"
    done
}
