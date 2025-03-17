# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor: Maarten de Boer <info@maartendeboer.net>
# Contribuor: Ivan Shapovalov <intelfx@intelfx.name>

pkgname=httpie-desktop-bin
_pkgname=httpie-desktop
pkgver=2025.2.0
pkgrel=1
pkgdesc="HTTPie for Desktop"
arch=(x86_64 aarch64)
url="https://httpie.io/product"
license=('custom')
depends=('gtk3' 'alsa-lib' 'nss')
builddepends=('fuse2')
provides=('httpie-desktop')
conflicts=('httpie-desktop-appimage')

source=(httpie-desktop)
source_x86_64=("https://github.com/httpie/desktop/releases/download/v$pkgver/HTTPie-$pkgver.AppImage")
source_aarch64=("https://github.com/httpie/desktop/releases/download/v$pkgver/HTTPie-$pkgver-arm64.AppImage")

sha256sums=('42d9b50040669f0957cd70164f571cc764389f1c5804579de908ec18c90c0c91')
sha256sums_x86_64=('a850e215741b60087079086061f656fe550cb66c34f6da93f6dfc63c946d654f')
sha256sums_aarch64=('141ce3958c200942e08da2543c02e5aaa463edf64ca6cee1c9bb799b9124780a')

[ $CARCH = "x86_64" ] && _filename=HTTPie-$pkgver.AppImage
[ $CARCH = "aarch64" ] && _filename=HTTPie-$pkgver-arm64.AppImage

prepare() {
    cd "${srcdir}"

    chmod +x $_filename
    ./${_filename} --appimage-extract
}

build() {
    cd "${srcdir}"

    sed -i -E "s|Exec=AppRun|Exec=/usr/bin/httpie-desktop|" squashfs-root/httpie.desktop
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

    # Install the launcher to /usr/bin
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
