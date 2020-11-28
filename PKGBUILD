# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

_pkgname=Trezor-Suite
_upkgname=trezor-suite
pkgname=trezor-suite-appimage
pkgver=20.11.2
pkgrel=2
pkgdesc="desktop app for Trezor hardware wallets"
arch=('x86_64')
url="https://suite.trezor.io/"
license=('custom:Trezor Reference Source License')
depends=('hicolor-icon-theme' 'zlib' 'fuse' 'trezor-udev' 'gtk3' 'nss')
makedepends=('p7zip')
noextract=("$_pkgname-$pkgver.AppImage")
options=('!strip')
validpgpkeys=('54067D8BBF00554181B5AB8F26A3A56662F0E7E2')

source=("https://github.com/trezor/trezor-suite/releases/download/v$pkgver/$_pkgname-$pkgver-linux.AppImage"{,.asc})
sha256sums=('bcec9a29337d4cc21a980a996906ae140509641459a85cca0a38a490f4450f03'
            'SKIP')

prepare() {
    cd "${srcdir}"
    7z x "${srcdir}/$_pkgname-$pkgver-linux.AppImage" $_upkgname.desktop usr/share/icons/hicolor/0x0/apps/$_upkgname.png LICENSE.electron.txt LICENSES.chromium.html
    sed -i "s/Exec=AppRun/Exec=\/usr\/bin\/$_upkgname/" $_upkgname.desktop
}

package() {
    cd "${srcdir}"
    install -Dm755 "$_pkgname-${pkgver}-linux.AppImage"                 "${pkgdir}/opt/$_upkgname/$_upkgname.AppImage"
    install -Dm644 "$_upkgname.desktop"                                 "${pkgdir}/usr/share/applications/$_upkgname.desktop"
    install -Dm644 "usr/share/icons/hicolor/0x0/apps/$_upkgname.png"    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/$_upkgname.png"
    mkdir "${pkgdir}/usr/bin"
    ln -s "/opt/$_upkgname/$_upkgname.AppImage" "${pkgdir}/usr/bin/$_upkgname"
    install -Dm644 LICENSE.electron.txt                                 "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron.txt"
    install -Dm644 LICENSES.chromium.html                               "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}
