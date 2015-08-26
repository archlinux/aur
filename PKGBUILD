# Maintainer: Ronny Lorenz <ronny at tbi dot univie dot ac dot at>

pkgname=viennarna2
pkgver=2.1.9
pkgrel=1
pkgdesc="RNA Secondary Structure Prediction and Comparison"
arch=('any')
license=('Custom')
url="http://www.tbi.univie.ac.at/RNA"
depends=('perl')
optdepends=('python2: python2 interface to the RNAlib'
            'ruby: ruby interface to the RNAlib'
            'gri: create 2D plots of secondary structure landscape with RNA2Dfold')
conflicts=('viennarna')
makedepends=()
provides=('Kinfold=1.3' 'RNAforester=1.5')
source=(http://www.tbi.univie.ac.at/RNA/packages/source/ViennaRNA-${pkgver}.tar.gz)
options=('staticlibs')
md5sums=('34ea9f3544f57f17f781a6a80ea497d4')

build() {
  cd "${srcdir}/ViennaRNA-${pkgver}"
  ./configure --with-cluster --prefix=/usr || return 1
  make || return 1
}

check() {
  cd "$srcdir/ViennaRNA-$pkgver"
  make check
}

package() {
  cd "${srcdir}/ViennaRNA-${pkgver}"
  make DESTDIR="${pkgdir}" install || return 1

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # cleanup after dirty install ...
  for perlscript in "$pkgdir"/usr/share/ViennaRNA/bin/*.pl ; do
    mv "$perlscript" "$pkgdir/usr/bin/$(basename "$perlscript" .pl)"
  done
  mv "$pkgdir"/usr/share/ViennaRNA/bin/* "$pkgdir"/usr/bin
  rmdir "$pkgdir/usr/share/ViennaRNA/bin"
  rm -rf "$pkgdir/usr/lib/perl5/core_perl"

  # no need for that file it is outdated anyway
  rm $pkgdir/usr/share/info/dir
}
