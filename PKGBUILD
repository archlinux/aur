# Maintainer: kjxbyz

# Note:
# using the .deb instead of the .tar.gz as it already contains the icons as well as the .desktop file.

pkgname=picguard-bin
pkgver=2.5.0
pkgrel=443
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
sha256sums_x86_64=('1cb89b499009fc8bae8a96bd0e70195337a5fe6b19fd518099474d2cc715a36d')
sha256sums_aarch64=('4242caec80afeb443b0809dda0ca142e9bdfe7d06cf620b24d61421cde13a532')
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
