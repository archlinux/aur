# Maintainer : MorsMortium <morsmortium@disroot.org>

_pkgname=obs-studio-themed
pkgname=${_pkgname}-git
pkgver=r7.2a5db44
pkgrel=1
pkgdesc='A themed look for OBS Studio'
arch=("x86_64")
url="https://codeberg.org/MorsMortium/${_pkgname}"
license=('GPL-2.0-or-later')
depends+=('obs-studio')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
sha512sums=('SKIP')
source=("${pkgname}::git+${url}.git")

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  g++ -shared -fPIC -o libQtForceStyle.so ./QtForceStyle.cpp $(pkg-config \
    --cflags --libs Qt6Widgets) -DQ_OBJECT_INSTALL_EVENT_FILTER_NAME=$(nm -D \
    $(ldconfig -p | grep libQt6Widgets.so | head -n 1 | rev | cut -d' ' -f1 | \
    rev) | grep installEventFilter | rev | cut -d' ' -f1 | rev | cut -d'@' -f1)
}

package() {
  cd "${srcdir}/${pkgname}"
  mkdir -p ${pkgdir}/usr/share/obs/obs-studio/themes/ ${pkgdir}/usr/lib/
  install -Dm 644 Themed.obt ${pkgdir}/usr/share/obs/obs-studio/themes/
  install -Dm 644 Themed_Dark.ovt ${pkgdir}/usr/share/obs/obs-studio/themes/
  install -Dm 644 Themed_Light.ovt ${pkgdir}/usr/share/obs/obs-studio/themes/
  install -Dm 644 libQtForceStyle.so ${pkgdir}/usr/lib/
}
