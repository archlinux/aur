# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=system76-power-git
pkgver=1.1.17.r1.g82bf0f4
pkgrel=1
pkgdesc="System76 Power Management"
arch=('any')
url="https://github.com/pop-os/system76-power"
license=('GPL')
conflicts=("system76-power")
provides=("system76-power")
makedepends=('git' 'rust')
depends=('dbus' 'systemd' 'system76-dkms')
source=("${pkgname}::git+https://github.com/pop-os/system76-power.git"
        "makefile.patch"
        "mkinitcpio.patch")
sha256sums=('SKIP'
            '97deb1f9cf6a312e8378bb96a4a83dae2498a4936c130e2ef5b125d13b92bb65'
            '2ead269c71919c220a7880b0036c6d62aadeae3d6cde769029784d3565686539')

pkgver() {
    cd "${srcdir}/${pkgname}"

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
