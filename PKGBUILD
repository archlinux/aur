# Maintainer: kjxbyz

# Note:
# using the .deb instead of the .tar.gz as it already contains the icons as well as the .desktop file.

pkgname=toolora-bin
pkgver=0.0.1
pkgrel=0
pkgdesc='All the tools. One Toolora'
url=https://github.com/toolora/toolora
arch=('x86_64' 'aarch64')
license=(GPL-3.0-only)
depends=(fuse2 xdg-user-dirs libayatana-appindicator)
conflicts=('toolora')
provides=('toolora')
options=(!debug)
source_x86_64=("${url}/releases/download/v${pkgver}/toolora-${pkgver}-linux-amd64.deb")
source_aarch64=("${url}/releases/download/v${pkgver}/toolora-${pkgver}-linux-aarch64.deb")
sha256sums_x86_64=('89403c2e288a2cafe67e60df89da82becc04048388150f1789ca4372ace34cbb')
sha256sums_aarch64=('1220403905219a5cd7f575a0df03f8db26ed48caf5f43d79a6222e44566439fb')
_pkgdesktop="toolora.desktop"

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
    # Dirty - rename icons to toolora
    for res in "128x128" "256x256"; do
        mv "${pkgdir}/usr/share/icons/hicolor/${res}/apps/toolora.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/toolora.png"
    done

    # Executable
    install -dm755 "${pkgdir}/opt/${pkgname%-*}/"
    cp -a "${srcdir}/usr/share/toolora/." "${pkgdir}/opt/${pkgname%-*}"
    # Same as icons - rename to toolora
    # mv "${pkgdir}/opt/${pkgname%-*}/toolora" "${pkgdir}/opt/${pkgname%-*}/toolora"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s \
        "/opt/${pkgname%-*}/${pkgname%-*}" \
        "${pkgdir}/usr/bin/${pkgname%-*}"
}
