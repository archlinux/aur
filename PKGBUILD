# Maintainer: Andrey Trishin <zatrit at gmail dot com>
_pkgbase=uniwill-laptop
_branch=infinitybook_gen10
pkgname=uniwill-laptop-dkms-git
pkgver=r37.03e7d36
pkgrel=1
pkgdesc="Uniwill laptop platform driver (DKMS, ${_branch} branch)"
arch=('x86_64')
url='https://github.com/Wer-Wolf/uniwill-laptop'
license=('GPL2')
depends=('dkms')
makedepends=('git')
conflicts=('uniwill-laptop')
provides=('uniwill-laptop')

source=("${_pkgbase}::git+${url}.git#branch=${_branch}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgbase}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgbase}"

  # ensure clean tree
  make clean
}

package() {
  cd "${srcdir}/${_pkgbase}"

  # DKMS source directory
  install -dm755 "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"

  # copy all sources
  cp -r . "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/"

  # remove git metadata
  rm -rf "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/.git"

  cat >"${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf" <<EOF
PACKAGE_NAME="${_pkgbase}"
PACKAGE_VERSION="${pkgver}"
BUILT_MODULE_NAME[0]="${_pkgbase}"
DEST_MODULE_LOCATION[0]="/kernel/drivers/platform/x86"
AUTOINSTALL="yes"
EOF
}
