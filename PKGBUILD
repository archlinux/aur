# Maintainer : MorsMortium <morsmortium@disroot.org>

_pkgname=babyobounce
pkgname=${_pkgname}-git
pkgver=r39.b444492
pkgrel=1
pkgdesc='A 3D remake of a QBasic game called Baby'
arch=('x86_64')
url="https://gitlab.com/Modanung/${_pkgname}"
license=('GPL-3.0-or-later' 'CC0-1.0' 'CC-BY-3.0' 'CC-BY-4.0' 'CC-BY-SA-4.0')
depends=('dry' 'hicolor-icon-theme')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=('git' 'qt5-base')
sha512sums=('SKIP')
source=("${pkgname}::git+${url}.git")

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  rm -f Dry
  ln -s /opt/dry/ Dry
  git apply ../../Resources.patch
  qmake BabyOBounce.pro "DATADIR=/usr/share"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm 644 "${srcdir}/${pkgname}/Resources/Textures/Baby.png" ${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png
  install -Dm 755 bob ${pkgdir}/usr/bin/${_pkgname}
  install -Dm 755 ../../${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
  mkdir -p ${pkgdir}/usr/share/${_pkgname}
  cp -R "${srcdir}/${pkgname}/Resources/." ${pkgdir}/usr/share/${_pkgname}/
}
