# Maintainer: Ewout van Mansom <ewout@vanmansom.name>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-pip-on-top-gnome43
_pkgname=gnome-shell-extension-pip-on-top
pkgver=43.alpha
pkgrel=1
pkgdesc='Makes Picture-in-Picture windows stay on top'
url="https://github.com/Rafostar/gnome-shell-extension-pip-on-top"
arch=('any')
license=('GPL2')
depends=('gnome-shell>=43')
makedepends=('git' 'meson' 'jq')
optdepends=('clapper')
conflicts=("${pkgname%-gnome43}" "${_pkgname}-git")
provides=("${pkgname%-gnome43}")
_cvsdir="${_pkgname}-${pkgver:0:2}"
source=(
  "${_cvsdir}::git+${url}.git"
 "gnome43-comp.patch"
)
# "gnome43-comp.patch::https://patch-diff.githubusercontent.com/raw/ubuntu/gnome-shell-extension-pip-on-top/pull/351.patch"

b2sums=('SKIP'
        '56fdcac533def2de827433967b2d4081b488f759a4207f2f20e9e825fedcb36aabe168b4b494f2e479b5bf54c0baa6681269ad269ac3809f4b68bd5cfa935783')

prepare() {
  cd "${_cvsdir}"
  patch --forward --strip=1 --input="${srcdir}/gnome43-comp.patch"
  ./translate.sh
}

build() {
  cd "${_cvsdir}"
  ./bundle.sh
}

package() {
  cd "${_cvsdir}"

  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
  bsdtar -xvf ${uuid}.zip -C "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"

  # this file is generated at pkg install time
  #rm "${pkgdir}/usr/share/glib-2.0/schemas/gschemas.compiled"
}

# vim: ts=2 sw=2 et:
