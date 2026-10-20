# Maintainer: Zadkiel AHARONIAN <hello@zadkiel.fr>
# Repository: https://github.com/aslafy-z/aur-packages

pkgname=kftray-appimage
pkgver=0.33.0 # renovate: datasource=github-releases depName=kftray packageName=hcavarsan/kftray
pkgrel=1
pkgdesc='kubectl port forward manager, with support for UDP and proxy connections through k8s clusters'
arch=('x86_64' 'aarch64')
url='https://github.com/aslafy-z/aur-packages'
license=('GPL-3.0-only')
options=('!strip' '!debug')
provides=(kftray)
depends=('hicolor-icon-theme')
conflicts=(kftray)
source_x86_64=("kftray-${pkgver}.AppImage::https://github.com/hcavarsan/kftray/releases/download/v${pkgver}/kftray_${pkgver}_amd64.AppImage")
source_aarch64=("kftray-${pkgver}.AppImage::https://github.com/hcavarsan/kftray/releases/download/v${pkgver}/kftray_${pkgver}_aarch64.AppImage")
sha256sums_x86_64=('7a640b538273ba9ac1fa80537a040d76b56d4a3137c6ce8ca54b2362681b49d2')
sha256sums_aarch64=('908ae92681b9c581899f13dad4402289a1b57a047470ec43ca26ab4ffadaebe6')

prepare() {
    chmod u+x "${srcdir}/kftray-${pkgver}.AppImage"
    ./kftray-${pkgver}.AppImage --appimage-extract > /dev/null
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

    install -D -m755 "${srcdir}/kftray-${pkgver}.AppImage" "${pkgdir}/usr/bin/kftray"

    rm -r "${srcdir}/squashfs-root"
}
