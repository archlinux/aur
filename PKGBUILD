#!/usr/bin/env bash
# shellcheck disable=SC2034,SC2148,SC2154
#
# Maintainer: Toria <ninetailedtori@uwu.gal>
#
_pkgname=masterpdfeditor
pkgname="${_pkgname}-qt6"
pkgver=5.9.99
_patchver=''
pkgrel=1
pkgdesc='A complete solution for viewing, creating and editing PDF files.'
url='https://code-industry.net/free-pdf-editor/'
_checksum=$(curl 'https://code-industry.net/checksum-information/' | grep -oP '[a-f0-9]{40}(?=.*master-pdf-editor-'"${pkgver}${_patchver}"'-qt6.11.1.x86_64.tar.gz)')
_checksum=${checksum% *}
_checksum=${checksum:-f6e09030bca6bc16bebb34a494e90b63ab5df484}
arch=('x86_64')
license=('custom')
makedepends=(
    'curl'
    'patchelf'
)
provides=("${_pkgname}=${pkgver}")
conflicts=(
    "${_pkgname}-qt_include"
    "${_pkgname}-qt5"
)
depends=(
    'libgl'
    'pkcs11-helper'
    'sane'
    'qt6-base'
    'qt6-svg'
    'qt6-declarative'
    'qt6-5compat'
    'xcb-util-image'
    'xcb-util-keysyms'
    'xcb-util-renderutil'
    'xcb-util-wm'
    'glibc>=2.28'
)
source_x86_64=(
    "https://code-industry.net/public/master-pdf-editor-${pkgver}${_patchver}-qt6.11.1.x86_64.tar.gz"
)
sha1sums_x86_64=(
    "${_checksum}"
)

package() {
    # Move all required files to opt/masterpdfeditor
    install -d \
        "${pkgdir}/opt"
    install -d \
        "${pkgdir}/usr/bin"
    cp      -a --no-preserve=ownership  \
        "master-pdf-editor-${pkgver%%.*}" \
        "${pkgdir}/opt/${_pkgname}"

    # Finally, the application extras, such as launcher
    cd "${pkgdir}/opt/${_pkgname}" || return 1

    # Link it to /usr/bin for a PATHed binary.
    ln -sfv '/opt/masterpdfeditor/masterpdfeditor5' "${pkgdir}/usr/bin/masterpdfeditor"

    # Patch the desktop to use usr/bin launcher
    sed -i \
        -e 's|^Exec=.*|Exec=/usr/bin/masterpdfeditor %f|' \
        -e 's|^Path=.*|Path=/opt/masterpdfeditor|' \
        -e 's|^Icon=.*|Icon=/opt/masterpdfeditor/masterpdfeditor5.png|' \
        "${_pkgname}${pkgver%%.*}.desktop"

    # Install all the files.
    install -Dm644 \
        "${_pkgname}${pkgver%%.*}.desktop" \
        -t "${pkgdir}/usr/share/applications/"
    install -Dm644 \
        'license_en.txt' \
        -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
