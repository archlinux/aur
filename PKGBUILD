# Maintainer: getzze <getzze at gmail dot com>

pkgname=gnome-shell-extension-logo-menu
pkgver=21.8
_pkgname=Logomenu
_tag="211123"
pkgrel=1
pkgdesc='Quick access menu for the GNOME panel that help ease the workflow for newcomers and power users alike.'
arch=('any')
url="https://github.com/Aryan20/Logomenu"
license=('GPL2')
depends=('gnome-shell')
makedepends=('unzip')
source=("${url}/archive/refs/tags/v${pkgver}_${_tag}.tar.gz")
sha256sums=('410b92e40f6537958b9de87df19f0e5e6c4da951ef7cf285b9b6411b15895f81')

build() {
    cd "${_pkgname}-${pkgver}_${_tag}"
    make build
}

package() {
    cd "${_pkgname}-${pkgver}_${_tag}"

    local _uuid=logomenu@aryan_k

    # Install to prefix
    ## Does not always work because of bug: https://gitlab.gnome.org/GNOME/gnome-shell/-/issues/2821
    ##XDG_DATA_HOME="${pkgdir}/usr/share" gnome-extensions install "${_uuid}.shell-extension.zip"

    # Install to dest dir
    local _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
    install -d "${_destdir}"
    unzip ./"${_uuid}.shell-extension.zip" -d "${_destdir}"

    # Move settings schema to system schema dir and remove compiled schema (a
    # pacman hook generates those)
    install -d "${pkgdir}/usr/share/glib-2.0/"
    mv "${_destdir}/schemas" \
        "${pkgdir}/usr/share/glib-2.0/"
    rm "${pkgdir}/usr/share/glib-2.0/schemas/gschemas.compiled"

    # Move local to system locale directory
    mv "${_destdir}/locale" \
        "${pkgdir}/usr/share"

    install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

