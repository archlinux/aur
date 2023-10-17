# Maintainer: getzze <getzze at gmail dot com>

pkgname=gnome-shell-extension-logo-menu
pkgver=20
_pkgname=Logomenu
_tag="0_230923"
pkgrel=0
pkgdesc='Quick access menu for the GNOME panel that help ease the workflow for newcomers and power users alike.'
arch=('any')
url="https://github.com/Aryan20/Logomenu"
license=('GPL2')
depends=('gnome-shell')
source=("${url}/archive/refs/tags/v${pkgver}.${_tag}.tar.gz")
sha256sums=('aaaddb3b9e1065dcbc3a4437056f582bf9d8e92970d76b2d93905960d924084a')

build() {
    cd "${_pkgname}-${pkgver}.${_tag}"
    make build
}

package() {
    cd "${_pkgname}-${pkgver}.${_tag}"

    local _uuid=logomenu@aryan_k

    install -d \
        "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}" \
        "${pkgdir}/usr/share/glib-2.0/"

    # Extract extension artifact to system extension directory.
    bsdtar -xvf "${_uuid}.shell-extension.zip" \
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

