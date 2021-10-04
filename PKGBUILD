# Maintainer: Giovanni Santini <giovannisantini93@yahoo.it>
# Contributor: Ryan O'Beirne <ryanobeirne@gmail.com>
pkgname=faustus-hyperkvm-dkms-git
_pkgbase=faustus
pkgver=0.2
pkgrel=2
pkgdesc="Experimental unofficial Linux platform driver module for ASUS TUF Gaming series laptops. HyperKVM form"
arch=("x86_64")
url="https://github.com/Hyper-KVM/faustus"
license=("GPL")
depends=("dkms")
makedepends=("git")
optdepends=("linux-headers" "linux-lts-headers" "linux-zen-headers")
provides=("$_pkgbase" "${_pkgbase}-dkms")
conflicts=("$_pkgbase" "${_pkgbase}-dkms")
source=("git+${url}.git")
sha256sums=("SKIP")

pkgver() {
    source "${srcdir}/${_pkgbase}/dkms.conf"
    echo "$PACKAGE_VERSION"
}

package() {
    cd ${srcdir}/${_pkgbase}
    mkdir -p ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
    cp -pr Makefile dkms.conf src/ ${pkgdir}/usr/src/${_pkgbase}-${pkgver}

    # Adjust the sysfs paths
    sed -i 's|set_aura|aura|' set_rgb.sh
    install -Dm755 set_rgb.sh "${pkgdir}/usr/bin/faustus-rgb"

    install -Dm644 <(printf 'blacklist %s\n' "asus_wmi" "asus_nb_wmi") "${pkgdir}/etc/modprobe.d/${_pkgbase}.conf"
    install -Dm644 <(printf '%s\n' "${_pkgbase}") "${pkgdir}/etc/modules-load.d/${_pkgbase}.conf"
}
