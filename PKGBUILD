# Maintainer: Luis Batalha <lfrb25 at gmail dot com>

commit_hash=5a6cf1f99b1b922ad21f4f6dff9d0ce99cc686cc
source_dir='ek-loop-connect'

_pkgbase=('ek-loop-connect')
pkgname=('ek-loop-connect-dkms')
pkgver=r1.5a6cf1f
pkgrel=1
pkgdesc="Linux hwmon driver for EK Loop Connect"
arch=('x86_64')
url='https://github.com/pavelherr/ek-loop-connect'
license=('GPL2')
source=("$source_dir::git+https://github.com/pavelherr/ek-loop-connect#commit=$commit_hash"
        'dkms.conf')
makedepends=('git')
depends=('dkms')
sha256sums=('SKIP'
            '4bc96ea0b235cdd3ff712048599503acd5a14a3c8a22a06714712a5a2e3097c1')
provides=('ek-loop-connect')

pkgver() {
  cd $source_dir
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Copy sources (including Makefile)
  cp -r ${_pkgbase}/module/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
}
