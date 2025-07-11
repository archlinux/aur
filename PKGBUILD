# Maintainer: kjxbyz

# Note:
# using the .deb instead of the .tar.gz as it already contains the icons as well as the .desktop file.

pkgname=picguard-bin
pkgver=4.0.0
pkgrel=452
pkgdesc='Your pictures, your signature'
url=https://github.com/picguard/picguard
arch=('x86_64' 'aarch64')
license=(GPL-3.0-only)
depends=(fuse2 xdg-user-dirs libayatana-appindicator)
conflicts=('picguard')
provides=('picguard')
options=(!debug)
source_x86_64=("${url}/releases/download/v${pkgver}+${pkgrel}/picguard-${pkgver}.${pkgrel}-linux-amd64.deb")
source_aarch64=("${url}/releases/download/v${pkgver}+${pkgrel}/picguard-${pkgver}.${pkgrel}-linux-aarch64.deb")
sha256sums_x86_64=('0ed8962c7c9e1c8f0b7ab40aca09e31e9843210007641b3005c8696d67db2ca1')
sha256sums_aarch64=('6c9f9c52cbed87991edf06df1e24015369e2a4608b2865315b0037013f43ae0c')
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
