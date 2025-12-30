# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

_pkgname=Trezor-Suite
_upkgname=trezor-suite
pkgname=trezor-suite-appimage
pkgver=25.12.2
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
sha256sums=('c85ea9d183ee8792727834bdfa34ee2cf787e38328982009b6b92e1b0fe0d077'
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
