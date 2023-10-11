# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>
# Contributor: Robin Candau <antiz@archlinux.org>

pkgname=gnome-shell-extension-caffeine
pkgver=50
pkgrel=4
epoch=1
pkgdesc='Extension for GNOME shell to disable screensaver and auto suspend'
arch=('any')
url="https://github.com/eonpatapon/gnome-shell-extension-caffeine"
license=('GPL2')
depends=('gnome-shell')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('ff4a3e938165e032e04a28d4430a85eec3f5c4c9ae0000dc24a2cc4e16da980a')

build() {
    cd "${pkgname}-${pkgver}"
    make build
}

package() {
    cd "${pkgname}-${pkgver}"

    local _uuid=caffeine@patapon.info

    install -d \
        "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}" \
        "${pkgdir}/usr/share/glib-2.0/"

    # Extract extension artifact to system extension directory.
    bsdtar -xvf "${_uuid}.zip" \
        -C "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}" \
        --no-same-owner

    # Move settings schema to system schema dir and remove compiled schema (a
    # pacman hook generates those)
    mv "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/schemas" \
        "${pkgdir}/usr/share/glib-2.0/"
    rm "${pkgdir}/usr/share/glib-2.0/schemas/gschemas.compiled"

    # Move local to system locale directory
    mv "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/locale" \
        "${pkgdir}/usr/share"

    install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
