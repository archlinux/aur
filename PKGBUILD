# Maintainer: Jean-Michaël Celerier <jeanmichael.celerier@gmail.com>

pkgname=qt5-shadertools-git
pkgver=r33.ef4b17c
pkgrel=1
arch=('x86_64')
url='https://www.qt.io'
license=('GPL3' 'LGPL3' 'FDL' 'custom')
pkgdesc='QtShaderTools module for Qt5'
depends=('qt5-base' 'vulkan-headers')
makedepends=('git')
optdepends=('vulkan-extra-layers')
groups=('qt' 'qt5')
source=('git://github.com/jcelerier/qtshadertools.git')
sha256sums=('SKIP')

pkgver() {
  cd qtshadertools
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build

  qmake ../qtshadertools
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
