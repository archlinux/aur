# Maintainer: kjxbyz

# Note:
# using the .deb instead of the .tar.gz as it already contains the icons as well as the .desktop file.

pkgname=picguard-pro-bin
pkgver=5.7.2
pkgrel=481
pkgdesc='Your pictures, your signature'
url=https://github.com/picguard/picguard
arch=('x86_64' 'aarch64')
license=(GPL-3.0-only)
depends=(fuse2 xdg-user-dirs libayatana-appindicator)
conflicts=('picguard-pro')
provides=('picguard-pro')
options=(!debug)
source_x86_64=("${url}/releases/download/v${pkgver}.${pkgrel}/picguard-pro-${pkgver}.${pkgrel}-linux-amd64.deb")
source_aarch64=("${url}/releases/download/v${pkgver}.${pkgrel}/picguard-pro-${pkgver}.${pkgrel}-linux-aarch64.deb")
sha256sums_x86_64=('9468f15142bc65d96a4f32864a56402b63ca7624960d2168d8044c704dccef8b')
sha256sums_aarch64=('d0710aeacb8a6e65b364aa5993c2ce9fcffb5e8f23bfd11e735640eb4887d152')
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
    # /usr/share => /opt
    cp -a "${srcdir}/opt/picguard-pro/." "${pkgdir}/opt/${pkgname%-*}"
    # Same as icons - rename to picguard-pro
    # mv "${pkgdir}/opt/${pkgname%-*}/picguard-pro" "${pkgdir}/opt/${pkgname%-*}/picguard-pro"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s \
        "/opt/${pkgname%-*}/${pkgname%-*}" \
        "${pkgdir}/usr/bin/${pkgname%-*}"
}
