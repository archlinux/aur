# Maintainer: Daniel Reibl <janos.daniel.reibl@pm.me>
pkgname=nodemailerapp
pkgver=1.0.16
pkgrel=1
pkgdesc="NodemailerApp is the ultimate cross platform email debugging app"
arch=('x86_64')
url="https://nodemailer.com/app/"
license=('unknown')
makedepends=('squashfs-tools')
_snapid="262woIg4gNXJLoR5qgkJprJYJPwNkPiu"
_snaprev="10"
source=("https://api.snapcraft.io/api/v1/snaps/download/${_snapid}_${_snaprev}.snap" "no-sandbox.sh")

sha512sums=("1fd58a6c61855448f207f86728eb181be88486c2050a1dedea8292585aa816aaa3d7f25ae511b0926cfa870d757ee4772132f6739eea35378effcbfea3adfafc"
            "52053a3ee543c5d4fe8c2ed8498b78b9b42988cee1a9765c33d0bb9bea75c9a62cae82deda3f1ab4d8f0e84a4fec08ee8c98d60c147ab46961a0686f202a05b7")

prepare() {
    echo "Extracting snap file..."
    unsquashfs -q -f -d "${srcdir}/${pkgname}" "${_snapid}_${_snaprev}.snap"
}

package() {
    # Install files
    install -d "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/${pkgname}/." "${pkgdir}/opt/${pkgname}"

    # Desktop Entry
    sed -i 's|${SNAP}/meta/gui/icon.png|nodemailerapp|g' "${pkgdir}/opt/${pkgname}/meta/gui/nodemailerapp.desktop"
    install -Dm644 "${pkgdir}/opt/${pkgname}/meta/gui/nodemailerapp.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${pkgdir}/opt/${pkgname}/meta/gui/icon.png" "${pkgdir}/usr/share/pixmaps/nodemailerapp.png"

    # Clean up unnecessary files
    rm -rf "${pkgdir}/opt/${pkgname}"/{data-dir,gnome-platform,lib,meta,scripts,usr,*.sh}

    # Install wrapper script
    install -Dm755 "${srcdir}/no-sandbox.sh" "${pkgdir}/usr/bin/nodemailerapp"
}
