# Maintainer: Arun Mahapatra <arun@codito.in>

pkgname=vott-bin
pkgver=2.2.0
pkgrel=1
pkgdesc="Visual Object Tagging Tool: An electron app for building end to end Object Detection Models from Images and Videos."
arch=('x86_64')
url='https://github.com/microsoft/VoTT'
provides=('vott')
conflicts=('vott')
license=('MIT')
makedepends=('squashfs-tools')
_snapname='vott'
source=("https://github.com/microsoft/VoTT/releases/download/v${pkgver}/vott-${pkgver}-linux.snap")
sha256sums=('639e5a8ecaab9e1425da11b59c87387cb383deb22d7b93ba7fa1c941dfd82c10')

prepare() {
    echo "Extracting snap file..."
    unsquashfs -q -f -d "${srcdir}/${_snapname}" "${_snapname}-${pkgver}-linux.snap"
}

package() {
    # Install files
    install -d "${pkgdir}/opt/${_snapname}"
    cp -r "${srcdir}/${_snapname}/." "${pkgdir}/opt/${_snapname}"

    # Desktop Entry
    sed -i 's|${SNAP}/meta/gui/icon.png|vott|g' "${pkgdir}/opt/${_snapname}/meta/gui/vott.desktop"
    install -Dm644 "${pkgdir}/opt/${_snapname}/meta/gui/vott.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${pkgdir}/opt/${_snapname}/meta/gui/icon.png" "${pkgdir}/usr/share/pixmaps/vott.png"

    # Clean up unnecessary files
    rm -rf "$pkgdir/opt/$_snapname"/{data-dir,gnome-platform,lib,meta,scripts,usr,*.sh}

    # Symlink binary to /usr/bin
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${_snapname}/vott" "${pkgdir}/usr/bin"
}
