# Maintainer: Zadkiel AHARONIAN <hello@zadkiel.fr>
# Repository: https://github.com/aslafy-z/aur-packages

pkgname=kftray-appimage
pkgver=0.31.0 # renovate: datasource=github-releases depName=kftray packageName=hcavarsan/kftray
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
sha256sums_x86_64=('daf73e1edd4dce216a343c0131f0d724b5d1f68a6b851a7a5712fb4457f3dfcb')
sha256sums_aarch64=('2240bbc98d4e9333fec02b34593eb549fb37b3039cb846350716ff35a9b13de4')

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
