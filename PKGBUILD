# Maintainer: BBaoVanC <bbaovanc@bbaovanc.com>
pkgname=checkra1n-gui
pkgver=0.12.4
pkgrel=7
pkgdesc="checkra1n is a semi-tethered jailbreak based on the checkm8 bootrom exploit. (GUI version)"
license=('unknown')
url="https://checkra.in"
arch=('x86_64')
depends=(libimobiledevice libirecovery-1.0-3 libplist libtvcontrol ncurses5-compat-libs gtk3)
makedepends=(binutils patchelf tar)
_debname="checkra1n_${pkgver}_amd64.deb"
source=("https://assets.checkra.in/debian/${_debname}")
sha256sums=('90d3a5fb16e86c488344cfa8cec96e4592aa4d7f8932da99d4b5a052fdb10a1a')

options=(!strip) # for some reason, checkra1n segfaults if the binary is stripped

package() {
    ar x ${_debname}
    tar -xf data.tar.xz

    # > However since the only ABI breaking change in libplist-2.0.so.4 is in plist_from_memory
    # > which isn't used by checkra1n (see objdump -T path/to/checkra1n | grep plist), it should be
    # > safe to only use libplist-2.0.so.4.
    # https://aur.archlinux.org/packages/checkra1n-gui#comment-963486
    patchelf --replace-needed libplist-2.0.so.3 libplist-2.0.so.4 usr/bin/checkra1n

    mkdir -p ${pkgdir}/usr/bin
    mkdir -p ${pkgdir}/usr/share/applications
    mkdir -p ${pkgdir}/usr/share/doc/checkra1n
    mkdir -p ${pkgdir}/usr/share/icons

    install -m 0755 usr/bin/checkra1n ${pkgdir}/usr/bin/checkra1n-gui
    install -m 0644 usr/share/doc/checkra1n/changelog.gz ${pkgdir}/usr/share/doc/checkra1n/changelog.gz
    cp -rT usr/share/icons/ ${pkgdir}/usr/share/icons

    install -m 0644 usr/share/applications/checkra1n.desktop ${pkgdir}/usr/share/applications/checkra1n.desktop
    sed -i 's/Exec=checkra1n --gui/Exec=checkra1n-gui/' ${pkgdir}/usr/share/applications/checkra1n.desktop
    sed -i 's/TryExec=checkra1n/TryExec=checkra1n-gui/' ${pkgdir}/usr/share/applications/checkra1n.desktop
}
