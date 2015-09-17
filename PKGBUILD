# Maintainer: Ronny Lorenz <ronny at tbi dot univie dot ac dot at>

pkgname=viennarna
pkgver=2.1.9
pkgrel=1
pkgdesc="RNA Secondary Structure Prediction and Comparison"
arch=('x86_64' 'i686')
license=('Custom')
url="http://www.tbi.univie.ac.at/RNA"
depends=('perl')
optdepends=('python2: python2 interface to the RNAlib'
            'ruby: ruby interface to the RNAlib'
            'gri: create 2D plots of secondary structure landscape with RNA2Dfold')
conflicts=('viennarna')
makedepends=()
provides=('Kinfold=1.3' 'RNAforester=1.5' "viennarna2=${pkgver}")
source=(http://www.tbi.univie.ac.at/RNA/packages/source/ViennaRNA-${pkgver}b.tar.gz)

options=('staticlibs')
md5sums=('24f3a56a4cea90672978c2e6580d5c71')

build() {
  cd "${srcdir}/ViennaRNA-${pkgver}b"
  ./configure --with-cluster --prefix=/usr || return 1
  make || return 1
}

check() {
  cd "$srcdir/ViennaRNA-${pkgver}b"
  make check
}

package() {
  cd "${srcdir}/ViennaRNA-${pkgver}b"
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
