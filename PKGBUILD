# Maintainer: Ronny Lorenz <ronny at tbi dot univie dot ac dot at>

pkgbase=viennarna
pkgname=('viennarna' 'python-rna' 'python2-rna' 'perl-rna')
pkgver=2.4.18
pkgrel=1
pkgdesc="RNA Secondary Structure Prediction and Comparison"
arch=('x86_64' 'i686')
license=('Custom')
url="http://www.tbi.univie.ac.at/RNA"
groups=('viennarna-package')
makedepends=( 'perl'
              'python2'
              'python'
              'libtool'
              'check'
              'mpfr'
              'gsl')
source=(http://www.tbi.univie.ac.at/RNA/packages/source/ViennaRNA-${pkgver}.tar.gz)

options=('staticlibs' '!strip')
sha256sums=('7caa723f5e5cd61a60aba60b24a64db39817a76244293754b00fe83a1dab609d')

prepare() {
  cd "${srcdir}/ViennaRNA-${pkgver}"
  ./configure \
      --with-cluster \
      --with-kinwalker \
      --prefix=/usr \
      INSTALLDIRS=vendor
}

build() {
  cd "${srcdir}/ViennaRNA-${pkgver}"
  make
}

check() {
  cd "$srcdir/ViennaRNA-${pkgver}"
  export LC_ALL=C
  make check
}

package_viennarna() {
  depends=('perl'
           'mpfr'
           'gsl')
  optdepends=('gri: create 2D plots of secondary structure landscape with RNA2Dfold')
  provides=('Kinfold=1.4'
            'RNAforester=2.0'
            'kinwalker=2.0'
            "viennarna2=${pkgver}"
            "libRNA=${pkgver}")
  conflict=('kinwalker')

  cd "${srcdir}/ViennaRNA-${pkgver}"

  # install executables
  cd src/bin/
  make DESTDIR="${pkgdir}" install
  cd ../Kinfold
  make DESTDIR="${pkgdir}" install
  cd ../RNAforester
  install -Dm755 src/RNAforester "${pkgdir}/usr/bin/"
  install -Dm644 man/RNAforester.1* "${pkgdir}/usr/share/man/man1/"
  cd ../Utils
  make DESTDIR="${pkgdir}" install
  cd ../Cluster
  make DESTDIR="${pkgdir}" install
  cd ../Kinwalker
  make DESTDIR="${pkgdir}" install
  cd ../RNAlocmin
  make DESTDIR="${pkgdir}" install
  cd ../..

  # install library and header files
  cd src/ViennaRNA
  make DESTDIR="${pkgdir}" install
  cd ../..

  # install manpages, documentation, examples, and misc files
  cd man
  make DESTDIR="${pkgdir}" install
  cd ../doc
  make DESTDIR="${pkgdir}" install
  cd ../examples
  make DESTDIR="${pkgdir}" install
  cd ../misc
  make DESTDIR="${pkgdir}" install
  cd ..

  # install pkg-config file
  install -Dm644 RNAlib2.pc "$pkgdir/usr/lib/pkgconfig/RNAlib2.pc"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # cleanup after dirty install ...
  install -dm755 "$pkgdir"/usr/bin/vendor_perl
  for perlscript in "$pkgdir"/usr/share/ViennaRNA/bin/*.pl ; do
    mv "$perlscript" "$pkgdir/usr/bin/vendor_perl/"
  done

  # no need for that file it is outdated anyway
  rm $pkgdir/usr/share/info/dir
}

package_python2-rna() {
  depends=('python2' viennarna="${pkgver}")
  cd "${srcdir}/ViennaRNA-${pkgver}"
  cd interfaces/Python
  make DESTDIR="${pkgdir}" install
}

package_python-rna() {
  depends=('python' viennarna="${pkgver}")
  cd "${srcdir}/ViennaRNA-${pkgver}"
  cd interfaces/Python3
  make DESTDIR="${pkgdir}" install
}

package_perl-rna() {
  depends=('perl' viennarna="${pkgver}")
  cd "${srcdir}/ViennaRNA-${pkgver}"
  cd interfaces/Perl
  make DESTDIR="${pkgdir}" install
}
