# Maintainer: Rohit Goswami (HaoZeke) <rohit.goswami@aol.com>
pkgname=journey-cloud
pkgver=2.14.6
pkgrel=1
pkgdesc="Your private diary, journal & companion."
arch=('x86_64')
url='https://journey.cloud/'
provides=('journey')
conflicts=('journey' 'journey-bin' 'journey-git')
replaces=()
license=('unknown')
depends=('nss' 'gtk3' 'libxss')
optdepends=('libappindicator-gtk3: tray icon support')
makedepends=('squashfs-tools')
# Kanged https://github.com/tinywrkb/flatpaks/blob/master/cloud.journey.journey/cloud.journey.journey.yaml
_snapid="TWwObnuGiM3Urabc9hR2Xg2bJs6J8f2Y"
_snaprev="23"
source=("https://api.snapcraft.io/api/v1/snaps/download/${_snapid}_${_snaprev}.snap")
sha256sums=('94286dc928e8d9cdf8b2d3897b70f009089838b7f45680172d366fc8a9cfd885')

# Logic from https://aur.archlinux.org/packages/authy/
prepare() {
    echo "Extracting snap file..."
    unsquashfs -q -f -d "${srcdir}/${pkgname}" "${_snapid}_${_snaprev}.snap"
}

package() {
    # Install files
    install -d "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/${pkgname}/." "${pkgdir}/opt/${pkgname}"

    # Desktop Entry
    sed -i 's|${SNAP}/meta/gui/icon.png|journey|g' "${pkgdir}/opt/${pkgname}/meta/gui/journey.desktop"
    install -Dm644 "${pkgdir}/opt/${pkgname}/meta/gui/journey.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${pkgdir}/opt/${pkgname}/meta/gui/icon.png" "${pkgdir}/usr/share/pixmaps/journey.png"

    # Clean up unnecessary files
    rm -rf "$pkgdir/opt/$pkgname"/{data-dir,gnome-platform,lib,meta,scripts,usr,*.sh}

    # Symlink binary to /usr/bin
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/journey" "${pkgdir}/usr/bin"
}

# vim:set ts=2 sw=2 et:
