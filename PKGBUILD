# Maintainer: Lukas "DerGeneralFluff" Lichten <lichtenrider@hotmail.de>

_pkgbase=hid-tmff2
pkgname="${_pkgbase}-dkms-git"
pkgver=r276.11cca6d
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
  "${pkgname}.conf"
)
#md5sums=(use 'updpkgsums')
md5sums=(
  SKIP
  a14f91ce429c03ec028d8781663436a4
  88b6b3b589c025fda6f9c9091837a8ad
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

  # Include Blacklist for hid_thrustmaster
  install -Dm644 "${srcdir}/${pkgname}.conf" "${pkgdir}/usr/lib/modprobe.d/${pkgname}.conf"
}
