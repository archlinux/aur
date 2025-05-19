# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Ronald van Haren <ronald.archlinux.org>

pkgname=qwt-multiaxes-git
pkgver=r158.3b71f45
pkgrel=1
pkgdesc="Qt Widgets for Technical Applications"
url="https://github.com/cseci/qwt"
arch=(x86_64)
depends=(qt5-base qt5-svg glibc gcc-libs)
optdepends=('qt5-tools: For Designer plugin')
makedepends=(git qt5-tools)
license=(LicenseRef-Qwt_License)
source=("git+https://github.com/cseci/qwt.git")
sha512sums=('SKIP')

pkgver() {
  cd qwt
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd qwt

  sed -e '/^\s*QWT_INSTALL_PREFIX/ s|=.*|= /usr|' \
      -e '/^QWT_INSTALL_DOCS/ s|/doc|/share/doc/qwt|' \
      -e '/^QWT_INSTALL_HEADERS/ s|include|&/qwt|' \
      -e '/^QWT_INSTALL_PLUGINS/ s|plugins/designer|lib/qt/&|' \
      -e '/^QWT_INSTALL_FEATURES/ s|features|lib/qt/mkspecs/&|' \
      -i qwtconfig.pri
}

build() {
  cd qwt
  qmake-qt5 qwt.pro
  make
}

package() {
  cd qwt
  make INSTALL_ROOT="${pkgdir}/opt/qwt-multiaxes" install
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"

  install -d "${pkgdir}/usr/lib"
  ln -s /opt/qwt-multiaxes/usr/lib/libqwt.so.6.4.0 "${pkgdir}/usr/lib/libqwt.so.6.4.0"
}
