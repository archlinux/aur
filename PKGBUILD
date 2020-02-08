# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

_pkgname=electronplayer
pkgname=$_pkgname
pkgver=2.0.8
pkgrel=1
pkgdesc="An Electron-based web video player, supporting multiple services"
arch=(any)
url="https://github.com/oscartbeaumont/ElectronPlayer"
license=("custom:MIT")

depends=("c-ares"
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
         "alsa-lib")
makedepends=("yarn"
             "npm")
optdepends=("libpulse: For pulseaudio support")
provides=("$_pkgname")
conflicts=("$_pkgname-git")

source=("https://github.com/oscartbeaumont/ElectronPlayer/archive/v${pkgver}.tar.gz"
        "${_pkgname}.desktop")
sha512sums=('039e8955a056bcfa4dc674118e906f2029a1327dcf94bc98d9aa56df8360ccd378d9ab5dce09fd441b5e9ef5ccdaa45ea4a0cccdc61e0dd7b38b3c4d7569dc4e'
            '280a252895e641f4bd009b4acf7f9f42959f0b9d51424ea71bf564600533de3867a652efd9d982643c34907bb5e57fa677e6c73315cb69a2f12dfd52e6f09f03')


prepare() {
    cd "ElectronPlayer-$pkgver"

    cp "package.linux.json" "package.json"

    yarn --cache-folder "${srcdir}/yarn-cache" 
}

build() {
    cd "ElectronPlayer-$pkgver"

    # We are not using system Electron as we need castlabs Electron (not packaged (yet?))
    npx electron-builder \
        -c "build/electron-builder.yml" \
        -c.electronDownload.mirror="https://github.com/castlabs/electron-releases/releases/download/v" \
        --linux dir
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
