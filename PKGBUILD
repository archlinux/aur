# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Yanxiang Qian <scifi.org@gmail.com>

pkgname=swarm
pkgver=2.4.1
pkgrel=1
pkgdesc="An open source platform for agent-based models"
arch=('i686' 'x86_64')
url="http://www.swarm.org/index.php/Main_Page"
license=('GPL')
depends=('blt' 'hdf5' 'libpng12' 'libxpm' 'tk')
makedepends=('chrpath' 'emacs' 'gcc-objc')
options=('!libtool')
install="${pkgname}.install"
source=("http://ftp.swarm.org/pub/swarm/src/swarm/${pkgname}-${pkgver}.tar.gz")
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
