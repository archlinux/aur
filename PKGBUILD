# Maintainer: Joseph R. Prostko <joe dot prostko at gmail dot com>
# Upstream: Immersed Inc. <info at immersed dot com>

pkgname=immersed
pkgver=10.5.0
pkgrel=2
pkgdesc="Immersed Desktop Agent"
arch=('x86_64')
url="https://immersed.com/"
license=('unknown')
depends=('fuse')
optdepends=('V4L2LOOPBACK-MODULE: Virtual webcam support')
options=(!strip !debug)

_unversioned_appimage="${pkgname^}-${arch}.AppImage"
_versioned_appimage="${pkgname^}-${pkgver}-${arch}.AppImage"

source=("${_versioned_appimage}::https://static.immersed.com/dl/${_unversioned_appimage}"
        "${pkgname}.desktop")
sha256sums=('fdf73f51160965fb593f2562726663caf7063cb687ae796cac446540537913df'
            'SKIP')

prepare() {
    chmod +x "${srcdir}/${_versioned_appimage}"
    "${srcdir}/${_versioned_appimage}" --appimage-extract
}

package() {
    install -Dm755 "${srcdir}/${_versioned_appimage}" "${pkgdir}/opt/${pkgname}/${_unversioned_appimage}"
    
    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${_unversioned_appimage}" "${pkgdir}/usr/bin/${pkgname}"
    
    # Install desktop entry and icon
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/Immersed.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
