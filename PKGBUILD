# Maintainer: David Cooper <david@dtcooper.com>

_pkgname=amplitude-soundboard
pkgname="${_pkgname}-appimage"
pkgver=2.13.1
pkgrel=1
pkgdesc='A sleek, cross-platform soundboard, available for Windows, MacOS, and Linux'
arch=('x86_64')
url='https://amplitude-soundboard.dan0v.com/'
license=('GPL-3.0-or-later')
options=('!strip')
_uppername=AmplitudeSoundboard
_lowername=amplitude_soundboard
_appimage="${_uppername}-${pkgver}-x86_64.AppImage"
source=(
    "${_appimage}::https://github.com/dan0v/${_uppername}/releases/download/${pkgver}/Amplitude_Soundboard-x86_64.AppImage"
)
noextract=("${_appimage}")
sha256sums=('fa5b30f9588509a55ac8476785adfee74fc1fdddd4c018ac6a084feaf90c105f')
provides=("$_pkgname")
conflicts=("$_pkgname")

prepare() {
    cd "${srcdir}"
    chmod +x "${_appimage}"
    "./${_appimage}" --appimage-extract
}

build() {
    local squashfsdir
    squashfsdir="${srcdir}/squashfs-root"
    sed -i "s/\(Icon=\).*/\1${_lowername}/" "${squashfsdir}/${_lowername}.desktop"
}

package() {
    local squashfsdir
    squashfsdir="${srcdir}/squashfs-root"

    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${_pkgname}/${_appimage}"

    install -Dm755 "${squashfsdir}/${_lowername}.desktop" "${pkgdir}/usr/share/applications/${_lowername}.desktop"
    install -Dm644 "${squashfsdir}/icn.png" "${pkgdir}/usr/share/pixmaps/${_lowername}.png"

    install -dm755 "${pkgdir}/usr/bin/"
    ln -s "/opt/${_pkgname}/${_appimage}" "${pkgdir}/usr/bin/${_lowername}"
}
