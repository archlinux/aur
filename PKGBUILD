# Maintainer: Maarten de Boer <info@maartendeboer.net>

pkgname=httpie-desktop-bin
_pkgname=httpie-desktop
pkgver=2023.1.1
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

sha256sums_x86_64=('67c2b3820ec7398675d6bf1b23f985fd3e965815e249487ecad2d176ec8d50a2')
sha256sums_aarch64=('7d944453ea781412af87c6457beba482faad140cfa97aa50007108c5a552ac4d')

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
