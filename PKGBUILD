# Maintainer: kawaiiDango <kawaiiDango at protonmail dot com>
# Maintainer: Nick80835 <nick80835 at proton dot me>

_pkgname=pano-scrobbler
pkgname=pano-scrobbler-bin
_pkgver=413
pkgver=4.13
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
sha256sums_x86_64=('3c640d3a00ccbcd456462f728a5b3e4be47c3bf8cbc67c89721cb16c96cd537f')
sha256sums_aarch64=('7a6cbe4374a261c1851679c1e349da32267099451e133c6f602ce0be2270e16d')

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
