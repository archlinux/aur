# Maintainer: Yohann Rebattu <yohann AT rebattu · fr>
_pkgname=hamster-shell-extension
pkgname=$_pkgname-git
pkgver=20220623.g495a37a
pkgrel=1
pkgdesc="Shell extension for project hamster - the GNOME time tracker"
arch=(any)
url="https://github.com/projecthamster/shell-extension"
license=('GPL')
depends=('hamster-time-tracker' 'gnome-shell')
makedepends=('git' 'wget')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("git+https://github.com/projecthamster/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  _date=$(git show -s --format='%ci' | cut -d' ' -f1 | sed 's/-//g')
  _hash=$(git show -s --format='%h')
  echo "${_date}.g${_hash}"
}

build() {
  cd "${srcdir}/${_pkgname}"
  make clean-build
  make collect
  make compile
}

package() {
  cd "${srcdir}/${_pkgname}"
  _uuid=$(sed -n 's/^.*"uuid"\s*:\s*"\([^"]*\)".*$/\1/p' build/metadata.json)
  _target="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
  mkdir -p "${_target}"
  cp -r build/* "${_target}"
}

# vim:set ts=2 sw=2 et:
