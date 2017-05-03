# $Id: PKGBUILD 240297 2015-06-03 10:22:03Z fyan $
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt5-wayland-compositor
provides=('qt5-wayland')
conflicts=('qt5-wayland')
_pkgname=qt5-wayland
_qtver=5.7.0
pkgver=${_qtver/-/}
pkgrel=1
arch=('i686' 'x86_64' 'armv7h')
url='http://qt-project.org/'
license=('GPL3' 'LGPL3' 'FDL' 'custom')
pkgdesc='Provides APIs for Wayland'
depends=('qt5-declarative' 'libxcomposite')
groups=('qt' 'qt5')
_pkgfqn="${_pkgname/5-/}-opensource-src-${_qtver}"
source=("http://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz"
        qtbug-53945.patch::"https://github.com/qtproject/qtwayland/commit/75294be3.patch"
	pkgconfig_hybris-egl-platform.patch
	display.patch)
md5sums=('2d2543a2564ee1b5db9f25dca9cc2e3b'
         '887f656b651e230169ce02753f14d746'
	 '9b29fe70bae05930a99ee50336843188'
	 'SKIP')

prepare() {
  mkdir -p build

  cd ${_pkgfqn}
# Fix out-of-tree build
  patch -p1 -i ../qtbug-53945.patch

# hybris
  patch -p1 -i ../pkgconfig_hybris-egl-platform.patch
  patch -p1 -i ../display.patch
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
  ln -s /usr/share/licenses/qt5-base "$pkgdir"/usr/share/licenses/${_pkgname}
}

