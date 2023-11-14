# Maintainer: getzze <getzze at gmail dot com>

pkgname=gnome-shell-extension-logo-menu
pkgver=21.4
_pkgname=Logomenu
_tag="281023"
pkgrel=0
pkgdesc='Quick access menu for the GNOME panel that help ease the workflow for newcomers and power users alike.'
arch=('any')
url="https://github.com/Aryan20/Logomenu"
license=('GPL2')
depends=('gnome-shell')
source=("${url}/archive/refs/tags/v${pkgver}_${_tag}.tar.gz")
sha256sums=('0ce0ab586c35129e7d4ae4ca4945a5ea31bc6c9760c4eb4a9d9dba6861f4fc42')

build() {
    cd "${_pkgname}-${pkgver}_${_tag}"
    make build
}

package() {
    cd "${_pkgname}-${pkgver}_${_tag}"

    local _uuid=logomenu@aryan_k

    # Install to prefix
    XDG_DATA_HOME="${pkgdir}/usr/share" gnome-extensions install "${_uuid}.shell-extension.zip"

    # Move settings schema to system schema dir and remove compiled schema (a
    # pacman hook generates those)
    install -d "${pkgdir}/usr/share/glib-2.0/"
    mv "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/schemas" \
        "${pkgdir}/usr/share/glib-2.0/"
    rm "${pkgdir}/usr/share/glib-2.0/schemas/gschemas.compiled"

    # Move local to system locale directory
    mv "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/locale" \
        "${pkgdir}/usr/share"

    install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

