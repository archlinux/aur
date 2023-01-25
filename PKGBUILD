# Maintainer: main() <main@ehvag.de>

_pkgbase=aquacomputer_d5next-hwmon
pkgname=aquacomputer_d5next-hwmon-dkms
pkgver=1
pkgrel=2
pkgdesc="Hwmon Linux kernel driver for monitoring and configuring Aquacomputer PC watercooling devices"
arch=('x86_64')
url="https://github.com/aleksamagicka/aquacomputer_d5next-hwmon"
license=('GPL2')
depends=('dkms')
conflicts=("${_pkgbase}")
source=("repo::git+${url}"
        'dkms.conf')
md5sums=('SKIP'
         '9083307a12a4b7dfc35d733f68d8200d')


package() {
  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Patch version
  echo 'MODULE_VERSION("git");' >> "repo/aquacomputer_d5next.c"

  # Copy sources (including Makefile)
  cp -r repo/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
  rm -r "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/re-docs
}
