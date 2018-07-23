# Maintainer: Enrico Pozzobon <enricopozzobon@gmail.com>

pkgname=can-isotp-dkms-git
_pkgbase=can-isotp
pkgver=r14.6003f99
pkgrel=1
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
pkgdesc="Kernel modules for isotp"
arch=('i686' 'x86_64')
url="https://github.com/hartkopp/can-isotp"
license=('GPL2')
makedepends=('git')
depends=('dkms')
optdepends=('can-utils: utilities for sending and receiving ISOTP messges'
            'linux-headers: build the module against Arch kernel'
            'linux-lts-headers: build the module against LTS Arch kernel')
source=("git+https://github.com/hartkopp/can-isotp.git"
        'dkms.conf')
sha256sums=('SKIP'
            '8224438ae2136eb5e423daf475168b337707539440c9024b97a9493c6c3e793e')

pkgver() {
	cd "$srcdir/${_pkgbase}"

  # Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  # Install
  install -dm755 "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
  cp -r can-isotp/* "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/"

  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}

# vim:set ts=2 sw=2 et:
