# Maintainer : MorsMortium <morsmortium@disroot.org>

_pkgname=artificial-rage
pkgname=${_pkgname}-git
pkgver=r525.7a9f73d
pkgrel=1
pkgdesc='Scifi FPS made with Raylib'
arch=('x86_64')
url="https://codeberg.org/akselmo/${_pkgname}"
license=('GPL-3.0-or-later')
depends=('odin' 'raylib')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=('git')
sha512sums=('SKIP')
source=("${pkgname}::git+${url}.git")

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  mkdir -p ./build
  odin build ./src -collection:src=src -debug -out:./build/ArtificialRage
}

package() {
  mkdir -p ${pkgdir}/usr/share/${_pkgname} ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/applications

  cp -R "${srcdir}/${pkgname}/build/." ${pkgdir}/usr/share/${_pkgname}/
  cp -R "${srcdir}/${pkgname}/assets" ${pkgdir}/usr/share/${_pkgname}/

  echo $'#!/usr/bin/env sh\ncd /usr/share/artificial-rage\n./ArtificialRage' > ${pkgdir}/usr/bin/${_pkgname}
  chmod 755 ${pkgdir}/usr/bin/${_pkgname}

  install -Dm 644 "${srcdir}/${pkgname}/other_assets/ar_2.png" ${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png
  echo $'[Desktop Entry]\nExec=artificial-rage\nIcon=artificial-rage\nName=Artificial Rage\nPath=\nType=Application\nCategories=Game;\nComment=Scifi FPS made with Raylib\n' > ${pkgdir}/usr/share/applications/${_pkgname}.desktop
}
