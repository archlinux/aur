pkgname=stacer
pkgver=1.0.8
pkgrel=2
pkgdesc="Ubuntu System Optimizer"
url="https://github.com/oguzhaninan/Stacer"
arch=('i686' 'x86_64')
license=('MIT')
depends=('qt5-charts' 'qt5-svg' 'hicolor-icon-theme')
makedepends=('qt5-tools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/oguzhaninan/Stacer/archive/v${pkgver}.tar.gz")
sha256sums=('9071690e870aa8dc9a0a657ae4d42217e639189836a12bef39390acf49b6299d')

build() {
  cd "$srcdir/${pkgname^}-${pkgver}"
  [ -d build ] && rm -fr build
  mkdir build
  cd build
  qmake -spec linux-g++ "CONFIG += release" ../Stacer.pro 
  make
  
  # Build translations
  lrelease ../stacer/stacer.pro
}

package() {
  cd "$srcdir/${pkgname^}-${pkgver}"/build
  mkdir -p "${pkgdir}"/usr/lib/stacer
  
  install -Dm755 stacer/stacer "${pkgdir}"/usr/lib/stacer/stacer
  
  mkdir -p "${pkgdir}"/usr/bin
  ln -s /usr/lib/stacer/stacer "${pkgdir}"/usr/bin/stacer
  
  install -Dm755 stacer-core/libstacer-core.so.1.0.0 "${pkgdir}"/usr/lib/
  ln -s './libstacer-core.so.1.0.0' "${pkgdir}"/usr/lib/libstacer-core.so.1.0
  ln -s './libstacer-core.so.1.0.0' "${pkgdir}"/usr/lib/libstacer-core.so.1
  ln -s './libstacer-core.so.1.0.0' "${pkgdir}"/usr/lib/libstacer-core.so
  
  mkdir -p "${pkgdir}"/usr/share/
  cp -ar ../icons "${pkgdir}"/usr/share/
  
  install -Dm644 ../stacer.desktop "${pkgdir}"/usr/share/applications/stacer.desktop

  # Install translations
  mkdir -p "${pkgdir}"/usr/lib/stacer/translations
  install -Dm644 ../translations/*qm "${pkgdir}"/usr/lib/stacer/translations/
}
