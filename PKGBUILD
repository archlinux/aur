# Maintainer: gardotd426 <gardotd426@gmail.com>

_pkgname=electronplayer
pkgname=$_pkgname
pkgver=2.0.8
pkgrel=4
pkgdesc="An Electron-based web video player, supporting multiple services"
arch=(x86_64)
url="https://github.com/oscartbeaumont/ElectronPlayer"
license=("custom:MIT")
depends=("gtk3" "libxss" "nss" "alsa-lib" "libcups")
makedepends=("yarn" "npm" "git")
optdepends=("libpulse: For pulseaudio support")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${_pkgname}::git+https://github.com/oscartbeaumont/ElectronPlayer.git"
        "${_pkgname}.desktop")

sha512sums=('SKIP'
            '280a252895e641f4bd009b4acf7f9f42959f0b9d51424ea71bf564600533de3867a652efd9d982643c34907bb5e57fa677e6c73315cb69a2f12dfd52e6f09f03')

prepare() {
    cd "$srcdir/$_pkgname"
    yarn --cache-folder "${srcdir}/yarn-cache" 
}

build() {
    cd "$_pkgname"

    # We are not using system Electron as we need castlabs Electron (not packaged (yet?))
    npx electron-builder \
        -c "build/electron-builder.yml" \
        -c.electronDownload.mirror="https://github.com/castlabs/electron-releases/releases/download/v" \
        --linux dir
}

package() {
    cd "$_pkgname"

    install -d "${pkgdir}/usr/lib/${_pkgname}/" "${pkgdir}/usr/bin" "${pkgdir}/usr/share/doc" "${pkgdir}/usr/share/licenses"

    cp -r dist/linux-unpacked/* "${pkgdir}/usr/lib/${_pkgname}/"
    chmod +x "${pkgdir}/usr/lib/${_pkgname}/electronplayer"

    ln -s "/usr/lib/${_pkgname}/electronplayer" "${pkgdir}/usr/bin/electronplayer"

    install -Dm 644 "build/icon.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

    install -Dm 644 "../${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"  # custom .desktop file

    install -Dm 644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
    install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    ln -s "/usr/lib/${_pkgname}/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.electron.txt"
    ln -s "/usr/lib/${_pkgname}/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSES.chromium.html"
}
