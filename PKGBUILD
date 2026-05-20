# Maintainer: kjxbyz

# Note:
# using the .deb instead of the .tar.gz as it already contains the icons as well as the .desktop file.

pkgname=fafarunner-bin
pkgver=3.0.0
pkgrel=0
pkgdesc='Enjoy smooth gameplay, stunning graphics, and endless fun'
url=https://github.com/fafarunner/fafarunner
arch=('x86_64' 'aarch64')
license=(MIT)
depends=(fuse2 xdg-user-dirs libayatana-appindicator)
conflicts=('fafarunner')
provides=('fafarunner')
options=(!debug)
source_x86_64=("${url}/releases/download/v${pkgver}/fafarunner-${pkgver}-linux-amd64.deb")
source_aarch64=("${url}/releases/download/v${pkgver}/fafarunner-${pkgver}-linux-aarch64.deb")
sha256sums_x86_64=('b09d2ba7a143de5d99abd578920a2888a5016870f658dae345a2e1de0be2d3f0')
sha256sums_aarch64=('bdc8fce156d5e9a6e3d908a2cbdeeb901f07e570ee28cbae07d75dcb73396ebe')
_pkgdesktop="fafarunner.desktop"

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
    # Dirty - rename icons to fafarunner
    for res in "128x128" "256x256"; do
        mv "${pkgdir}/usr/share/icons/hicolor/${res}/apps/fafarunner.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/fafarunner.png"
    done

    # Executable
    install -dm755 "${pkgdir}/opt/${pkgname%-*}/"
    cp -a "${srcdir}/usr/share/fafarunner/." "${pkgdir}/opt/${pkgname%-*}"
    # Same as icons - rename to fafarunner
    # mv "${pkgdir}/opt/${pkgname%-*}/fafarunner" "${pkgdir}/opt/${pkgname%-*}/fafarunner"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s \
        "/opt/${pkgname%-*}/${pkgname%-*}" \
        "${pkgdir}/usr/bin/${pkgname%-*}"
}
