# Maintainer : MorsMortium <morsmortium@disroot.org>

_pkgname=deskblob
pkgname=${_pkgname}-git
pkgver=r30.2e3ea21
pkgrel=1
pkgdesc='A cyberplasmic desktop toy'
arch=('x86_64')
url="https://gitlab.com/Modanung/${_pkgname}"
license=('GPL-2.0-or-later' 'CC0-1.0')
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
  qmake Deskblob.pro "DATADIR=/usr/share"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm 644 "${srcdir}/${pkgname}/Resources/icon.png" ${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png
  install -Dm 755 ${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
  install -Dm 755 ../../${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
  mkdir -p ${pkgdir}/usr/share/${_pkgname}
  cp -R "${srcdir}/${pkgname}/Resources/." ${pkgdir}/usr/share/${_pkgname}/
}
