# Maintainer: Tonkku <contact@tonkku.me>

pkgname=authy
pkgver=2.4.0
pkgrel=1
pkgdesc="Two factor authentication desktop application"
arch=('x86_64')
url='https://authy.com/'
provides=('authy')
conflicts=('authy-snap')
replaces=('authy-snap')
license=('unknown')
depends=('nss' 'gtk3')
makedepends=('squashfs-tools')
_snapid="H8ZpNgIoPyvmkgxOWw5MSzsXK1wRZiHn"
_snaprev="20"
source=("https://api.snapcraft.io/api/v1/snaps/download/${_snapid}_${_snaprev}.snap")
sha256sums=('269aa33db0c21d9f308a9fcf1d89f926fd5ed9a8223ad49ba0051f5496f30d28')

prepare() {
    echo "Extracting snap file..."
    unsquashfs -q -f -d "${srcdir}/${pkgname}" "${_snapid}_${_snaprev}.snap"
}

package() {
    # Install files
    install -d "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/${pkgname}/." "${pkgdir}/opt/${pkgname}"

    # Desktop Entry
    sed -i 's|${SNAP}/meta/gui/icon.png|authy|g' "${pkgdir}/opt/${pkgname}/meta/gui/authy.desktop"
    install -Dm644 "${pkgdir}/opt/${pkgname}/meta/gui/authy.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${pkgdir}/opt/${pkgname}/meta/gui/icon.png" "${pkgdir}/usr/share/pixmaps/authy.png"

    # Clean up unnecessary files
    rm -rf "${pkgdir}/opt/${pkgname}"/{data-dir,gnome-platform,lib,meta,scripts,usr,*.sh}

    # Symlink binary to /usr/bin
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/authy" "${pkgdir}/usr/bin"
}
