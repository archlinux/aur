# Maintainer: Ronny Lorenz <ronny at tbi dot univie dot ac dot at>

pkgname=viennarna
pkgver=2.2.0
pkgrel=1
pkgdesc="RNA Secondary Structure Prediction and Comparison"
arch=('x86_64' 'i686')
license=('Custom')
url="http://www.tbi.univie.ac.at/RNA"
depends=( 'perl'
          'python2')
optdepends=('gsl: use a variety of optimization methods in RNApvmin'
            'gri: create 2D plots of secondary structure landscape with RNA2Dfold')
conflicts=('viennarna')
makedepends=( 'libtool'
              'check')
provides=('Kinfold=1.3' 'RNAforester=2.0' "viennarna2=${pkgver}")
source=(http://www.tbi.univie.ac.at/RNA/packages/source/ViennaRNA-${pkgver}.tar.gz)

options=('staticlibs' '!strip')
sha256sums=('45ba1b3a43854c05d3dfc789120d9ae563d17a9716963f9086ff7f521c9057b1')

build() {
  cd "${srcdir}/ViennaRNA-${pkgver}"
  ./configure --with-cluster --prefix=/usr PYTHON_VERSION=2 || return 1
  make || return 1
}

check() {
  cd "$srcdir/ViennaRNA-${pkgver}"
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
