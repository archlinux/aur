# Maintainer: Enrico Pozzobon <enricopozzobon@gmail.com>

pkgname=can-isotp-dkms-git
_pkgbase=can-isotp
pkgver=r26.ced84ca
pkgrel=1
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
pkgdesc="Kernel modules for isotp"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
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
            '4e69b728bacd8aba3281b55aef2da2e8737d6a380be2d8ed397e09f79651f317')

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

  # Patch makefile to work with dkms, and use the specified kernel release
  sed -e s/else// \
      -e s/shell\ uname\ \-r/KERNELRELEASE/ \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/Makefile

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}

# vim:set ts=2 sw=2 et:
