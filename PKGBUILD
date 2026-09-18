# Maintainer : MorsMortium <morsmortium@disroot.org>

_pkgname=artificial-rage
pkgname=${_pkgname}-git
pkgver=r537.cb66c29
pkgrel=1
pkgdesc='Scifi FPS made with Raylib'
arch=('x86_64')
url="https://sr.ht/~akselmo/ArtificialRage/"
license=('GPL-3.0-or-later')
depends=('odin' 'raylib')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=('git')
sha512sums=('SKIP')
source=("${pkgname}::git+https://git.sr.ht/~akselmo/${_pkgname}")

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  mkdir -p ./build ./src/raylib

  # The odin package is unable to use the system raylib and the raylib it has is
  # not built. A local version is made, modified to use the system package and
  # the game is modified to use the local version
  find ./src -type f -exec sed -i 's/import rl "vendor:raylib"/import rl "src:raylib"/g' {} +
  cp /usr/lib/odin/vendor/raylib/raylib.odin src/raylib/
  sed -i \
    -e 's|"linux/libraylib\.so\.600" when RAYLIB_SHARED else "linux/libraylib\.a"|"system:raylib"|' \
    -e 's|"linux-arm64/libraylib\.so\.600" when RAYLIB_SHARED else "linux-arm64/libraylib\.a"|"system:raylib"|' \
    ./src/raylib/raylib.odin
  ln -s /usr/lib/odin/vendor/raylib/raymath.odin src/raylib/raymath.odin
  ln -s /usr/lib/odin/vendor/raylib/raygui.odin src/raylib/raygui.odin
  ln -s /usr/lib/odin/vendor/raylib/easings.odin src/raylib/easings.odin
  ln -s /usr/lib/odin/vendor/raylib/rlgl src/raylib/rlgl

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
