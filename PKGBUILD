# Maintainer: Raphaël Doursenaud <rdoursenaud@free.fr>
# Previous maintainer: Randy Heydon <randy.heydon at clockworklab dot net>

pkgname=python2-ftdi
pkgver=0.20
pkgrel=5
pkgdesc="Python bindings to libftdi"
arch=("i686" "x86_64")
url="https://www.intra2net.com/en/developer/libftdi/download.php"
license=("GPL2" "LGPL2.1")
depends=("libftdi-compat" "python2")
makedepends=('boost' 'swig')
options=('!libtool')
source=(https://www.intra2net.com/en/developer/libftdi/download/libftdi-${pkgver}.tar.gz{,.sig})
sha1sums=('4bc6ce70c98a170ada303fbd00b8428d8a2c1aa2'
          '807d145147c9bee08b4cea4d7ca82ccaf1330f02')

prepare() {
  cd "${srcdir}/libftdi-${pkgver}"
  #Have configure look for the python2 executable first.
  #Many more changes are needed to make it work with python3.
  sed -i 's/python python2/python2/' configure
}

build() {
  cd "${srcdir}/libftdi-${pkgver}"
  ./configure --prefix=/usr/ --enable-python-binding --without-examples
  make
}

package() {
  cd "${srcdir}/libftdi-${pkgver}"
  make DESTDIR="${pkgdir}/" install

  #Strip out all non-python components
  cd "${pkgdir}/usr"
  rm -r `ls --hide=lib`
  cd lib
  rm -r `ls --hide=python2.[0-9]`
}
