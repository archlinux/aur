#!/usr/bin/env bash
# shellcheck disable=SC2034,SC2148,SC2154
#
# Maintainer: Toria <ninetailedtori@uwu.gal>
#
_pkgname=masterpdfeditor
pkgbase="${_pkgname}-qt6"
pkgname=(
    "${_pkgname}-qt6"
    "qt6-${_pkgname}"
)
pkgver=5.9.99
# qt6ver="6.4.2-1"
_patchver=''
pkgrel=2
pkgdesc='A complete solution for viewing, creating and editing PDF files.'
url='https://code-industry.net/free-pdf-editor/'
_checksum=$(curl 'https://code-industry.net/checksum-information/' | grep -oP '[a-f0-9]{40}(?=.*master-pdf-editor-'"${pkgver}${_patchver}"'-qt6.x86_64.tar.gz)')
arch=('x86_64')
license=('custom')
makedepends=(
    'curl'
    'patchelf'
)
source_x86_64=(
    "https://code-industry.net/public/master-pdf-editor-${pkgver}${_patchver}-qt6.x86_64.tar.gz"
    "https://archive.archlinux.org/packages/q/qt6-base/qt6-base-${qt6ver}-x86_64.pkg.tar.zst"
    "https://archive.archlinux.org/packages/q/qt6-svg/qt6-svg-${qt6ver}-x86_64.pkg.tar.zst"
    "https://archive.archlinux.org/packages/q/qt6-declarative/qt6-declarative-${qt6ver}-x86_64.pkg.tar.zst"
    "https://archive.archlinux.org/packages/q/qt6-5compat/qt6-5compat-${qt6ver}-x86_64.pkg.tar.zst"
    "https://archive.archlinux.org/packages/q/qt6-wayland/qt6-wayland-${qt6ver}-x86_64.pkg.tar.zst"
    "https://archive.archlinux.org/packages/i/icu/icu-72.1-2-x86_64.pkg.tar.zst"
    "masterpdfeditor" # wrapper
)
sha1sums_x86_64=(
    "${_checksum% *}"                          # masterpdfeditor
    '2aef848e417b78e5cc0e64961e1da0274748b2c3' # qt6-base
    '165e18c31f19eaefb0d2f25b64b5b58b6db637ed' # qt6-svg
    'e4891badad4b4c0d30f1b54d3f4e9ae1d18e6052' # qt6-declarative
    '89a13d359c959c98f17b5dd53e38efa4aa858216' # qt6-5compat
    '983857b378cd62c38c708de97a97e6d83cfff3ec' # qt6-wayland
    '40ac37ae0659954c5dcaedfec8683339b3b3f3d7' # icu
    'a32196cd8736b5425a1952ce0d6a932ed058de9b' # wrapper
)
# validpgpkeys=(
#   '1519D5ABA65BF6FC2B73C7567A4E76095D8A52E4' # Arch Linux Developer Key
# )

package_qt6-masterpdfeditor() {
    # Add QT 6.4.2 libraries as required
    install -dm755 \
        "${pkgdir}/opt/${_pkgname}/lib"

    cp      -v \
        "$srcdir/usr/lib"/libQt6*.so* \
        "${pkgdir}/opt/${_pkgname}/lib/"

    cp -rv \
        "$srcdir/usr/lib/qt6" \
        "${pkgdir}/opt/${_pkgname}/lib/"

    # And the ICU 72 libs that are required by QT 6.4.2
    cp      -v \
        "$srcdir/usr/lib/libicu"*.so.72* \
        "${pkgdir}/opt/${_pkgname}/lib/"
    cp      -v \
        "$srcdir/usr/lib/libicu"*.so.72.1 \
        "${pkgdir}/opt/${_pkgname}/lib/"
}

package_masterpdfeditor-qt6() {
    provides=("${_pkgname}=${pkgver}")
    conflicts=(
        "${_pkgname}-qt_include"
        "${_pkgname}-qt5"
    )
    depends=(
        'libgl'
        'pkcs11-helper'
        'sane'
        # 'qt6-base'
        # 'qt6-svg'
        # 'qt6-declarative'
        # 'qt6-5compat'
        'xcb-util-image'
        'xcb-util-keysyms'
        'xcb-util-renderutil'
        'xcb-util-wm'
        'glibc>=2.28'
        'qt6-masterpdfeditor'
    )

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

    # Patch the desktop to use usr/bin launcher
    sed -i \
        -e 's|^Exec=.*|Exec=/usr/bin/masterpdfeditor5 %f|' \
        -e 's|^Path=.*|Path=/opt/masterpdfeditor|' \
        -e 's|^Icon=.*|Icon=/opt/masterpdfeditor/masterpdfeditor5.png|' \
        "${_pkgname}${pkgver%%.*}.desktop"

    # Install all the files.
    install -Dm755 \
        "${srcdir}/${_pkgname}" \
        "${pkgdir}/usr/bin/"
    install -Dm644 \
        "${_pkgname}${pkgver%%.*}.desktop" \
        -t "${pkgdir}/usr/share/applications/"
    install -Dm644 \
        'license_en.txt' \
        -t "${pkgdir}/usr/share/licenses/${pkgname}/"

    # Patch it to request the /opt/masterpdfeditor/lib libs FIRST, so it
    # doesn't fallback
    patchelf --set-rpath \
        /opt/masterpdfeditor/lib:/usr/lib \
        "${pkgdir}/opt/masterpdfeditor/masterpdfeditor5"
}
