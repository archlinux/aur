# Maintainer: Roberto Rossini ("robymetallo") <roberto.rossini.9533@student.uu.se>

pkgname=canu
pkgver=1.8
pkgrel=1
pkgdesc="Fork of the Celera Assembler, designed for high-noise\
 single-molecule sequencing (such as the PacBio RS II/Sequel or\
 Oxford Nanopore MinION)."

url='https://github.com/marbl/canu'
arch=('x86_64')

license=('GPL2' 'BSD' 'custom:PublicDomain' 'custom')

depends=('perl>=5.12.0' 'java-environment>=8')
optdepends=('gnuplot')
provides=('canu')
conflicts=('canu')

source=("https://codeload.github.com/marbl/canu/tar.gz/v$pkgver")
sha256sums=('30ecfe574166f54f79606038830f68927cf0efab33bdc3c6e43fd1448fa0b2e4')

backup=('usr/bin/canu.defaults')

build() {
  cd $srcdir/$pkgname-$pkgver/src

  make
}

check() {
  cd $srcdir/$pkgname-$pkgver/Linux-amd64/bin
  ./canu --version | grep -Fxq "Canu $pkgver"
}

package() {
  cd $srcdir/$pkgname-$pkgver/Linux-amd64

  for file in bin/*; do  
    install -Dm755 $file $pkgdir/usr/bin/$(basename $file)
  done
  
  for file in lib/site_perl/canu/*; do
    install -Dm644 $file $pkgdir/usr/lib/site_perl/canu/$(basename $file)
  done

  install -Dm644 share/java/classes/mhap-2.1.3.jar $pkgdir/usr/share/java/classes/mhap-2.1.3.jar
  install -Dm644 lib/libcanu.a $pkgdir/usr/lib/libcanu.a
  
  cd $srcdir/$pkgname-$pkgver
  install -Dm644 README.license.GPL $pkgdir/usr/share/licenses/$pkgname/README.license.GPL
  install -Dm644 README.licenses $pkgdir/usr/share/licenses/$pkgname/README.licenses
}
