# Maintainer: Benjamin Maisonnas <ben at wainei dot net>
# Author: Benjamin Maisonnas <ben at wainei dot net>

_pkgbase=corsairpsu
pkgname=corsairpsu-dkms-git
pkgver=4.c757544
pkgrel=1
pkgdesc="Linux kernel driver for reading sensors for Corsair RMi/HXi Series PSUs"
arch=('x86_64' 'i686')
url="https://github.com/benzhaomin/corsairpsu"
license=('GPL2')
depends=('dkms')
makedepends=('git' 'linux-headers')
provides=('corsairpsu')

source=("$_pkgbase::git+$url.git"
        "Makefile"
        "dkms.conf"
        "$_pkgbase.conf")

sha256sums=('SKIP'
            '46ab8a4d60a9db7a1957d199fc20da09d0195df80cd64ad6ffddea17b5fd75c8'
            '9eb35ca8dcff02744dd3256238f22bfe6ebaf1636867aabed4c40a31073c4e1e'
            '4fee830333d13c385e2c27bc74d3473304794d62a739fa614073f045e6039f58')

pkgver() {
  cd "$srcdir/$_pkgbase"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgbase"
}

package() {
  cd "$srcdir/$_pkgbase"

  install -d "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
  cp -r ${srcdir}/${_pkgbase}/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/

  install -Dm644 ${srcdir}/Makefile "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/Makefile
  install -Dm644 ${srcdir}/dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
    -e "s/@PKGVER@/${pkgver}/" \
    -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  install -Dm644 ${srcdir}/${_pkgbase}.conf "${pkgdir}"/usr/lib/depmod.d/${_pkgbase}.conf
}
