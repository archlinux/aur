# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# BitBox-wallet-app-appimage: The BitBox wallet App in an AppImage.
# Based on https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=upwork-appimage

_pkgname=bitbox
_upkgname=BitBox
pkgname=bitbox-wallet-app-appimage
pkgver=4.14.0
pkgrel=1
pkgdesc="BitBox cryptocurrency hardware wallet desktop app with Bitcoin, Segwit, Bech32 and native Litecoin support in an AppImage"
arch=('x86_64')
url="https://shiftcrypto.ch/"
license=('Apache')
depends=('hicolor-icon-theme' 'zlib' 'bitbox-udev')
makedepends=('p7zip')
noextract=("$_pkgname-$pkgver.AppImage")
options=('!strip')
validpgpkeys=('2260E48288882C76AFAA319D67A2B160F74DB275')

source=("https://github.com/digitalbitbox/bitbox-wallet-app/releases/download/v$pkgver/$_upkgname-$pkgver-$arch.AppImage"{,.asc}
	"bitbox.svg"
	"https://raw.githubusercontent.com/digitalbitbox/bitbox-wallet-app/master/LICENSE")
sha256sums=('57ef4289096dc12e84ecfffe97f682bc56c9e5dc59bf12a4bf16c897df1cfee2'
            'SKIP'
            'd6ca9430782d88b6bc80450ad8a2781c208aa5bda9f90e22a4659c9dc7975f25'
            '5c8734e5f8c33fecdd15ceb9dfedbf44d9b6a4663c9f351cdbf4626cce778879')
prepare() {
    cd "${srcdir}"
    7z x "${srcdir}/$_upkgname-$pkgver-$CARCH.AppImage" $_pkgname.desktop
    sed -i 's/default/bitbox/' $_pkgname.desktop
    sed -i 's/Exec=BitBox/Exec=\/opt\/BitBox\/BitBox.AppImage/' $_pkgname.desktop
}

package() {
    cd "${srcdir}"
    install -Dm755 "$_upkgname-${pkgver}-${arch}.AppImage" "${pkgdir}/opt/$_upkgname/$_upkgname.AppImage"
    install -Dm644 "$_pkgname.desktop"                     "${pkgdir}/usr/share/applications/$_pkgname.desktop"
    install -Dm644 "$_pkgname.svg"                         "${pkgdir}/usr/share/icons/hicolor/128x128/apps/$_pkgname.png"
    mkdir "${pkgdir}/usr/bin"
    ln -s "/opt/$_upkgname/$_upkgname.AppImage" "${pkgdir}/usr/bin/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
