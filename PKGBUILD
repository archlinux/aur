# Maintainer: woodwose <woodwose.archlinux@fastmail.com>
# Contributor: schard

_pkgbase=tuxedo-yt6801
pkgname=tuxedo-yt6801-dkms-git
pkgver=1.0.31.8.r0.g25c1805
pkgrel=2
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
  "tuxedo-yt6801-blacklist.conf"
)
b2sums=('SKIP'
        '07268e2ddf849791b117aa585995f6618649e5cdacf8cb9daa91910de02383d62f7230dd1d9b8bf1420aad86c8b36363d68bcdd07b3d871dca5403f26eb738f0'
        '0cc8a064e8816bf334c262546bcb01fd9454db23052d554af807bd2fed531b827db6b49422b89bd817e0dc2b270f4fa09c09784a7e66acf1c6d675828d6832b6')

pkgver() {
  cd "${srcdir}/${_pkgbase}"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgbase}"
  
  # Patch upstream bug: $(cat) fails in Makefiles without the $(shell) function wrapper
  sed -i 's/\$(cat /\$(shell cat /g' src/Kbuild
}

package() {
  cd "${srcdir}/${_pkgbase}"

  sed "s/#MODULE_VERSION#/${pkgver}/" "${srcdir}/dkms.conf.in" > dkms.conf

  install -Dm644 dkms.conf "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

  install -Dm644 src/*.c "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/"
  install -Dm644 src/*.h "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/"
  install -Dm644 src/Notice.txt "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/"

  install -Dm644 src/Kbuild "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/"
  
  install -Dm644 "${srcdir}/tuxedo-yt6801-blacklist.conf" "${pkgdir}/usr/lib/modprobe.d/tuxedo-yt6801-blacklist.conf"
}
