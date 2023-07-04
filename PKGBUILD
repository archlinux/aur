#!/bin/bash
# Maintainer: Fedor Piecka <teplavoda at gmail dot com>

pkgname=eidklient
pkgver=4.7
pkgrel=1
pkgdesc="Slovak eID Client"
arch=('i686' 'x86_64')
url="https://www.slovensko.sk/"
license=('custom')
_upstream_arch=
[[ "$CARCH" == "x86_64" ]] && _upstream_arch="x86_64"
[[ "$CARCH" == "i686" ]] && _upstream_arch="i386"
_appimage="eID_klient-${_upstream_arch}.AppImage"
_url="https://eidas.minv.sk/downloadservice/eidklient/linux"
source=(
    eidklient
)
source_i686=("${_url}/eID_klient_i386.tar.gz")
source_x86_64=("${_url}/eID_klient_x86_64.tar.gz")
sha256sums=(
    SKIP
)
sha256sums_i686=(
    bccec263730fe6851db836915379bf32241df40f3a544e8b9b0362e0308bdec1
)
sha256sums_x86_64=(
    ab07ca3ee4c9dc8cdb83feb349d2e60aa45fd00b9f1e5828d6820593af2759cb
)
options=("!strip")
install=eidklient.install
makedepends=(
    fuse2
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

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

pkgver() {
    : "${srcdir:?}"

    strings "${srcdir}/squashfs-root/eID_Client" | grep -Pom1 '^eID_klient_v\K[0-9.]+'
}

package() {
    depends=(
        ccid
        gcc-libs
        glibc
        pcsclite
        qt5-base
        qt5-svg
    )
    optdepends=('disig-web-signer: online certificates update support')

    : "${depends[@]}"
    : "${optdepends[@]}"
    : "${pkgdir:?}"
    : "${srcdir:?}"

    # App
    mkdir "${pkgdir}/opt"
    cp -r "${srcdir}/squashfs-root" "${pkgdir}/opt/${pkgname}"

    # Custom wrapper
    install -Dm755 "${srcdir}/eidklient" "${pkgdir}/usr/bin/eID_Client"

    # Symlink executable
    # It seems this is unnecessary (however it's done like this in the upstream package)
    #ln -s /usr/bin/eID_Client "${pkgdir}/usr/bin/VirtualKeyboard"

    install -dm755 "${pkgdir}/usr/lib/eID_klient"
    ln -s /usr/bin/eID_Client "${pkgdir}/usr/lib/eID_klient/VirtualKeyboard"

    for lib in "${srcdir}"/squashfs-root/lib/lib{CardAPI,botan,pkcs11_,crypto,ssl}*; do
        ln -s "/opt/${pkgname}/lib/${lib##*/}" "${pkgdir}/usr/lib/eID_klient/"
    done

    # Icons + desktop file
    tar -x -C "${pkgdir}/usr" -f "${srcdir}/squashfs-root/share.tar"
}
