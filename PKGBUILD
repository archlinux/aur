# Maintainer: kjxbyz

# Note:
# using the .deb instead of the .tar.gz as it already contains the icons as well as the .desktop file.

pkgname=picguard-bin
pkgver=1.1.0
pkgrel=440
pkgdesc='Your pictures, your signature'
url=https://github.com/picguard/picguard
arch=('x86_64' 'aarch64')
license=(GPL-3.0-only)
depends=(fuse2 xdg-user-dirs libayatana-appindicator)
conflicts=('picguard')
provides=('picguard')
options=(!debug)
source_x86_64=("${url}/releases/download/v${pkgver}+${pkgrel}/picguard_${pkgver}+${pkgrel}_linux_amd64.deb")
source_aarch64=("${url}/releases/download/v${pkgver}+${pkgrel}/picguard_${pkgver}+${pkgrel}_linux_aarch64.deb")
sha256sums_x86_64=('824e62e2011f39590ca5db42836dbd5e82145745afdeb61d322740cab12d7c77')
sha256sums_aarch64=('02c2b71ac8a75943b7c6c27c61ce25e74b441b63819a084240c58a638a23c6c5')
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
