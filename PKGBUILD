
# Maintainer: Julian Stauffer <julian.stauffer.js@gmail.com>
# Contributor: Ryan Pepper <pypper@protonmail.com>
# Contributor: Daniel Landau <daniel@landau.fi>
# Contributor: Christian Bundy <christianbundy@fraction.io>
# Contributor: Linus Karlsson <linus@zozs.se>

pkgname=poncho-wonky
_pkgname=ponchowonky
_upstream=patchwork
pkgver=5.7.2
pkgrel=1
pkgdesc="A decentralized messaging and sharing app built on top of Secure Scuttlebutt (SSB),fork of patchwork"
arch=('x86_64')
_repo="soapdog/patchwork"
url="https://github.com/${_repo}"
license=('AGPL3')
depends=('libxtst' 'libxext' 'libxkbfile' 'libsodium' 'libxss' 'gtk4' 'alsa-lib' 'nss' 'electron39')
replaces=('ssb-patchwork')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source=("${_appimage}::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-${CARCH}.AppImage"
               "https://raw.githubusercontent.com/${_repo}/refs/heads/master/LICENSE"
              )
noextract=("${_appimage}")
sha256sums=('dd0891234094acc52d37d7fea820b6f1578c87c9bcbd17f35baa5f2519c6a4eb'
            '76a97c878c9c7a8321bb395c2b44d3fe2f8d81314d219b20138ed0e2dddd5182')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|"\
        "squashfs-root/${_pkgname}.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

    # Symlink license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
