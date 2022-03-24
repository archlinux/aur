# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Moritz Lipp <mlq@pwmt.org>

_pkgname=freerct
pkgname=${_pkgname}-git
pkgver=r2073.4a8090ac
pkgrel=1
pkgdesc="Open Source RollerCoaster Tycoon 1 and 2 implementation"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/FreeRCT/FreeRCT"
license=('GPL2')
depends=('sdl2' 'sdl2_ttf' 'libzip' 'libpng' 'gnu-free-fonts')
makedepends=('git' 'cmake')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
backup=('opt/freerct/saves/')
source=('freerct::git+https://github.com/FreeRCT/FreeRCT.git'
        'freerct.cfg'
        'freerct.sh'
        'freerct.desktop')
sha256sums=('SKIP'
         '52466c813687b5d3e35e869ed914257c6220c77a7f01e9edd8f830b69624060f'
         'e61ab45bce360d4cd064b0f08a95f684b427d0e77e23f9110f4f808e963e5ed8'
         '4f46db97802259b30ba33b69c5bc9433983e0349ce989d6e29dfdd7b8d10b293')

build() {
  cd "${srcdir}/${_pkgname}"
  cmake -DCMAKE_INSTALL_PREFIX='/opt/' .
  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  mkdir -p "${pkgdir}/opt/freerct/"
  mkdir -p "${pkgdir}/usr/bin"

  # install all files
  cp -r bin/* "${pkgdir}/opt/freerct/"

  # install data
  cp -r data "${pkgdir}/opt/freerct/"

  # install executeables
  install -D -m755 "${srcdir}/freerct.sh" "${pkgdir}/usr/bin/freerct"

  # install freerct.cfg
  install -D -m664 "${srcdir}/freerct.cfg" "${pkgdir}/opt/freerct"

  # install LICENSE
  install -D -m664 LICENSE-gpl-2.0.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "${srcdir}/${_pkgname}/graphics/sprites/logo/logo.png" ${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/${_pkgname}.png
  install -Dm644 "${startdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# vim:set ts=2 sw=2 et:
