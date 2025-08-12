# Maintainer: kjxbyz

# Note:
# using the .deb instead of the .tar.gz as it already contains the icons as well as the .desktop file.

pkgname=yixee-bin
pkgver=0.0.1
pkgrel=0
pkgdesc='Memories live on — with Yixee'
url=https://github.com/yixee/yixee
arch=('x86_64' 'aarch64')
license=(GPL-3.0-only)
depends=(fuse2 xdg-user-dirs libayatana-appindicator)
conflicts=('yixee')
provides=('yixee')
options=(!debug)
source_x86_64=("${url}/releases/download/v${pkgver}/yixee-${pkgver}-linux-amd64.deb")
source_aarch64=("${url}/releases/download/v${pkgver}/yixee-${pkgver}-linux-aarch64.deb")
sha256sums_x86_64=('918fdf7698f8acc50e86872998cc960f5624ded2452311e23e8e6b3899710804')
sha256sums_aarch64=('067c9f8fddf1e6a34fa5229758c54b9ef62b67ea258b93c02d3d993c3e925687')
_pkgdesktop="yixee.desktop"

prepare() {
    tar -xf data.tar.zst
}

build() {
    sed -i -E '/^Version=/d' "${srcdir}/usr/share/applications/${_pkgdesktop}"
}

package() {
    # Desktop
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgdesktop}" "${pkgdir}/usr/share/applications/${pkgname%-*}.desktop"

    # Icons
    install -dm644 "${pkgdir}/usr/share/icons/"
    cp -a "${srcdir}/usr/share/icons" "${pkgdir}/usr/share"
    # Dirty - rename icons to yixee
    for res in "128x128" "256x256"; do
        mv "${pkgdir}/usr/share/icons/hicolor/${res}/apps/yixee.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/yixee.png"
    done

    # Executable
    install -dm755 "${pkgdir}/opt/${pkgname%-*}/"
    cp -a "${srcdir}/usr/share/yixee/." "${pkgdir}/opt/${pkgname%-*}"
    # Same as icons - rename to yixee
    # mv "${pkgdir}/opt/${pkgname%-*}/yixee" "${pkgdir}/opt/${pkgname%-*}/yixee"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s \
        "/opt/${pkgname%-*}/${pkgname%-*}" \
        "${pkgdir}/usr/bin/${pkgname%-*}"
}
