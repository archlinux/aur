# $Id: PKGBUILD 240297 2015-06-03 10:22:03Z fyan $
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Michael Serpieri <mickybart@pygoscelis.org>

pkgname=qt5-wayland-compositor
provides=('qt5-wayland')
conflicts=('qt5-wayland' 'qt')
_pkgname=qt5-wayland
_qtver=5.6.0
pkgver=${_qtver/-/}
pkgrel=1
arch=('i686' 'x86_64' 'armv7h')
url='http://qt-project.org/'
license=('GPL3' 'LGPL' 'FDL' 'custom')
pkgdesc='Provides APIs for Wayland'
depends=('qt5-base' 'libxcomposite' 'libxkbcommon')
makedepends=()
groups=('qt' 'qt5')
source=(${_pkgname}::git://code.qt.io/qt/qtwayland.git#tag=v${_qtver}
	'pkgconfig_hybris-egl-platform.patch')
md5sums=('SKIP'
	 '9b29fe70bae05930a99ee50336843188')

prepare() {
  mkdir -p build

  cd ${_pkgname}

  # hybris pkgconfig
  git apply "${srcdir}/pkgconfig_hybris-egl-platform.patch"
}

build() {
  cd build

  qmake CONFIG+=wayland-compositor ../${_pkgname}
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

  # Workaround to install generated private headers
  cp ./include/QtCompositor/${_qtver}/QtCompositor/private/{qwayland-server-*,*protocol*}.h \
      ${pkgdir}/usr/include/qt/QtCompositor/${_qtver}/QtCompositor/private/
}
