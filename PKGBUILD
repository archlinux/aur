
# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

_pkgname=Trezor-Suite
_upkgname=trezor-suite
pkgname=trezor-suite-appimage
pkgver=25.11.1
pkgrel=1
pkgdesc="desktop app for Trezor hardware wallets"
arch=('x86_64' 'arm64')
url="https://suite.trezor.io/"
license=('custom:Trezor Reference Source License')
depends=('hicolor-icon-theme' 'zlib' 'fuse' 'trezor-udev' 'gtk3' 'nss')
makedepends=('p7zip')
noextract=("$_pkgname-$pkgver.AppImage")
options=(!strip)
validpgpkeys=('EB483B26B078A4AA1B6F425EE21B6950A2ECB65C')

source=("https://github.com/trezor/trezor-suite/releases/download/v$pkgver/$_pkgname-$pkgver-linux-$arch.AppImage"{,.asc})
#source=("https://data.trezor.io/suite/releases/desktop/latest/$_pkgname-$pkgver-linux-$arch.AppImage"
#        "satoshilabs-2021-signing-key::https://trezor.io/security/satoshilabs-2021-signing-key.asc")
sha256sums=('60c3f0a8a88d38287d3e52db53614a1dc5472657ce0740a87a139c4a12424385'
            'SKIP')

prepare() {
    cd "${srcdir}"
    7z x "${srcdir}/$_pkgname-$pkgver-linux-$arch.AppImage" $_upkgname.desktop usr/share/icons/hicolor/512x512/apps/$_upkgname.png LICENSE.electron.txt LICENSES.chromium.html
    sed -i "s/Exec=AppRun/Exec=\/usr\/bin\/$_upkgname/" $_upkgname.desktop
}

package() {
    cd "${srcdir}"
    install -Dm755 "$_pkgname-${pkgver}-linux-$arch.AppImage"                   "${pkgdir}/opt/$_upkgname/$_upkgname.AppImage"
    install -Dm644 "$_upkgname.desktop"                                         "${pkgdir}/usr/share/applications/$_upkgname.desktop"
    install -Dm644 "usr/share/icons/hicolor/512x512/apps/$_upkgname.png"        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/$_upkgname.png"
    mkdir "${pkgdir}/usr/bin"
    ln -s "/opt/$_upkgname/$_upkgname.AppImage" "${pkgdir}/usr/bin/$_upkgname"
    install -Dm644 LICENSE.electron.txt                                         "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron.txt"
    install -Dm644 LICENSES.chromium.html                                       "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}
