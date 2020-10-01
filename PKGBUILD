# Maintainer: dundee
# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=stacer
pkgver=1.1.0
pkgrel=1
pkgdesc="Ubuntu System Optimizer"
url="https://github.com/oguzhaninan/Stacer"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('qt5-charts' 'qt5-svg' 'hicolor-icon-theme')
makedepends=('qt5-tools' 'ccache')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/oguzhaninan/Stacer/archive/v${pkgver}.tar.gz")
sha256sums=('6b4922c02017ab4b65c7853db31e24a6969051b3eb06ebd9820df897d857bd31')

build() {
  cd "$srcdir/${pkgname^}-${pkgver}"
  [ -d build ] && rm -fr build
  mkdir build
  cd build
#  cmake .. -DCMAKE_BUILD_TYPE=release
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

  install -Dm644 ../LICENSE "{$pkgdir}"/usr/share/licenses/stacer/LICENSE
  
  install -Dm755 stacer-core/libstacer-core.so.1.0.0 "${pkgdir}"/usr/lib/
  ln -s './libstacer-core.so.1.0.0' "${pkgdir}"/usr/lib/libstacer-core.so.1.0
  ln -s './libstacer-core.so.1.0.0' "${pkgdir}"/usr/lib/libstacer-core.so.1
  ln -s './libstacer-core.so.1.0.0' "${pkgdir}"/usr/lib/libstacer-core.so
  
  mkdir -p "${pkgdir}"/usr/share/
  cp -ar ../icons "${pkgdir}"/usr/share/
  
  install -Dm644 ../applications/stacer.desktop "${pkgdir}"/usr/share/applications/stacer.desktop

  # Install translations
  mkdir -p "${pkgdir}"/usr/lib/stacer/translations
  install -Dm644 ../translations/*qm "${pkgdir}"/usr/lib/stacer/translations/
}
