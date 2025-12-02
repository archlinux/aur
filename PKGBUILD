# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

_pkgname=Trezor-Suite
_upkgname=trezor-suite
pkgname=trezor-suite-appimage
pkgver=25.11.3
pkgrel=1
pkgdesc="desktop app for Trezor hardware wallets"
arch=('x86_64' 'arm64')
url="https://suite.trezor.io/"
license=('custom:Trezor Reference Source License')
depends=('hicolor-icon-theme' 'fuse' 'trezor-udev' 'gtk3' 'nss')
noextract=("$_pkgname-$pkgver.AppImage")
options=(!strip)
validpgpkeys=('EB483B26B078A4AA1B6F425EE21B6950A2ECB65C')

source=("https://github.com/trezor/trezor-suite/releases/download/v$pkgver/$_pkgname-$pkgver-linux-$arch.AppImage"{,.asc})
sha256sums=('6ad1d48ce14f2dad879c86737bbfbc9e27d3afa5e6916f2fb295f6331bd1fbc3'
            'SKIP')

prepare() {
    cd "${srcdir}"
    chmod +x "${srcdir}/$_pkgname-$pkgver-linux-$arch.AppImage"
    "${srcdir}/$_pkgname-$pkgver-linux-$arch.AppImage" --appimage-extract
    sed -i "s/Exec=AppRun/Exec=\/usr\/bin\/$_upkgname/" squashfs-root/$_upkgname.desktop
}

package() {
    cd "${srcdir}/squashfs-root"
    install -Dm755 "../$_pkgname-$pkgver-linux-$arch.AppImage"                  "${pkgdir}/opt/$_upkgname/$_upkgname.AppImage"
    install -Dm644 "$_upkgname.desktop"                                         "${pkgdir}/usr/share/applications/$_upkgname.desktop"
    install -Dm644 "usr/share/icons/hicolor/512x512/apps/$_upkgname.png"        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/$_upkgname.png"
    mkdir "${pkgdir}/usr/bin"
    ln -s "/opt/$_upkgname/$_upkgname.AppImage" "$pkgdir/usr/bin/$_upkgname"
    install -Dm644 LICENSE.electron.txt                                         "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron.txt"
    install -Dm644 LICENSES.chromium.html                                       "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}
