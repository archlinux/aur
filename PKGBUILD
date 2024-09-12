# Maintainer: Lukas "DerGeneralFluff" Lichten <lichtenrider@hotmail.de>

_pkgbase=hid-tmff2
pkgname="${_pkgbase}-dkms-git"
pkgver=r266.542f3f0
pkgrel=1
pkgdesc="Linux kernel module (DKMS) for Thrustmaster T300RS, T248, TX and TS-XW"
arch=('x86_64')
url="https://github.com/Kimplul/${_pkgbase}"
license=('GPL-3.0')
depends=('dkms')
makedepends=('git' 'make')
conflicts=("${_pkgbase}" "${_pkgbase}-dkms")
provides=("hid-tmff2-dkms=${pkgver}")
install="${pkgname}.install"
source=(
  "git+${url}"
  "${pkgname}.install"
)
#md5sums=(use 'updpkgsums')
md5sums=(
  SKIP
  SKIP
)

pkgver() {
	cd "$srcdir/${_pkgbase}"

	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${_pkgbase}"
  git submodule update --init --recursive
}

package() {
  cd $srcdir/${_pkgbase}
  install -Dm644 dkms/dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Set name and version
  sed -e "s/0.8/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Copy sources (including Makefile)
  cp -r $srcdir/${_pkgbase}/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
}
