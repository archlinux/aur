# Maintainer: Jia Qingtong <jiaqingtong97@gmail.com>

_pkgbase=virtual-touchpad-driver
pkgname=virtual-touchpad-driver-dkms
pkgver=r37.a4633ea
pkgrel=1
pkgdesc="The Virtual Touchpad Driver (DKMS)"
arch=('x86_64' 'aarch64' 'loongarch64')
url="https://github.com/wanywhn/VirtualTouchPadDriver"
license=('GPL2')
depends=('dkms')
conflicts=("${_pkgbase}")
source=("${_pkgbase}::git+${url}#tag=v1.1.0"
		dkms.conf
        )

md5sums=(
		'SKIP'
		'4b0482e17cc64830fe298bf13e28ec5c'
)

prepare() {
  cd ${_pkgbase}
}

pkgver() {
  cd ${_pkgbase}
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

package() {

  mkdir "${pkgdir}"/usr/src/${_pkgbase}-${pkgver} -p

  # Copy sources (including Makefile)
  cp -r ${_pkgbase}/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/

  # Copy dkms.conf
  install -Dm644 ${_pkgbase}/dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Blacklists conflicting module
  #install -Dm644 ${pkgname}.conf "${srcdir}/usr/lib/modprobe.d/${pkgname}.conf"
}
