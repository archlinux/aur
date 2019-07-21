# Maintainer: Zadkiel <hello@zadkiel.fr>
# Repository: https://github.com/aslafy-z/aur-wexond-appimage
# TODO: Install license file
# TODO: Re-enable sandbox

pkgname=wexond-appimage
pkgver=2.2.3
pkgrel=1
pkgdesc='A privacy-focused, extensible and beautiful web browser'
arch=('i686' 'x86_64')
url='https://github.com/wexond/wexond'
license=('GPL')
options=('!strip')
provides=(wexond)
conflicts=(wexond)
source=('wexond.sh')
source_i686=("wexond-${pkgver}.AppImage::https://github.com/wexond/wexond/releases/download/v${pkgver}/wexond-${pkgver}-i386.AppImage")
source_x86_64=("wexond-${pkgver}.AppImage::https://github.com/wexond/wexond/releases/download/v${pkgver}/wexond-${pkgver}-x86_64.AppImage")
sha256sums=(SKIP)
sha256sums_i686=('6810f89c1af92eab502c3be5e9d93d3c2be4f8fea2e699cd72c8693cace30c84')
sha256sums_x86_64=('ea1906f136c154520e7bc599e2ab6fd439ca74ef473e49f4e454930d8faf6619')

prepare() {
    chmod u+x "${srcdir}/wexond-${pkgver}.AppImage"
    ./wexond-${pkgver}.AppImage --appimage-extract 2> /dev/null
}

build() {
    sed -i "s/^Exec=AppRun$/Exec=${pkgname}/" "${srcdir}/squashfs-root/wexond.desktop"
    sed -i "s/\${pkgver}/${pkgver}/" "${srcdir}/wexond.sh"
}

package() {
    install -d -m755 "${pkgdir}/usr/share/icons/hicolor"
    install -d -m755 "${pkgdir}/opt/appimages"

    install -d -m755 "${pkgdir}/usr/share/icons/hicolor/0x0/apps"
    install -D -m644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/wexond.png" "${pkgdir}/usr/share/icons/hicolor/0x0/apps/wexond.png"

    install -D -m644 "${srcdir}/squashfs-root/wexond.desktop" "${pkgdir}/usr/share/applications/appimagekit-wexond.desktop"
    install -D -m755 "${srcdir}/wexond.sh" "${pkgdir}/usr/bin/wexond"
    install -D -m755 "${srcdir}/wexond-${pkgver}.AppImage" "${pkgdir}/opt/appimages/wexond-${pkgver}.AppImage"
    rm -r "${srcdir}/squashfs-root"
}