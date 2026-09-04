pkgname=qwt-multiaxes-updated-git
pkgver=r182.34c2c7e
pkgrel=1
pkgdesc="Qt Widgets for Technical Applications -- analog devices fork, qwt-multiaxes-updated branch"
url="https://github.com/cseci/qwt"
arch=(x86_64)
depends=(
qt5-base
qt5-svg
glibc
gcc-libs
)
optdepends=(
'qt5-tools: For Designer plugin'
)
makedepends=(
git
qt5-tools
)
license=('custom:qwt')
conflicts=(qwt-multiaxes-git)
source=("git+https://github.com/cseci/qwt.git#branch=qwt-multiaxes-updated")
b2sums=('SKIP')

pkgver() {
  cd qwt
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
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
  make INSTALL_ROOT="${pkgdir}/opt/qwt-multiaxes-updated" install
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"

  install -d "${pkgdir}/usr/lib"
  ln -s /opt/qwt-multiaxes/usr/lib/libqwt.so.6.4.0 "${pkgdir}/usr/lib/libqwt.so.6.4.0"
}
