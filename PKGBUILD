# Maintainer: Ignacio Collado <nacho_16_89 at hotmail dot com>

_pkgbase=8192eu
pkgname=8192eu-dkms
pkgver=22.f016814
pkgrel=1
pkgdesc="Driver for the Realtek 8192eu chipset (DKMS)"
arch=('x86_64' 'i686' 'armv7h')
url="https://github.com/Mange/rtl8192eu-linux-driver"
license=('GPL')
depends=('dkms')
provides=('rtl8192eu')
source=("$_pkgbase::git+https://github.com/Mange/rtl8192eu-linux-driver.git"
        "dkms.conf"
        "debug.patch")
md5sums=('SKIP'
         '8de530a97c31c0a4eb08c964e0e29abf'
         '9ade363eaedcb11cfcf08603d1f487c0')

pkgver() {
  cd "$srcdir/$_pkgbase"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgbase"
  # Disable debug
  patch -p1 -i $srcdir/debug.patch
}

package() {
  cd "$srcdir/$_pkgbase"
  install -Dm644 ${srcdir}/dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
    -e "s/@PKGVER@/${pkgver}/" \
    -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
  cp -r ${srcdir}/${_pkgbase}/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
}
