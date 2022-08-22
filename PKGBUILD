# Maintainer: Maarten de Boer <info@maartendeboer.net>

pkgname=httpie-desktop-bin
_pkgname=httpie-desktop
pkgver=2022.12.0
pkgrel=1
pkgdesc="HTTPie for Desktop"
arch=(x86_64 aarch64)
url="https://httpie.io/product"
license=('unknown')
depends=('gtk3' 'alsa-lib' 'nss')
builddepends=('fuse2')
provides=('httpie-desktop')
conflicts=('httpie-desktop-appimage')

source_x86_64=("https://github.com/httpie/desktop/releases/download/v$pkgver/HTTPie-$pkgver.AppImage")
source_aarch64=("https://github.com/httpie/desktop/releases/download/v$pkgver/HTTPie-$pkgver-arm64.AppImage")
b2sums_x86_64=('5feb1cf600a54fcb45e7bc9abd601adf355e803b1fe36ee50560e83728bd18528b90ed17cea39ecb9aa8cb7c089cffba389f078e4e31def09e0a1232d47df9bf')
b2sums_aarch64=('250ae5db12bff10e3bb293d5672dabf7f17325bd0367721751e294d198737e51dc61497b8ecbb7baf3cb6f602f58d9790b0cb512b9391268c2ee5b390c0aabcb')

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
        install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/${size}/apps" "squashfs-root/usr/share/icons/hicolor/${size}/apps/httpie.png"
     done

    # Install desktop file
    install -Dm644 -t "${pkgdir}/usr/share/applications" "squashfs-root/httpie.desktop"

    # Install licenses
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" "squashfs-root/LICENSE.electron.txt" "squashfs-root/LICENSES.chromium.html"
    rm -f squashfs-root/LICENSE*

    # Install files
    install -dm755 "${pkgdir}/opt/${_pkgname}"
    cp -R "${srcdir}"/squashfs-root/* "${pkgdir}/opt/${_pkgname}"
    rm -Rf "${pkgdir}/opt/${_pkgname}/usr" "${pkgdir}/opt/${_pkgname}/httpie.png"

    # Create symlink to /usr/bin
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/httpie" "${pkgdir}/usr/bin/${_pkgname}" 
}
