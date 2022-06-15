# Maintainer: David Li <davidtianli@gmail.com>
# Based on the PKGBUILD for gdlauncher-bin
pkgname="gdlauncher-beta-bin"
_pkgname="gdlauncher"
pkgver="1.1.24"
_pkgver="1.1.24"  # Upstream version, used in the download url.
pkgrel=1
arch=('x86_64')
pkgdesc="GDLauncher is simple, yet powerful Minecraft custom launcher with a strong focus on the user experience"
url="https://gdevs.io"
license=('GPL3')
makedepends=('tar' 'xz')
depends=('libnotify' 'libxss' 'libxtst' 'libindicator-gtk3' 'libappindicator-gtk3')
provides=('gdlauncher')
conflicts=('gdlauncher' 'gdlauncher-beta' 'gdlauncher-bin' 'gdlauncher-appimage' 'gdlauncher-git' 'gdlauncher-classic')
source_x86_64=("GDLauncher-${pkgver}.deb::https://github.com/gorilla-devs/GDLauncher/releases/download/v${_pkgver}/GDLauncher-linux-setup.deb")
md5sums_x86_64=('5d5e8736b12b74ba301af328b16a513d')

package() {
    # Extract data folder from .deb archive
    tar xf "${srcdir}/data.tar.xz" --directory=$pkgdir

    # fix file permissions - all files as 644 - directories as 755
    find "${pkgdir}/"{opt,usr} -type d -exec chmod 755 {} \;
    find "${pkgdir}/"{opt,usr} -type f -exec chmod 644 {} \;

    # make sure the main and 7za binary have the right permissions
    chmod a+x "${pkgdir}/opt/GDLauncher/"{${_pkgname},7za}

    # link the binary
    install -d -m755 "${pkgdir}/usr/bin/"
    ln -sr "${pkgdir}/opt/GDLauncher/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
