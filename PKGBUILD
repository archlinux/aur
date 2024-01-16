# Maintainer: Nachoc <nachohc89 at gmail dot com>

_pkgbase=8192eu
pkgname=8192eu-dkms-git
pkgver=r293.f2fc8af
pkgrel=1
pkgdesc="Driver for the Realtek 8192eu chipset (DKMS)"
arch=('x86_64' 'i686' 'armv7h')
url="https://github.com/Mange/rtl8192eu-linux-driver"
license=('GPL')
depends=('dkms')
makedepends=('git')
provides=('rtl8192eu' '8192eu-dkms')
conflicts=('8192eu-dkms')
source=("$_pkgbase::git+https://github.com/Mange/rtl8192eu-linux-driver.git#branch=realtek-4.4.x")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgbase"
  sed -E \
    -e "s/^PACKAGE_NAME=.*$/PACKAGE_NAME=${_pkgbase}/" \
    -e "s/^PACKAGE_VERSION=.*$/PACKAGE_VERSION=${pkgver}/" \
    -e "s/(make'? )/\1${MAKEFLAGS} /g" \
    -e "s/^REMAKE_INITRD=.*$//" \
    -i dkms.conf
}

package() {
  cd "$srcdir/$_pkgbase"
  install -dm755 "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}
  cp -r ${srcdir}/${_pkgbase}/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
}
