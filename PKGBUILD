# Maintainer:  dreieck 
# Contributor: orumin <dev@orum.in>

_pkgname=wacom-utility
pkgname="${_pkgname}-git"
pkgver=r25.20190330.6bad1ce
pkgrel=4
pkgdesc="Graphical tablet configuration utility. Old software, does not support the new(est) hardware."
arch=('any')
url="http://github.com/lubosz/wacom-utility"
license=('GPL-2.0-or-later')
depends=(
  'gtk2'
  'python2'
  'sh'
  'xf86-input-wacom'
  'gksu'
)
makedepends=(
  'git'
  'zopflipng-parallel'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
  "${_pkgname}::git+${url}.git"
  'wacom-utility.sh'
  'wacom-utility.desktop'
)
sha256sums=(
  'SKIP'
  'SKIP'
  'c6235b40e55aa7266d7bc47a2f11bcef98c3bb30c4d80223ee910c6b461bebc2'
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > "git.log"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_rev}" ]; then
    error "Git commit count could not be determined."
    return 1
  else
    printf '%s' "r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}/${_pkgname}"

  zopflipng-parallel -m -- images/*.png images/pad/*.png
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -dvm755 "${pkgdir}"/usr/share/wacom-utility
  install -dvm755 "${pkgdir}"/usr/share/applications

  cp -av ./* "${pkgdir}"/usr/share/wacom-utility
  install -Dvm644 -t "${pkgdir}"/usr/share/applications "${srcdir}"/wacom-utility.desktop
  install -Dvm755 "${srcdir}/wacom-utility.sh" "${pkgdir}/usr/bin/wacom-utility"

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}"      git.log
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  LICENSE
}
