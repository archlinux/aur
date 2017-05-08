# $Id: PKGBUILD 240297 2015-06-03 10:22:03Z fyan $
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt5-wayland-hybris
provides=('qt5-wayland')
conflicts=('qt5-wayland')
_pkgname=qt5-wayland
_qtver=5.8.0
pkgver=${_qtver/-/}
pkgrel=2
arch=('i686' 'x86_64' 'armv7h')
url='http://qt-project.org/'
license=('GPL3' 'LGPL3' 'FDL' 'custom')
pkgdesc='Provides APIs for Wayland'
depends=('qt5-declarative' 'libxcomposite')
groups=('qt' 'qt5')
_pkgfqn="${_pkgname/5-/}-opensource-src-${_qtver}"
source=("http://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz"
	revert-5b807802.patch
	pkgconfig_hybris-egl-platform.patch
	display.patch)
md5sums=('0a40bd721bd5e1630601beab660c6ea9'
         '95e986e9c0ab5ebe03c85efb69ee751a'
	 'e7d940fe0c8f0da0a9a872c5def51ac2'
	 'd49b26a6e43ce2bbaeeb6ea354960503')

prepare() {
  mkdir -p build

# Revert commit that breaks Plasma Wayland
  cd ${_pkgfqn}
  patch -Rp1 -i ../revert-5b807802.patch

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

