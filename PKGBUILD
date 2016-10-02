# Maintainer: Marcos Heredia <chelqo@gmail.com>

pkgname="yagy"
pkgver="1.1.0"
_yacasver="1.5.0"
pkgrel="1"
pkgdesc="Yagy is a (yet another) Graphical user interface for Yacas, a (yet another) Computer Algebra System"
arch=('x86_64')
url="http://yagy.sourceforge.net/"
screenshot="http://a.fsdn.com/con/app/proj/yagy/screenshots/simple plots.png"
license=('GPL2')
depends=('qt5-base' 'qt5-webkit' 'qt5-svg' "yacas>=${_yacasver}")
makedepends=('gcc' 'perl' 'cmake' 'python-sphinx' 'python-docutils')
source=("yacas-${_yacasver}.tar.gz::https://github.com/grzegorzmazur/yacas/archive/v${_yacasver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz::https://github.com/grzegorzmazur/yagy/archive/v${pkgver}.tar.gz")
md5sums=('0745ff1f7d7c4520b40054deb16801f9'
         'fc6fab2d63ca0d6bf8056253a227e598')

build() {
  # Yagy requires Yacas static library (/usr/lib/yacas/yacas.a) removed in the Yacas package
  cd ${srcdir}

  # Compile Yacas source
  cd yacas-${_yacasver}
  [ -d build ] && rm -rf build
  mkdir build
  cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=${srcdir}/${pkgname}-${pkgver} \
    -DENABLE_DOCS=ON \
    -DCMAKE_BUILD_TYPE=Release || return 1
  make
  make install
  cd ../..

  # Compile Yagy source
  cd ${pkgname}-${pkgver}
  [ -d build ] && rm -rf build
  mkdir build
  cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DYACAS_PREFIX=.. \
    -DCMAKE_EXE_LINKER_FLAGS=-lQt5PrintSupport \
    -DCMAKE_BUILD_TYPE=Release || return 1
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/build
  make DESTDIR=${pkgdir} install
  cd ..
  _docdir=${pkgdir}/usr/share/doc/${pkgname}
  _licdir=${pkgdir}/usr/share/licenses/${pkgname}
  install -dpm755 ${_docdir}
  install -Dpm644 AUTHORS README.rst ${_docdir}/
  install -dpm755 ${_licdir}
  install -Dpm644 COPYING ${_licdir}/

  # Remove repeated files in the Yacas package
  cd ${pkgdir}/usr/share/yagy/
  for f in documentation scripts
  do
    rm -rf $f
    ln -s /usr/share/yacas/$f .
  done
}
