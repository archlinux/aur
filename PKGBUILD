# Maintainer: Zadkiel AHARONIAN <hello@zadkiel.fr>
# Repository: https://github.com/aslafy-z/aur-packages

pkgname=kftray-appimage
pkgver=0.27.32 # renovate: datasource=github-releases depName=kftray packageName=hcavarsan/kftray
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
sha256sums_x86_64=('b2404dc3282a9e953f24d8bd645b95c7f4400e885e3c0bf4df46e9f34c306495')
sha256sums_aarch64=('0bac98838318ef308e8490ea35ee1629d3ca0195dad6c37c0828f6972dbe79b1')

prepare() {
    chmod u+x "${srcdir}/kftray.AppImage"
    ./kftray.AppImage --appimage-extract > /dev/null
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
