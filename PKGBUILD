# Maintainer: joaquín Ignacio Aramendía <samsagax at gmail dot com>

_pkgbase=hp-vendor
pkgname=${_pkgbase}-dkms-git
pkgver=r279.67a92d0
pkgrel=2
pkgdesc="HP Dev One specific platform driver from Pop!_OS"
arch=('x86_64')
url="https://github.com/pop-os/hp-vendor"
license=('GPL')
depends=('dkms')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")
install=
source=("${_pkgbase}::git+https://github.com/pop-os/${_pkgbase}.git"
    dkms.conf)
md5sums=('SKIP'
    'f18343301f682c68137c25234cf52f19')

pkgver() {
  cd "$srcdir/${_pkgbase}"

  # Git, no tags available
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${_pkgbase}"
    DKMS_SRC="${pkgdir}"/usr/src/${_pkgbase//-/_}-${pkgver}

  install -Dm644 ${srcdir}/dkms.conf ${DKMS_SRC}/dkms.conf

# Set name and version
    sed -e "s/@_PKGBASE@/${_pkgbase//-/_}/" \
    -e "s/@PKGVER@/${pkgver}/" \
    -i "${DKMS_SRC}"/dkms.conf

    install -m 644 dkms/LICENSE ${DKMS_SRC}
  install -m 644 dkms/Makefile ${DKMS_SRC}
  install -m 644 dkms/hp_vendor.c ${DKMS_SRC}
}

# vim:set ts=8 sts=2 sw=2 et:
