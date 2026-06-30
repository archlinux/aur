# Maintainer: kawaiiDango <kawaiiDango at protonmail dot com>
# Maintainer: Nick80835 <nick80835 at proton dot me>

_pkgname=pano-scrobbler
pkgname=pano-scrobbler-bin
_pkgver=441
pkgver=4.41
pkgrel=1
pkgdesc="Feature rich scrobbler. Supports Last.fm, ListenBrainz, Libre.fm & Pleroma. With regex edits, charts & Discord Rich Presence on PC."
arch=('x86_64' 'aarch64')
url="https://github.com/kawaiiDango/pano-scrobbler"
license=('GPL-3.0-or-later')
depends=('dbus' 'webkitgtk-6.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!strip)
source_x86_64=("pano-scrobbler-${_pkgver}-linux-x64.tar.gz::${url}/releases/download/${_pkgver}/pano-scrobbler-linux-x64.tar.gz")
source_aarch64=("pano-scrobbler-${_pkgver}-linux-arm64.tar.gz::${url}/releases/download/${_pkgver}/pano-scrobbler-linux-arm64.tar.gz")
sha256sums_x86_64=('814f1a39cbb2aec621f9f44b3d8d2b6b5242d5b20543a70d506bc847a23dde21')
sha256sums_aarch64=('1c46313a76d7c8b3e029106052c90719a48b6a05c9b63e12e8f2d44cf5064e6e')

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
