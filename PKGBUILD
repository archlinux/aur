# Maintainer: woodwose <woodwose.archlinux@fastmail.com>
# Contributor: schard

_pkgbase=tuxedo-yt6801
pkgname=tuxedo-yt6801-dkms-git
pkgver=1.0.31.5.r0.g8e34798
pkgrel=1
pkgdesc="Kernel module for Motorcomm YT6801 ethernet controller (DKMS)"
arch=('x86_64')
url="https://gitlab.com/tuxedocomputers/development/packages/tuxedo-yt6801"
license=('GPL-2.0-or-later')
depends=('dkms')
makedepends=('git')
conflicts=('yt6801-dkms')
install=tuxedo-yt6801.install
source=(
  "git+https://gitlab.com/tuxedocomputers/development/packages/tuxedo-yt6801.git/"
  "dkms.conf.in"
  "set_kbuild.sh"
  "tuxedo-yt6801.install"
)
b2sums=(
  'SKIP'
  'c97f7bd2d9d5d058abdc3c04a198afe69f0f1c8b9267473cec41f7450bfcc0eb4de6f085315d45679f1d9ef0d12760d41cf88f925f12102df3033c2c519d27c0'
  'e8260eb30b11f7c2c82ff15f108ddf1a165e77aa53b8ccb95bb103bdbb78267036c0c76dcbd74dd566d80f54d6c042ae3488ef8654f08388add23017b0fd4ae8'
  '4b2f7ec415b219f9f9d5ad354e672fc648fd52cf2462a35e64cbb19c507fb29d832acd8265cfb8045be93c1748b8d8393e717824d65c53d611930f14d9f3cadf'
)

pkgver() {
  cd "${srcdir}/${_pkgbase}"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${_pkgbase}"

  sed "s/#MODULE_VERSION#/${pkgver}/" "${srcdir}/dkms.conf.in" > dkms.conf

  install -Dm644 dkms.conf ${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  install -Dm644 src/*.c ${pkgdir}/usr/src/${_pkgbase}-${pkgver}/
  install -Dm644 src/*.h ${pkgdir}/usr/src/${_pkgbase}-${pkgver}/
  install -Dm644 src/Notice.txt ${pkgdir}/usr/src/${_pkgbase}-${pkgver}/

  install -Dm644 src/Kbuild_default ${pkgdir}/usr/src/${_pkgbase}-${pkgver}/
  install -Dm644 src/Kbuild_no_aspm ${pkgdir}/usr/src/${_pkgbase}-${pkgver}/

  install -Dm755 ${srcdir}/set_kbuild.sh ${pkgdir}/usr/src/${_pkgbase}-${pkgver}/
}
