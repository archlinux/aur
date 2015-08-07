# Maintainer: Uwe Koloska <kolewu [at] koloro [dot] de>

pkgname=xotcl
pkgver=1.6.8
pkgrel=4
pkgdesc="Extended Object Tcl"
arch=('i686' 'x86_64')
url='http://xotcl.org'
license=('MIT')
depends=('tk' 'gdbm')

source=(http://media.wu-wien.ac.at/download/${pkgname}-${pkgver}.tar.gz
	buildpath-tmp.patch)
md5sums=('82ed6cf1d13f7f3602761f9906b35ea5'
         'c8f3713b37786dd4420adbfec2e773ef')

build() {
  cd $pkgname-$pkgver

  patch -i "$srcdir"/buildpath-tmp.patch
  msg "Starting make..."
  ./configure --prefix=/usr --with-all --enable-threads
  msg "make in $(pwd)"
  make binaries libraries
  # without an extra make for 'doc' libxotcl1.6.8.so is not ready
  make doc end
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install

  # fix some installation flaws that I will try to sort out later
  rm -f "${pkgdir}/usr/lib/lib${pkgname}${pkgver}.so"
  # the symbolic link is only necessary to make namcap happy -- so we leave it out
  #ln -s ${pkgname}${pkgver}/lib${pkgname}${pkgver}.so "${pkgdir}/usr/lib/"
  chmod 644 ${pkgdir}/usr/lib/${pkgname}${pkgver}/lib${pkgname}stub${pkgver}.a
  # there are no manpages installed
  rm -rf "${pkgdir}/usr/share/man"
  # and no binaries, too
  #rm -rf "${pkgdir}/usr/bin"

  install -D -m644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
