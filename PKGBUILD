# Maintainer: Zadkiel AHARONIAN <hello@zadkiel.fr>
# Repository: https://github.com/aslafy-z/aur-packages

pkgname=kftray-appimage
pkgver=0.28.0 # renovate: datasource=github-releases depName=kftray packageName=hcavarsan/kftray
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
sha256sums_x86_64=('da56fea668eab0c82a56d344bc241d70771e96dccd87454f69e928a7c2122bd8')
sha256sums_aarch64=('a64ec7513375f18554063f9b4795443fa6bd1e50a866249a8e4b609b5e3ed89b')

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
