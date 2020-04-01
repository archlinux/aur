# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: M0Rf30
# Contributor: Samsagax <samsagax@gmail.com>

pkgbase=bbswitch
pkgname=(bbswitch bbswitch-dkms)
pkgver=0.8
pkgrel=303
pkgdesc="Kernel module allowing to switch dedicated graphics card on Optimus laptops"
arch=('x86_64')
url="http://github.com/Bumblebee-Project/bbswitch"
license=('GPL')
makedepends=('linux-headers')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/Bumblebee-Project/bbswitch/archive/v${pkgver}.tar.gz"
        "0001-proc_ops-struct.patch")
sha512sums=('11ab163931feb6c0e202d04c4552b848e999fedea9990390c26b28abdb4a69081ccfb5a22d1e390cc274f1c0cfc9adedc719c5fece14738b17aaa93e28865b7c'
            'b4b7e5e2e0b531f30b10c3e92d8d1e7189a13d1fdea55dc9659553f9df54c305addce53c78ecc0dac2e68e002b7f655161b57698bdeaa87e1987c7f7ad6cb629')

prepare() {
    cd ${pkgbase}-${pkgver}
    patch -Np1 < $srcdir/0001-proc_ops-struct.patch
}

build() {
  cd ${pkgbase}-${pkgver}
  make KDIR=/usr/src/linux
}

package_bbswitch() {
  depends=('linux')

  cd ${pkgbase}-${pkgver}
  _extradir="/usr/lib/modules/$(</usr/src/linux/version)/extramodules"
  install -Dt "${pkgdir}${_extradir}" -m644 *.ko
  find "${pkgdir}" -name '*.ko' -exec xz {} +
}

package_bbswitch-dkms() {
  depends=('dkms')
  conflicts=('bbswitch')
  provides=('bbswitch')

  cd ${pkgbase}-${pkgver}
  install -Dt "${pkgdir}/usr/src/${pkgbase}-${pkgver}" -m644 Makefile bbswitch.c dkms/dkms.conf
}
