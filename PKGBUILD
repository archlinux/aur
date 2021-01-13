# Maintainer: jomp16 <root at rwx dot ovh>

_pkgbase=qc71_laptop
pkgname=qc71-laptop-dkms-git
pkgver=r45.bbf0af8
pkgrel=1
pkgdesc="This a Linux kernel platform driver for Intel Whitebook LAPQC71X systems"
arch=('i686' 'x86_64')
url="https://github.com/pobrn/qc71_laptop"
license=('GPL2')
depends=('dkms')
conflicts=("${_pkgbase}")
source=("$_pkgbase::git+https://github.com/pobrn/qc71_laptop.git"
        'dkms.conf')
sha256sums=('SKIP'
            '08251ea8ec3721b023f30a7b34842936b42a92c6d4e1ed5a2a0948f806382211')

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
