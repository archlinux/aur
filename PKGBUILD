# Maintainer: Daniel Hillenbrand <codeworkx at bbqlinux dot org>

_pkgbase=it87
pkgname=it87-frankcrawford-dkms-git
pkgver=152.2b8b4fe
pkgrel=1
pkgdesc="Linux Driver for ITE LPC chips, using frankcrawford's upstream"
arch=('x86_64' 'i686')
url="https://github.com/frankcrawford/it87"
license=('GPL')
depends=('make' 'gcc' 'linux' 'dkms')
makedepends=('git' 'linux-headers')
provides=('it87')

source=("$_pkgbase::git+https://github.com/frankcrawford/it87.git"
        "dkms.conf"
        "it87.conf")

sha256sums=('SKIP'
            '9eb35ca8dcff02744dd3256238f22bfe6ebaf1636867aabed4c40a31073c4e1e'
            'acdc488d1505e891ed6259b29428d4b27d26d18e3ea170f017b930390d6420e7')

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

  install -Dm644 ${srcdir}/dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
    -e "s/@PKGVER@/${pkgver}/" \
    -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  install -Dm644 ${srcdir}/it87.conf "${pkgdir}"/usr/lib/depmod.d/it87.conf
}
