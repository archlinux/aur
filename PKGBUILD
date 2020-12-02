# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=fotowall-git
pkgver=1.0.r833.g7d12301
pkgrel=2
pkgdesc="A creative tool that allows you to layout your photos or pictures in a personal way"
arch=('x86_64')
url="https://github.com/enricoros/fotowall"
license=('GPL2')
depends=('desktop-file-utils' 'qt5-svg')
makedepends=('git' 'qt5-tools')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  ver=$(grep "ApplicationVersion(" main.cpp | awk -F '"' '{print $2}')
  printf "%s.r%s.g%s" "$ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname%-*}"
  sed -i 's|#include <QPainter>|#include <QPainter>\n#include <QPainterPath>|'  3rdparty/posterazor/paintcanvas.cpp
}

build() {
  cd "${pkgname%-*}"
  sed -i 's|Icon=fotowall|Icon=/usr/share/pixmaps/fotowall.png|' "${pkgname%-*}.desktop"
  # generate the missing fotowall_ru_Ru.qm translation
  lrelease-qt5 -silent -compress -removeidentical fotowall.pri
  qmake-qt5 PREFIX=/usr
  make
}

package() {
  make -C "${pkgname%-*}" INSTALL_ROOT="${pkgdir}/" install
}
