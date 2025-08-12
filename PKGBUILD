# Maintainer: kjxbyz

# Note:
# using the .deb instead of the .tar.gz as it already contains the icons as well as the .desktop file.

pkgname=dotdraw-bin
pkgver=0.0.1
pkgrel=0
pkgdesc='Ideas, Painting, Art'
url=https://github.com/dotdraw/dotdraw
arch=('x86_64' 'aarch64')
license=(GPL-3.0-only)
depends=(fuse2 xdg-user-dirs libayatana-appindicator)
conflicts=('dotdraw')
provides=('dotdraw')
options=(!debug)
source_x86_64=("${url}/releases/download/v${pkgver}/dotdraw-${pkgver}-linux-amd64.deb")
source_aarch64=("${url}/releases/download/v${pkgver}/dotdraw-${pkgver}-linux-aarch64.deb")
sha256sums_x86_64=('31ab11188d2350cf6fe631ecd5914ff2b4f26b24335fa7061152de1bed158831')
sha256sums_aarch64=('448e3cd6d3cd0dced30144bb4c2d1562de4bbf328661be8c016e19f165fe2125')
_pkgdesktop="dotdraw.desktop"

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
    # Dirty - rename icons to dotdraw
    for res in "128x128" "256x256"; do
        mv "${pkgdir}/usr/share/icons/hicolor/${res}/apps/dotdraw.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/dotdraw.png"
    done

    # Executable
    install -dm755 "${pkgdir}/opt/${pkgname%-*}/"
    cp -a "${srcdir}/usr/share/dotdraw/." "${pkgdir}/opt/${pkgname%-*}"
    # Same as icons - rename to dotdraw
    # mv "${pkgdir}/opt/${pkgname%-*}/dotdraw" "${pkgdir}/opt/${pkgname%-*}/dotdraw"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s \
        "/opt/${pkgname%-*}/${pkgname%-*}" \
        "${pkgdir}/usr/bin/${pkgname%-*}"
}
