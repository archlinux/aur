# Maintainer: Jack O'Sullivan <jackos1998 at gmail dot com>

_pkgbase=nat46
_pkgname=nat46-dkms
pkgname=nat46-dkms-git
pkgver=r124.683fbd2
pkgrel=1
pkgdesc="Linux kernel module implementing flexible NAT46"
arch=('i686' 'x86_64')
url="https://github.com/ayourtch/nat46"
license=('custom:Unknown')
depends=('dkms')
conflicts=("${_pkgbase}" "${_pkgname}")
source=("git+https://github.com/ayourtch/nat46"
		'dkms.conf')
sha256sums=('SKIP'
			'7d8f176097c9ecef2f0648069de30a6eb77a7b4294eaa68d86112a87b4f2a384')
pkgver() {
  cd "$_pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Copy sources (including Makefile)
  cp -r ${_pkgbase}/nat46/modules/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
}
