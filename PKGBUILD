# Maintainer: jomp16 <root at rwx dot ovh>

_pkgbase=qc71_laptop
pkgname=qc71-laptop-dkms-git
pkgver=r81.ebab4af
pkgrel=1
pkgdesc="This a Linux kernel platform driver for Intel Whitebook LAPQC71X systems"
arch=('i686' 'x86_64')
url="https://github.com/pobrn/qc71_laptop"
license=('GPL-2.0-only')
depends=('dkms')
makedepends=('git')
conflicts=("${_pkgbase}")
source=("$_pkgbase::git+https://github.com/pobrn/qc71_laptop.git"
        'dkms.conf')
sha256sums=('SKIP'
             '9c35881f30e9186f40f1ac5c7eae0c85d48b2f164b2de031916c03490177abcb')

pkgver() {
  cd "$_pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgbase"

  install -d "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/

  # Copy sources (including Makefile)
  cp -r ${srcdir}/${_pkgbase}/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/

  # Copy dkms.conf
  install -Dm644 ${srcdir}/dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
