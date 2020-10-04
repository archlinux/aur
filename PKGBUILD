# Maintainer: Tony Fettes <feihaoxiang2014@gmail.com>

pkgname=bibata-extra-cursor-git
_gitname=Bibata_Extra_Cursor
pkgver=r44.7cdac56
pkgrel=1
pkgdesc="Extra Material Based Cursor Theme"
arch=('any')
url="https://github.com/KaizIqbal/Bibata_Extra_Cursor"
license=('GPL3')
makedepends=('git' 'python' 'inkscape' 'xorg-xcursorgen' 'python-pillow')
provides=('bibata-extra-cursor')
conflicts=('bibata-extra-cursor')
source=("git+${url}.git")
sha256sums=('SKIP')
_variants=(Bibata_Dark_Red Bibata_Dodger_Blue Bibata_Pink Bibata_Turquoise)

pkgver() {
  cd ${_gitname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_gitname}"
  for _variant in ${_variants[*]}; do
    rm -rf "${_variant}/out/"
  done
}

build() {
  cd "${srcdir}/${_gitname}"
  for _variant in ${_variants[*]}; do
    python render-cursors.py ./src/"${_variant}"/source-cursors.svg -o -a --name ${_variant}
    sh tweak.sh "${_variant}"
    sh x11-make.sh "${_variant}"
    cp src/"${_variant}"/*.theme "${_variant}"/out/X11/"${_variant}"
  done
}

package() {
  install -d "${pkgdir}/usr/share/icons"
  for _variant in ${_variants[*]}; do
    mv "${srcdir}/${_gitname}/${_variant}/out/X11/${_variant}" "${pkgdir}/usr/share/icons"
  done
}
