# Maintainer: Joseph R. Prostko <joe dot prostko at gmail dot com>
# Upstream: Immersed Inc. <info at immersed dot com>

pkgname=immersed
pkgver=10.10.0
pkgrel=1
pkgdesc="Immersed Desktop Agent"
arch=('x86_64')
url="https://immersed.com/"
license=('unknown')
depends=('fuse' 'libva-utils')
optdepends=(
    'intel-media-driver: VA-API implementation for Intel (HD Graphics - Broadwell and later)'
    'libva-intel-driver: VA-API implementation for Intel (GMA 4500 - Coffee Lake and prior)'
    'libva-nvidia-driver: VA-API implementation for NVIDIA that uses NVDEC as a backend'
    'mesa: VA-API implemention for AMD is contained within this package'
    'V4L2LOOPBACK-MODULE: Virtual webcam support'
)
options=(!strip !debug)

_pkgname_ucfirst="${pkgname^}"
_appimage_unversioned="${_pkgname_ucfirst}-${arch}.AppImage"
_appimage_versioned="${_pkgname_ucfirst}-${pkgver}-${arch}.AppImage"

source=("${_appimage_versioned}::https://static.immersed.com/dl/${_appimage_unversioned}")
sha256sums=('385908e2523d87db5bfdd8a78b1b6cda11d8768d9498ed8bfc540bc6a468b475')

prepare() {
    chmod +x "${srcdir}/${_appimage_versioned}"
    "${srcdir}/${_appimage_versioned}" --appimage-extract
}

package() {
    # Deploy AppImage
    install -Dm755 "${srcdir}/${_appimage_versioned}" "${pkgdir}/opt/${_pkgname_ucfirst}/${_appimage_unversioned}"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname_ucfirst}/${_appimage_unversioned}" "${pkgdir}/usr/bin/${pkgname}"

    # Modify and install .desktop file
    sed -i "s/^Exec=.*/Exec=${pkgname}/" "${srcdir}/squashfs-root/${_pkgname_ucfirst}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname_ucfirst}.desktop" "${pkgdir}/usr/share/applications/${_pkgname_ucfirst}.desktop"

    # Install icon
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname_ucfirst}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname_ucfirst}.png"
}
