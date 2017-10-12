# Maintainer: Francois Menning <f.menning@protonmail.com>
# Contributor: graysky <graysky AT archlnux.us>
# Contributor: FSven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>

_pkgname=nct6775
_extramodules=extramodules-4.10-ARCH
pkgname=nct6775-git
pkgver=r152.b79b887
pkgrel=1
pkgdesc="New driver for Nuvoton NCT6775F, NCT6776F, NCT6779D."
url="http://roeck-us.net/linux/drivers/"
license=("GPL")
arch=('i686' 'x86_64')
depends=('linux>=4.10')
makedepends=('linux-headers>=4.10')
install=$_pkgname.install
source=("$_pkgname::git://github.com/groeck/nct6775.git")
sha256sums=('SKIP')
provides=('nct6775')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"

  _kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
  make KERNEL_BUILD=/usr/lib/modules/"${_kernver}/build" \
    KERNEL_MODULES=/usr/lib/modules/"${_kernver}" modules
}

package() {
  install -Dm644 "${srcdir}/${_pkgname}/nct6775.ko" \
  "${pkgdir}/usr/lib/modules/${_extramodules}/nct6775.ko"

  gzip -9 "${pkgdir}/usr/lib/modules/${_extramodules}/"*.ko
}
