# Maintainer : yjun <jerrysteve1101 at gmail dot com>
# Contributor : Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=picsim
pkgver=0.8.7
pkgrel=1
pkgdesc="Emulates some PIC microcontroller and periferics such as USART and timers, the simulator architecture permit easy implementation of external elements in C"
arch=('x86_64')
url='https://github.com/lcgamboa/picsim'
license=('GPL2')
options=('staticlibs')
depends=('glibc')
makedepends=('gcc9'
	     'doxygen')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lcgamboa/picsim/archive/v${pkgver}.tar.gz")
sha256sums=('6b3578d16da63895d3d1511d988aa104b054a379dd82dda50e31f954a323228d')

prepare() {
  cd "${pkgname}-${pkgver}"

  # can't compile with gcc10
  sed -i "3s|gcc|gcc-9|" src/Makefile

  # generate doc error
  sed -i '9s|doc||' Makefile
}

build() {
  cd "${pkgname}-${pkgver}"

  make
}

package() {
  cd "${pkgname}-${pkgver}"
  
  install -dm755 "$pkgdir/usr/lib"

  # install
  make install prefix="$pkgdir/usr" 

  # bin
  install -Dm755 src/${pkgname} -t "${pkgdir}/usr/bin"

  # doc
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  cp -avR docs examples \
  	"${pkgdir}/usr/share/doc/${pkgname}"
}
