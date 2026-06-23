#!/usr/bin/env bash
# shellcheck disable=SC2034,SC2148,SC2154
#
# Maintainer: Toria <ninetailedtori@uwu.gal>
#
_pkgname=masterpdfeditor
pkgname=${_pkgname}-qt5
pkgver=5.9.98
_patchver='-1'
_armpatchver=''
pkgrel=2
pkgdesc='A complete solution for viewing, creating and editing PDF files (qt5 version).'
url='https://code-industry.net/free-pdf-editor/'
_checksum_x86_64=$(curl 'https://code-industry.net/checksum-information/' | grep -oP '[a-f0-9]{40}(?=.*master-pdf-editor-'"${pkgver}${_patchver}"'-qt5.x86_64.tar.gz)')
_checksum_aarch64=$(curl 'https://code-industry.net/checksum-information/' | grep -oP '[a-f0-9]{40}(?=.*master-pdf-editor-'"${pkgver}${_armpatchver}"'-qt5.arm64.tar.gz)')
arch=(
    'x86_64'
    'aarch64'
)
license=('custom')
depends=(
    'libgl'
    'pkcs11-helper'
    'sane'
    'qt5-base'
    'qt5-svg'
    'qt5-declarative'
    'xcb-util-image'
    'xcb-util-keysyms'
    'xcb-util-renderutil'
    'xcb-util-wm'
    'glibc>=2.28'
)
makedepends=(
    'curl'
    'patchelf'
)
provides=("${_pkgname}=${pkgver}")
conflicts=(
    "${_pkgname}-qt_include"
    "${_pkgname}-qt6"
)
source_x86_64=("https://code-industry.net/public/master-pdf-editor-${pkgver}${_patchver}-qt5.x86_64.tar.gz")
sha1sums_x86_64=("${_checksum_x86_64% *}")
source_aarch64=("https://code-industry.net/public/master-pdf-editor-${pkgver}${_patchver}-qt5.arm64.tar.gz")
sha1sums_aarch64=("${_checksum_aarch64% *}")

package() {
    install -d "${pkgdir}/opt"
    install -d "${pkgdir}/usr/bin"
    cp -a --no-preserve=ownership "master-pdf-editor-${pkgver%%.*}" "${pkgdir}/opt/masterpdfeditor"

    cd                      "${pkgdir}/opt/masterpdfeditor"     || return 1
    ln -sr                  "${_pkgname}${pkgver%%.*}"          -t "${pkgdir}/usr/bin/"
    install -Dm644          "${_pkgname}${pkgver%%.*}.desktop"  -t "${pkgdir}/usr/share/applications/"
    install -Dm644          'license_en.txt'                    -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    patchelf --remove-rpath "${_pkgname}${pkgver%%.*}"
}
