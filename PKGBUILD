# Maintainer: Edward Pacman <edward@edward-p.xyz>

pkgname=netfilter-fullconenat-dkms-git
pkgver=r70.d4daedd
pkgrel=2
pkgdesc="A kernel module that turns MASQUERADE into full cone SNAT"
arch=('any')
url="https://github.com/Chion82/netfilter-full-cone-nat"
license=('GPL2')
depends=('dkms')
makedepends=('git')
optdepends=('iptables-fullconenat: iptables with FULLCONENAT')
source=("dkms.conf"
        "Makefile.patch"
        "${pkgname}::git+https://github.com/Chion82/netfilter-full-cone-nat.git")
sha256sums=('553c415217d002b3b431a8edb55f66ce161b9f47291131a40eda3e11d9d50499'
            'f6bc9f9af531c8f2bdcd8fe8eb7bc724904c3f7dfb1eaa33f0c91efd583fa548'
            'SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${pkgname}"
  patch -p1 -i "${srcdir}"/Makefile.patch
}

package() {
  # Install dkms.conf
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${pkgname}-${pkgver}/dkms.conf

  # Set name and version
  sed -e "s/@PKGNAME@/${pkgname}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${pkgname}-${pkgver}/dkms.conf

  # Install sources (including Makefile)
  cp -r ${pkgname}/* "${pkgdir}"/usr/src/${pkgname}-${pkgver}/
}
