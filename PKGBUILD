# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=system76-power-git
pkgver=1.1.24.r10.gcee2d56
pkgrel=1
pkgdesc="System76 Power Management"
arch=('any')
url='https://github.com/pop-os/system76-power'
license=('GPL')
conflicts=('system76-power')
provides=('system76-power')
makedepends=('git' 'rust')
depends=('dbus' 'systemd' 'system76-dkms')
source=("${pkgname}::git+https://github.com/pop-os/system76-power.git"
        "makefile.patch"
        "mkinitcpio.patch")
sha256sums=('SKIP'
            '35af9e2c62deee200ac550f9390a3a43811d3336e1833e577deeda06482ad488'
            'bae03d96faea0f7ea80cb1cc5d4f2f97804509db378aaacb3e1d08cd38e05765')

pkgver() {
    cd "${srcdir}/${pkgname}"

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

prepare() {
    cd "${srcdir}/${pkgname}"

    # use mkinitcpio -P inplace of update-initramfs -u
    patch --no-backup-if-mismatch -Np1 -i "${srcdir}/mkinitcpio.patch"

    # fix makefile
    patch --no-backup-if-mismatch -Np1 -i "${srcdir}/makefile.patch"
}

build() {
    cd "${srcdir}/${pkgname}"

    make
}

package() {
    cd "${srcdir}/${pkgname}"

    make sysconfdir="/usr/lib" DESTDIR="${pkgdir}" install
}
