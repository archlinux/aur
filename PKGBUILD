# Maintainer: Uwe Koloska <kolewu [at] koloro [dot] de>

pkgname=xotcl
pkgver=1.6.8
pkgrel=3
pkgdesc="Extended Object Tcl"
arch=('i686' 'x86_64')
url='http://xotcl.org'
license=('MIT')
depends=('tcl' 'gdbm')

source=(http://media.wu-wien.ac.at/download/${pkgname}-${pkgver}.tar.gz)
md5sums=('82ed6cf1d13f7f3602761f9906b35ea5')
build() {
  cd $pkgname-$pkgver
  
  msg "Starting make..."
  ./configure --prefix=/usr --with-all --enable-threads
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install

  # fix some installation flaws that I will try to sort out later
  rm -f "${pkgdir}/usr/lib/lib${pkgname}${pkgver}.so"
  ln -s ${pkgname}${pkgver}/lib${pkgname}${pkgver}.so "${pkgdir}/usr/lib/"
  # there are no manpages installed
  rm -rf "${pkgdir}/usr/share/man"
  # and no binaries, too
  rm -rf "${pkgdir}/usr/bin"

  install -D -m644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
