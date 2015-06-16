# maintainer : fenugrec
# contributors : xantares,  icarus 
pkgname=freediag
pkgver=1.05
pkgrel=1
pkgdesc="OBD-II vehicle diagnostic software and (mostly) J1978 compliant scan tool."
arch=('i686' 'x86_64')
url="http://freediag.sourceforge.net/"
license=('GPL')
makedepends=('cmake')
depends=('glibc')
optdepends=('fltk: needed for scangui front-end')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/1.0/$pkgname-$pkgver-src.tar.gz"
	fltkbuild.patch )
sha256sums=('f4589fbb7ccbaafa44ae0faa556d89003018f8187be7030a0f9d7b3a8419928e'
            'd51cb2b9b8383d12d321bffb4bcf1db43d081bf2406f74a259f238e3df9633b2')
prepare () {
  cd "$pkgname-$pkgver-src"
  patch -p1 -i "${srcdir}"/fltkbuild.patch CMakeLists.txt
}

build() {
  cd "$pkgname-$pkgver-src"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILDGUI=ON -DUSE_RCFILE=ON -DUSE_INIFILE=OFF
  make
}


package () {
  cd "$pkgname-$pkgver-src"
  make DESTDIR="$pkgdir" install
  
  install -d "$pkgdir"/usr/share/doc/freediag/carsim_examples
  cp OLD_CHANGES "$pkgdir"/usr/share/doc/freediag/OLD_CHANGES
  cp README* "$pkgdir"/usr/share/doc/freediag/
  #hax cleanup. CMakeLists.txt should really be fixed upstream for the next release
  mv "$pkgdir"/usr/bin/*.db "$pkgdir"/usr/share/doc/freediag/carsim_examples
  mv "$pkgdir"/usr/doc/* "$pkgdir"/usr/share/doc/freediag
  mv "$pkgdir"/usr/{A*,C*,R*} "$pkgdir"/usr/share/doc/freediag
  rmdir "$pkgdir"/usr/doc
}

