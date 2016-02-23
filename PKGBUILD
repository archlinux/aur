# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Yanxiang Qian <scifi.org@gmail.com>
# Contributor: kaptoxic

pkgname=swarm
pkgver=2.4.1
pkgrel=2
pkgdesc="An open source platform for agent-based models"
arch=('i686' 'x86_64')
url="http://www.swarm.org"
license=('GPL')
depends=('hdf5' 'libpng12' 'libxpm' 'tk')
makedepends=('chrpath' 'emacs' 'gcc-objc')
options=('!libtool')
install="${pkgname}.install"
source=("http://download.savannah.gnu.org/releases/swarm/src/swarm/${pkgname}-${pkgver}.tar.gz")
md5sums=('efbaea046dbe3cfffb95448af0d2f615')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Link with libpng 1.2
  sed -i "s/-lpng/&12/" configure

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --with-pngincludedir=/usr/include/libpng12 \
    --without-jdkdir

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  # Fix insecure RPATH error
  chrpath -r /usr/lib "${pkgdir}/usr/lib/${pkgname}/libswarm.so.2.4.0"
}
