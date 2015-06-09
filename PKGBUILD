# Maintainer: Marcos Heredia <chelqo@gmail.com>

pkgname="yagy"
pkgver="1.0.1"
_yacasver="1.3.6"
pkgrel="1"
pkgdesc="Yagy is a (yet another) Graphical user interface for Yacas, a (yet another) Computer Algebra System"
arch=('i686' 'x86_64')
url="http://yagy.sourceforge.net/"
screenshot="http://a.fsdn.com/con/app/proj/yagy/screenshots/simple plots.png"
license=('GPL2')
depends=('qt5-base' 'qt5-webkit' 'qt5-svg' "yacas>=${_yacasver}")
source=("http://yacas.sourceforge.net/backups/yacas-${_yacasver}.tar.gz"
        "http://downloads.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('6c5e3b869c1b13d2f4d02d36da964e8d'
         '29ce9bdb008d609012fb75fab3b20e63')

build() {
  # Yagy requires Yacas static library (/usr/lib/yacas/yacas.a) removed in the Yacas package
  cd ${srcdir}

  # Compile Yacas source
  cd yacas-${_yacasver}
  ./makemake
  ./configure --prefix=${srcdir}
  make
  make check
  make install
  cd ..

  # Compile Yagy source
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
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
  cd ..
  _docdir=${pkgdir}/usr/share/doc/${pkgname}
  _licdir=${pkgdir}/usr/share/licenses/${pkgname}
  install -dpm755 ${_docdir}
  install -Dpm644 AUTHORS README ${_docdir}/
  install -dpm755 ${_licdir}
  install -Dpm644 COPYING ${_licdir}/

  # Remove repeated files in the Yacas package
  cd ${pkgdir}/usr/share/yagy/
  rm -rf scripts
  ln -s /usr/share/yacas/scripts .
}
