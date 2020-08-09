# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: M0Rf30
# Contributor: Samsagax <samsagax@gmail.com>

pkgbase=bbswitch
pkgname=(bbswitch bbswitch-dkms)
pkgver=0.8
pkgrel=338
pkgdesc="Kernel module allowing to switch dedicated graphics card on Optimus laptops"
arch=('x86_64')
url="http://github.com/Bumblebee-Project/bbswitch"
license=('GPL')
makedepends=('linux-headers')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/Bumblebee-Project/bbswitch/archive/v${pkgver}.tar.gz"
        0001-proc_ops-struct.patch 0002-kernel-5.7.patch)
sha512sums=('11ab163931feb6c0e202d04c4552b848e999fedea9990390c26b28abdb4a69081ccfb5a22d1e390cc274f1c0cfc9adedc719c5fece14738b17aaa93e28865b7c'
            '993a2895c37ea213c105be668f794af54838d8015d6f561ee6bc7ce65583425515931c83c2487ab97c14454105f233f089e8bdc90ea5ed9576be767335f57ad1'
            '2eeae463b2f83e7744ff1a769cb6186389e026fc78668e836525dfd16a56abfae01cfb150c9bb46af74ec42e87ebea91636118fe0c773e7eaa7ea671b25d2e04')

prepare() {
  cd ${pkgbase}-${pkgver}
  patch -Np1 < ../0001-proc_ops-struct.patch
  patch -Np1 < ../0002-kernel-5.7.patch
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
  find "${pkgdir}" -name '*.ko' -exec strip --strip-debug {} +
  find "${pkgdir}" -name '*.ko' -exec xz {} +
}

package_bbswitch-dkms() {
  depends=('dkms')
  conflicts=('bbswitch')
  provides=('bbswitch')

  cd ${pkgbase}-${pkgver}
  install -Dt "${pkgdir}/usr/src/${pkgbase}-${pkgver}" -m644 Makefile bbswitch.c dkms/dkms.conf
}

# vim:set sw=2 noet:
