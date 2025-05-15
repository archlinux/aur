# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname=specter-desktop-appimage
pkgver=2.0.5
_upkgname=Specter
_lpkgname=specter
_pkgname="${_lpkgname}_desktop"
__pkgname="${_lpkgname}-desktop"
_appimage="${_upkgname}-${pkgver}.AppImage"
pkgrel=1
pkgdesc="A desktop GUI for Bitcoin Core optimised to work with hardware wallets"
arch=('x86_64')
url="https://github.com/cryptoadvance/specter-desktop"
license=('MIT')
depends=('hicolor-icon-theme' 'zlib' 'fuse' 'gtk3')
makedepends=('p7zip')
noextract=("$_pkgname-$pkgver.AppImage")
options=('!strip' '!debug')

source=("https://github.com/cryptoadvance/$__pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver-$arch-linux-gnu.tar.gz"
        "specter.png"
        "https://raw.githubusercontent.com/cryptoadvance/specter-desktop/refs/heads/master/LICENSE")
sha256sums=('8a187c4710085186e2618ef181e6d9d91e8d2175975055ef3724c187e977e991'
            'ad1bd497b7fb631cbc161bd559596e0f47df926caa4698190197c127b756900f'
            'a230039985e2c4a8b522399e82b3ff6d74b1d0ff9629ec4c56aad7a5a68f0af5')

prepare() {
	cd "${srcdir}"
	chmod +x ${_appimage}
	./${_appimage} --appimage-extract ${_lpkgname}.desktop
	./${_appimage} --appimage-extract usr/share/icons
	cd squashfs-root
	sed -i \
		-e "s|Exec=AppRun|Exec=/usr/bin/${_upkgname}|" \
		-e "s|Categories=Utility;|Categories=Office;Finance;|" \
		"${_lpkgname}.desktop"
}

package() {
    cd "${srcdir}"
    install -Dm755 "$_upkgname-$pkgver.AppImage"  "${pkgdir}/opt/$__pkgname/$_upkgname-$pkgver.AppImage"
    install -Dm644 "$_lpkgname.png"               "${pkgdir}/usr/share/icons/hicolor/512x512/apps/$_lpkgname.png"
    install -Dm644 "LICENSE"                      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cd squashfs-root
    install -Dm644 "$_lpkgname.desktop"           "${pkgdir}/usr/share/applications/$_lpkgname.desktop"
    install -Dm644 "usr/share/icons/hicolor/0x0/apps/$_lpkgname.png" "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/$_lpkgname.png"
    mkdir "${pkgdir}/usr/bin"
    ln -s "/opt/$__pkgname/$_appimage"            "${pkgdir}/usr/bin/$_upkgname"
}
