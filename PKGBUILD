# Maintainer: kawaiiDango <kawaiiDango at protonmail dot com>
# Maintainer: Nick80835 <nick80835 at proton dot me>

_pkgname=pano-scrobbler
pkgname=pano-scrobbler-bin
_pkgver=418
pkgver=4.18
pkgrel=1
pkgdesc="Feature packed cross-platform music tracker"
arch=('x86_64' 'aarch64')
url="https://github.com/kawaiiDango/pano-scrobbler"
license=('GPL-3.0-or-later')
depends=('webkit2gtk-4.1')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!strip)
source_x86_64=("pano-scrobbler-${_pkgver}-linux-x64.tar.gz::${url}/releases/download/${_pkgver}/pano-scrobbler-linux-x64.tar.gz")
source_aarch64=("pano-scrobbler-${_pkgver}-linux-arm64.tar.gz::${url}/releases/download/${_pkgver}/pano-scrobbler-linux-arm64.tar.gz")
sha256sums_x86_64=('1c63b161bc14dc65b31da144aba07b5c7988b12d2c441a11ffbe07f15b329d9a')
sha256sums_aarch64=('c1d21c49ffec0f16f9a01925e9a189e3c1f3f97c0da76a3f87bc6e0b65d6a9c8')

prepare() {
    # Patch desktop entry
    sed -i 's/^Exec=.*/Exec=\/usr\/bin\/pano-scrobbler %U/' "${_pkgname}.desktop"
    sed -i 's/^Icon=.*/Icon=pano-scrobbler/' "${_pkgname}.desktop"
}

package() {
    # Shared libs
    install -d "${pkgdir}/opt/${_pkgname}/lib"
    install -m644 ./*.so "${pkgdir}/opt/${_pkgname}/"
    install -m644 lib/*.so "${pkgdir}/opt/${_pkgname}/lib/"

    # Main executable
    install -m755 "${_pkgname}" "${pkgdir}/opt/${_pkgname}/${_pkgname}"

    # Symlink main executable
    install -d "${pkgdir}/usr/bin"
    ln -srf "${pkgdir}/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    # Desktop
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon
    install -Dm644 "${_pkgname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"

    # License
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
