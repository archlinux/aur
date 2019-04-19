# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

_pkgname=electronplayer
pkgname=$_pkgname
pkgver=2.0.3
pkgrel=1
pkgdesc="An Electron-based web video player, supporting multiple services"
url="https://github.com/oscartbeaumont/ElectronPlayer"
license=("MIT" "custom")
arch=(any)

depends=(
# Electron dependencies (possibly some not needed)
    "c-ares"
    "ffmpeg"
    "gtk3"
    "http-parser"
    "libevent"
    "libnghttp2"
    "libxslt"
    "libxss"
    "minizip"
    "nss"
    "re2"
    "snappy"

    "glibc"
    "alsa-lib"
)
makedepends=("yarn")
optdepends=(
    "libpulse: For pulseaudio support"
)

provides=("$_pkgname")
conflicts=("$_pkgname-git")

source=(
    "https://github.com/oscartbeaumont/ElectronPlayer/archive/v${pkgver}.tar.gz"
    "${_pkgname}.desktop"
)
sha512sums=("20f8033b849d897ecf05ac354b057d1d599aa63de2f5a98cef347cde7e091f2aa436e01efdddb2b764423b084021c3ba6f512b6b285ddeb8d696dd308dffd710"
            "280a252895e641f4bd009b4acf7f9f42959f0b9d51424ea71bf564600533de3867a652efd9d982643c34907bb5e57fa677e6c73315cb69a2f12dfd52e6f09f03")

prepare() {
    cd "ElectronPlayer-$pkgver"
    yarn --cache-folder "${srcdir}/yarn-cache" 
}

build() {
    cd "ElectronPlayer-$pkgver"
    
    # We are not using system Electron as we need widevinecdm
    # I do not want to force the user to install widevine globally
    
    npx electron-builder --linux dir
    
    # Delete darwin (macOS) widevine libs
    rm -rf "dist/linux-unpacked/resources/app.asar.unpacked/node_modules/electron-widevinecdm/widevine/darwin_x64"
}

package() {
    cd "ElectronPlayer-$pkgver"
    
    install -d "${pkgdir}/opt/${_pkgname}/" "${pkgdir}/usr/bin" "${pkgdir}/usr/share/doc" "${pkgdir}/usr/share/licenses"
    
    cp -r dist/linux-unpacked/* "${pkgdir}/opt/${_pkgname}/"
    chmod +x "${pkgdir}/opt/${_pkgname}/electronplayer"
    
    ln -s "/opt/${_pkgname}/electronplayer" "${pkgdir}/usr/bin/electronplayer"
    
    install -Dm 644 "build/icon.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
    install -Dm 644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    
    install -Dm 644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
    install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    ln -s "/opt/${_pkgname}/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.electron.txt"
    ln -s "/opt/${_pkgname}/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSES.chromium.html"
}
