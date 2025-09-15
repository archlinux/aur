# Maintainer: kjxbyz

# Note:
# using the .deb instead of the .tar.gz as it already contains the icons as well as the .desktop file.

pkgname=picguard-bin
pkgver=5.0.1
pkgrel=0
pkgdesc='Your pictures, your signature'
url=https://github.com/picguard/picguard
arch=('x86_64' 'aarch64')
license=(GPL-3.0-only)
depends=(fuse2 xdg-user-dirs libayatana-appindicator)
conflicts=('picguard')
provides=('picguard')
options=(!debug)
source_x86_64=("${url}/releases/download/v${pkgver}/picguard-${pkgver}-linux-amd64.deb")
source_aarch64=("${url}/releases/download/v${pkgver}/picguard-${pkgver}-linux-aarch64.deb")
sha256sums_x86_64=('8d973d23b405c540a96f06ca180285814dafef1fa3d5c03d5c560995fd621400')
sha256sums_aarch64=('4b7d43d5db119b170afcaf2a6214c7e6ebd15ed196b7d98d78eb3a02b1d0ee50')
_pkgdesktop="picguard.desktop"

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
    # Dirty - rename icons to picguard
    for res in "128x128" "256x256"; do
        mv "${pkgdir}/usr/share/icons/hicolor/${res}/apps/picguard.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/picguard.png"
    done

    # Executable
    install -dm755 "${pkgdir}/opt/${pkgname%-*}/"
    cp -a "${srcdir}/usr/share/picguard/." "${pkgdir}/opt/${pkgname%-*}"
    # Same as icons - rename to picguard
    # mv "${pkgdir}/opt/${pkgname%-*}/picguard" "${pkgdir}/opt/${pkgname%-*}/picguard"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s \
        "/opt/${pkgname%-*}/${pkgname%-*}" \
        "${pkgdir}/usr/bin/${pkgname%-*}"
}
