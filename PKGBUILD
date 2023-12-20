# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=framework-laptop-kmod-dkms-git
_pkgbase=framework-laptop-kmod
_modname=framework_laptop
pkgver=r14.d5367eb
pkgrel=1
pkgdesc="Kernel module to expose more Framework Laptop stuff"
arch=(x86_64)
url="https://github.com/DHowett/framework-laptop-kmod"
license=('GPL')
depends=('dkms')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('framework-laptop-kmod::git+https://github.com/DHowett/framework-laptop-kmod'
        'dkms.conf')
sha256sums=('SKIP'
            'f83bb5bff72db632a11dfe8876e429adc6221d574502428796944221d0da5427')

pkgver() {
  cd "${srcdir}/${_pkgbase}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}"

  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@MODNAME@/${_modname}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Copy sources (including Makefile)
  cp -r ${_pkgbase}/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
}
