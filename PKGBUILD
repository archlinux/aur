# Maintainer: kjxbyz

# Note:
# using the .deb instead of the .tar.gz as it already contains the icons as well as the .desktop file.

pkgname=picguard-pro-bin
pkgver=4.0.2
pkgrel=0
pkgdesc='Your pictures, your signature'
url=https://github.com/picguard/picguard
arch=('x86_64' 'aarch64')
license=(GPL-3.0-only)
depends=(fuse2 xdg-user-dirs libayatana-appindicator)
conflicts=('picguard-pro')
provides=('picguard-pro')
options=(!debug)
source_x86_64=("${url}/releases/download/v${pkgver}/picguard-pro-${pkgver}-linux-amd64.deb")
source_aarch64=("${url}/releases/download/v${pkgver}/picguard-pro-${pkgver}-linux-aarch64.deb")
sha256sums_x86_64=('5fb6a20b63f15779b992033f2d0ee08bef2232889d1f54bca75d8340126ff2d9')
sha256sums_aarch64=('7dac79d3ebb3d02522dc9ce9031fcc855c30ac5ed564e808a68101f8784296e4')
_pkgdesktop="picguard-pro.desktop"

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
    # Dirty - rename icons to picguard-pro
    for res in "128x128" "256x256"; do
        mv "${pkgdir}/usr/share/icons/hicolor/${res}/apps/picguard-pro.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/picguard-pro.png"
    done

    # Executable
    install -dm755 "${pkgdir}/opt/${pkgname%-*}/"
    cp -a "${srcdir}/usr/share/picguard-pro/." "${pkgdir}/opt/${pkgname%-*}"
    # Same as icons - rename to picguard-pro
    # mv "${pkgdir}/opt/${pkgname%-*}/picguard-pro" "${pkgdir}/opt/${pkgname%-*}/picguard-pro"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s \
        "/opt/${pkgname%-*}/${pkgname%-*}" \
        "${pkgdir}/usr/bin/${pkgname%-*}"
}
