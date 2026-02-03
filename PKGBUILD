#!/bin/bash
# Maintainer: Ľubomír 'the-k' Kučera <lubomir.kucera.jr at gmail.com>

_pkgname=eidklient
pkgname="${_pkgname}-native"
pkgver=5.3
pkgrel=1
pkgdesc="Slovak eID Client - uses system-provided libraries, supports Wayland, …"
arch=('i686' 'x86_64')
url="https://www.slovensko.sk/"
license=('custom')
_upstream_arch=
[[ "$CARCH" == "x86_64" ]] && _upstream_arch="x86_64"
[[ "$CARCH" == "i686" ]] && _upstream_arch="i386"
_appimage="eID_klient-${_upstream_arch}.AppImage"
_url="https://web.archive.org/web/%dif_/https://eidas.minv.sk/downloadservice/eidklient/linux/eID_klient_%s.tar.gz"
source=(
    eidklient
    qt6.conf
)
# shellcheck disable=SC2059
source_i686=(
    "eID_klient_${pkgver}_i386.tar.gz::$(printf "${_url}" 20260203082204 i386)"
)
# shellcheck disable=SC2059
source_x86_64=(
    "eID_klient_${pkgver}_x86_64.tar.gz::$(printf "${_url}" 20260203082146 x86_64)"
)
sha256sums=(
    SKIP
    SKIP
)
sha256sums_i686=(
    c9f252e75e08400c00b41f519e7c2e48a0a9beb58748d1b64e52a0a621948a6c
)
sha256sums_x86_64=(
    5b2c322abe65839e33da7903559a24c47a958a2a474698fb08e6d6b4e097f06f
)
options=(
    !debug
    !strip
)
install=eidklient.install
makedepends=(
    fuse2
)
provides=(
    "${_pkgname}"
)
conflicts=(
    "${_pkgname}"
)

: "${pkgname}"
: "${pkgver}"
: "${pkgrel}"
: "${pkgdesc}"
: "${arch[@]}"
: "${url}"
: "${license[@]}"
: "${source[@]}"
: "${source_i686[@]}"
: "${source_x86_64[@]}"
: "${sha256sums[@]}"
: "${sha256sums_i686[@]}"
: "${sha256sums_x86_64[@]}"
: "${options[@]}"
: "${install}"
: "${makedepends[@]}"
: "${provides[@]}"
: "${conflicts[@]}"

prepare() {
    rm -rf squashfs-root

    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

package() {
    depends=(
        ccid
        gcc-libs
        glibc
        openssl
        pcsclite
        qt6-base
    )
    optdepends=(
        "disig-web-signer: online certificates update support"
    )

    : "${depends[@]}"
    : "${optdepends[@]}"
    : "${pkgdir:?}"
    : "${srcdir:?}"

    # App
    mkdir "${pkgdir}/opt"
    cp -r "${srcdir}/squashfs-root" "${pkgdir}/opt/${_pkgname}"

    # With QT_PLUGIN_PATH and QT_QPA_PLATFORM_PLUGIN_PATH, some bundled plugins
    # were still used.
    cp qt6.conf "${pkgdir}/opt/${_pkgname}"

    # Custom wrapper
    install -Dm755 "${srcdir}/eidklient" "${pkgdir}/usr/bin/eID_Client"

    # Symlink executable
    # It seems this is unnecessary (however it's done like this in the upstream package)
    #ln -s /usr/bin/eID_Client "${pkgdir}/usr/bin/VirtualKeyboard"

    install -dm755 "${pkgdir}/usr/lib/eID_klient"
    ln -s /usr/bin/eID_Client "${pkgdir}/usr/lib/eID_klient/VirtualKeyboard"

    for lib in "${srcdir}"/squashfs-root/lib/lib{CardAPI,botan,pkcs11_}*; do
        ln -s "/opt/${_pkgname}/lib/${lib##*/}" "${pkgdir}/usr/lib/eID_klient/"
    done

    for lib in "${srcdir}"/squashfs-root/lib/lib{crypto,ssl}*; do
        ln -s "/usr/lib/${lib##*/}" "${pkgdir}/usr/lib/eID_klient/"
    done

    # Icons + desktop file
    tar -x -C "${pkgdir}/usr" -f "${srcdir}/squashfs-root/share.tar"
}
