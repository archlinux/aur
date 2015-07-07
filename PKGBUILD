# Maintainer: Dejan Cabrilo <dcabrilo@bitspan.rs>

pkgname=tdom
pkgver=0.8.3
pkgrel=1
pkgdesc="A fast XML/DOM/XPath package for Tcl written in C"
arch=('i686' 'x86_64')
url="http://tdom.github.com/"
license=('MPL')
groups=('devel')
depends=('tcl')
source=(https://github.com/downloads/tDOM/tdom/tDOM-$pkgver.tgz
	tcl86-compatibility.patch
	fix-wrong-size.patch
	no-build-dir.patch)
md5sums=('f773bef5b8f15e0b400f9f93f164a6bb'
         '9acffc72d7a794a8031512a6032907e2'
         '7c27e13024489a7e3299dd19018b4540'
         '3e3fc79c2cfea54e1dd128ea3acddbca')

prepare() {
  cd "$srcdir"/"tDOM-$pkgver"

  patch -p0 -i "$srcdir"/tcl86-compatibility.patch
  patch -p0 -i "$srcdir"/fix-wrong-size.patch
  patch -p0 -i "$srcdir"/no-build-dir.patch
}

build() {
  cd "$srcdir"/"tDOM-$pkgver"
  
  if [ $CARCH = "x86_64" ] ; then
    ./configure --prefix=/usr --enable-64bit
  else
    ./configure --prefix=/usr
  fi
  make
}

package() {
  cd "$srcdir"/"tDOM-$pkgver"
  
  make DESTDIR="$pkgdir/" install
  mkdir -pv "$pkgdir/usr/share/man/mann"
  mv -v $pkgdir/usr/man/mann/* "$pkgdir/usr/share/man/mann"
  rmdir "$pkgdir/usr/man/mann"
  rmdir "$pkgdir/usr/man"
  rmdir "$pkgdir/usr/bin"
}
