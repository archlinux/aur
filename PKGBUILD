# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname='nunchuk-desktop-appimage'
_pkgname='nunchuk-desktop'
__pkgname='nunchuk-linux'
___pkgname='nunchuk'
pkgver=2.9.2
pkgrel=1
pkgdesc="Desktop bitcoin wallet with multisig, hardware, nfc and air-gapped key support"
arch=('x86_64')
url="https://nunchuk.io/"
license=('GPL3')
depends=('hicolor-icon-theme' 'zlib' 'fuse' 'gtk3')
makedepends=('p7zip')
optdepends=('bitbox-udev: Udev rules for Bitbox hardware wallet support'
            'keepkey-udev: Udev rules for Keepkey hardware wallet support'
#            'blockstream-jade-udev: Udev rules for Blockstream Jade hardware wallet support'
            'ledger-udev: Udev rules for Ledger hardware wallet support'
            'python-ckcc-protocol: Udev rules for Coinkite Coldcard hardware wallet support'
            'trezor-udev: Udev rules for Trezor hardware wallet support')
provides=('nunchuk-qt')
options=('!strip')
source=("https://github.com/nunchuk-io/$_pkgname/releases/download/$pkgver/$__pkgname-v$pkgver-$arch.AppImage")
sha256sums=('9a43ef728193d05c573d178f54cf977e0f7e07968557b59d2f58e93951e6142f')

#validpgpkeys=('8C8ECD3F660CA53CD878792A6E38A462ED2EF525') # Ta Tat Tai (Nunchuk binary release signing key) <tatattai@gmail.com>
#asc doesn't contain a detached signature, makepkg expects a detached signature

prepare() {
    cd "${srcdir}"
    chmod +x "${srcdir}/$__pkgname-v$pkgver-$arch.AppImage"
    "${srcdir}/$__pkgname-v$pkgver-$arch.AppImage" --appimage-extract usr/share/applications/nunchuk.desktop
    "${srcdir}/$__pkgname-v$pkgver-$arch.AppImage" --appimage-extract usr/share/icons/hicolor/128x128/apps/nunchuk-qt.png
}

package() {
    cd "${srcdir}/squashfs-root/"
    install -Dm755 "../$__pkgname-v$pkgver-$arch.AppImage"                      "${pkgdir}/opt/$_pkgname/$__pkgname.AppImage"
    install -Dm644 "usr/share/applications/$___pkgname.desktop"                "${pkgdir}/usr/share/applications/$___pkgname.desktop"
    install -Dm644 "usr/share/icons/hicolor/128x128/apps/$___pkgname-qt.png"   "${pkgdir}/usr/share/icons/hicolor/512x512/apps/$___pkgname-qt.png"
    mkdir "${pkgdir}/usr/bin"
    ln -s "/opt/$_pkgname/$__pkgname.AppImage"                                  "${pkgdir}/usr/bin/$___pkgname-qt"
}
