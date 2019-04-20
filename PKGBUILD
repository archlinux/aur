# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=qt5-webglplugin
_qtver=5.12.3
pkgver=${_qtver/-/}
pkgrel=1
arch=(x86_64)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='QPA plugin for running an application via a browser using streamed WebGL commands'
depends=(qt5-websockets qt5-declarative)
groups=(qt qt5)
_pkgfqn="${pkgname/5-/}-everywhere-src-${_qtver}"
source=("https://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz")
sha256sums=('23da63013101e97c4e663bb4f6dbb1c7b4386679c634680d3b8d79bcc59d26b3')

prepare() {
  mkdir -p build
}

build() {
  cd build

  qmake ../${_pkgfqn}
  make
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir" install

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/usr/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

  install -d "$pkgdir"/usr/share/licenses
  ln -s /usr/share/licenses/qt5-base "$pkgdir"/usr/share/licenses/${pkgname}
}
