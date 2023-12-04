# Maintainer: Maarten de Boer <info@maartendeboer.net>

pkgname=httpie-desktop-bin
_pkgname=httpie-desktop
pkgver=2023.3.6
pkgrel=1
pkgdesc="HTTPie for Desktop"
arch=(x86_64 aarch64)
url="https://httpie.io/product"
license=('custom')
depends=('gtk3' 'alsa-lib' 'nss')
builddepends=('fuse2')
provides=('httpie-desktop')
conflicts=('httpie-desktop-appimage')

source_x86_64=("https://github.com/httpie/desktop/releases/download/v$pkgver/HTTPie-$pkgver.AppImage")
source_aarch64=("https://github.com/httpie/desktop/releases/download/v$pkgver/HTTPie-$pkgver-arm64.AppImage")

sha256sums_x86_64=('0070f765b5737cc42d6294d6dc5bba232a38d7ff01e0729915f35459a6cb08e3')
sha256sums_aarch64=('4f9d9908195b382a9981371de7e9083873f43eecb44d0279b23f5a541a52ed38')

[ $CARCH = "x86_64" ] && _filename=HTTPie-$pkgver.AppImage
[ $CARCH = "aarch64" ] && _filename=HTTPie-$pkgver-arm64.AppImage

prepare() {
    cd "${srcdir}"

    chmod +x $_filename
    ./${_filename} --appimage-extract
}

build() {
    cd "${srcdir}"

    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=0 APPIMAGELAUNCHER_DISABLE=1 /usr/bin/httpie-desktop|" squashfs-root/httpie.desktop
    chmod -R a-x+rX squashfs-root/usr squashfs-root/locales squashfs-root/resources
}

package() {
    cd "${srcdir}"

     # Install icons
     for size in 16x16 32x32 64x64 128x128 256x256 512x512 1024x1024; do
        install -Dm644 "squashfs-root/usr/share/icons/hicolor/${size}/apps/httpie.png" -t "${pkgdir}/usr/share/icons/hicolor/${size}/apps"
     done

    # Install desktop file
    install -Dm644 "squashfs-root/httpie.desktop" -t "${pkgdir}/usr/share/applications"

    # Install licenses
    install -Dm644 "squashfs-root/LICENSE.electron.txt" -t "${pkgdir}/usr/share/licenses/${_pkgname}"
    install -Dm644 "squashfs-root/LICENSES.chromium.html" -t "${pkgdir}/usr/share/licenses/${_pkgname}"

    # Install files
    install -dm755 "${pkgdir}/usr/lib/${_pkgname}"

    cp -R "${srcdir}"/squashfs-root/* "${pkgdir}/usr/lib/${_pkgname}"

    rm -Rf "${pkgdir}/usr/lib/${_pkgname}/usr"
    rm -Rf "${pkgdir}/usr/lib/${_pkgname}/httpie.png"

    # Create symlink to /usr/bin
    install -dm755 "${pkgdir}/usr/bin"

    ln -s "/usr/lib/${_pkgname}/httpie" "${pkgdir}/usr/bin/${_pkgname}" 
}
