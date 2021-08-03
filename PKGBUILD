# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Moritz Lipp <mlq@pwmt.org>

_pkgname=freerct
pkgname=${_pkgname}-git
pkgver=r1819.da71e14d
pkgrel=1
pkgdesc="Open Source RollerCoaster Tycoon 1 and 2 implementation"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/FreeRCT/FreeRCT"
license=('GPL2')
depends=('sdl2' 'sdl2_ttf' 'libzip' 'libpng' 'gnu-free-fonts')
makedepends=('git' 'cmake')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=('freerct::git+https://github.com/FreeRCT/FreeRCT.git'
        'freerct.cfg'
        'freerct.sh'
        'freerct.desktop')
md5sums=('SKIP'
         '18954cf6a20a8d8b21c62e7c9c27a76d'
         '1fce36e419ae2d70a28eba03f9cb6fa1'
         '9e3aaa8cef3d81b27b868766b61f74a4')

build() {
  cd "${srcdir}/${_pkgname}"
  cmake .
  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  mkdir -p "${pkgdir}/opt/freerct/saves/"
  mkdir -p "${pkgdir}/usr/bin"

  # install all files
  cp -r bin/* "${pkgdir}/opt/freerct/"

  # create savegame outside of installdir
  chmod 777 "${pkgdir}/opt/freerct/saves/"
  ln -s "/opt/freerct/saves/saved.fct" "${pkgdir}/opt/freerct/saved.fct"  

  # install executeables
  install -D -m755 "${srcdir}/freerct.sh" "${pkgdir}/usr/bin/freerct"

  # install freerct.cfg
  install -D -m664 "${srcdir}/freerct.cfg" "${pkgdir}/opt/freerct"

  # install LICENSE
  install -D -m664 LICENSE-gpl-2.0.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "${srcdir}/${_pkgname}/graphics/sprites/logo/logo.png" ${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/${_pkgname}.png
  #install -Dm644 "${srcdir}/../${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${startdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# vim:set ts=2 sw=2 et:
