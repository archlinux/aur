# Maintainer: kjxbyz

# Note:
# using the .deb instead of the .tar.gz as it already contains the icons as well as the .desktop file.

pkgname=picguard-pro-bin
pkgver=5.7.0
pkgrel=479
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
sha256sums_x86_64=('be7d2245ecb882c973abec80f345a690e7452e4cb86fafd7d53f4f58d6d0267f')
sha256sums_aarch64=('e128df6a1c81676e0b7aab0924c62b56e774355dd7b05d9c90fd71bb67edc2e3')
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
