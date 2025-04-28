# Maintainer: Uwe Koloska <kolewu [at] koloro [dot] de>
# Contributor: Dejan Cabrilo <dcabrilo [at] bitspan [dot] rs>

pkgname=tdom
pkgver=0.9.5
pkgrel=1
pkgdesc="A fast XML/DOM/XPath package for Tcl written in C"
arch=('i686' 'x86_64')
url="http://tdom.org"
license=('MPL')
groups=('devel')
depends=('tcl'
         'gumbo-parser')
options=(staticlibs !lto)
source=(https://tdom.org/downloads/tdom-${pkgver}-src.tgz
        no-build-dir.patch)
sha256sums=('ce22e3f42da9f89718688bf413b82fbf079b40252ba4dd7f2a0e752232bb67e8'
            '71102943c38c6f250b92bcf49b525a43e288f21fbed4836faec7f8dc616d60d2')



prepare() {
  cd "${pkgname}-$pkgver-src"

  patch -p0 -i "$srcdir"/no-build-dir.patch
}

build() {
  cd "${pkgname}-$pkgver-src"

  if [ $CARCH = "x86_64" ] ; then
    ./configure --prefix=/usr --enable-64bit --enable-html5
  else
    ./configure --prefix=/usr --enable-html5
  fi
  make
}

check() {
  cd "${pkgname}-$pkgver-src"
  make test
}

package() {
  cd "${pkgname}-$pkgver-src"
  
  make DESTDIR="$pkgdir/" install
  # rm empty directory
  rmdir "$pkgdir/usr/bin"
}
