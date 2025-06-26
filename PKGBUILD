# Maintainer: Zadkiel <hello@zadkiel.fr>
# Repository: https://github.com/aslafy-z/aur-packages

pkgname=kftray-appimage
pkgver=0.19.0
pkgrel=1
pkgdesc='kubectl port forward manager, with support for UDP and proxy connections through k8s clusters'
arch=('x86_64' 'aarch64')
url='https://github.com/aslafy-z/aur-packages'
license=('GPL3')
options=('!strip')
provides=(kftray)
conflicts=(kftray)
source_x86_64=("kftray.AppImage::https://github.com/hcavarsan/kftray/releases/download/v${pkgver}/kftray_${pkgver}_amd64.AppImage")
source_aarch64=("kftray.AppImage::https://github.com/hcavarsan/kftray/releases/download/v${pkgver}/kftray_${pkgver}_aarch64.AppImage")
sha256sums_x86_64=('15c1556630fc0954c4656ba3d71c64eded0dade49ea87f87191b03fe65822862')
sha256sums_aarch64=('9a0a764e112e54207bbed91fd7bfec3f1c6059e6b8d42f3511a62d0894247448')

prepare() {
    chmod u+x "${srcdir}/kftray.AppImage"
    ./kftray.AppImage --appimage-extract > /dev/null
}

build() {
    sed -i "s/^Exec=AppRun$/Exec=${pkgname}/" "${srcdir}/squashfs-root/kftray.desktop"
}

package() {
    install -d -m755 "${pkgdir}/usr/share/icons"
    install -d -m755 "${pkgdir}/usr/share/applications"
    install -d -m755 "${pkgdir}/usr/bin"

    find "${srcdir}/squashfs-root/usr/share/icons" -type f -printf "%P\n" | while read -r file; do
        install -D -m644 "${srcdir}/squashfs-root/usr/share/icons/$file" "${pkgdir}/usr/share/icons/$file"
    done

    install -D -m644 "${srcdir}/squashfs-root/usr/share/applications/kftray.desktop" \
        "${pkgdir}/usr/share/applications/kftray.desktop"

    install -D -m755 "${srcdir}/kftray.AppImage" "${pkgdir}/usr/bin/kftray"

    rm -r "${srcdir}/squashfs-root"
}
