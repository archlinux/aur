# Maintainer: Ronny Lorenz <ronny at tbi dot univie dot ac dot at>

pkgbase=barriers
pkgname=('barriers' 'perl-rna-barrier')
pkgver=1.8.1
pkgrel=1
pkgdesc="Compute local minima and energy barriers of a landscape"
arch=('x86_64' 'i686')
license=('Custom')
url="https://www.tbi.univie.ac.at/RNA/Barriers"
depends=('perl')
optdepends=('viennarna: Generate sets of suboptimal RNA secondary structures with RNAsubopt'
            'treekin: Compute folding dynamics using barriers generated transition rates')
source=(http://www.tbi.univie.ac.at/RNA/packages/source/Barriers-${pkgver}.tar.gz)
sha256sums=('072c1bfdddf70bd638b068e2a651308cddccb5661478502537a55377e625cea0')

build() {
  cd "${srcdir}/Barriers-${pkgver}"
  ./configure --prefix=/usr INSTALLDIRS=vendor || return 1
  make || return 1
}

check() {
  cd "$srcdir/Barriers-${pkgver}"
  export LC_ALL=C
  make check
}

package_barriers() {
  provides=('genPoHoLandscape'
            'crossrates.pl'
            'saddle2dot.pl'
            'saddle2gml.pl'
            'treeplot.pl')

  cd "${srcdir}/Barriers-${pkgver}"

  # install executables
  cd src/
  make DESTDIR="${pkgdir}" install || return 1
  cd ..

  # install manpages, documentation, examples, and misc files
  cd man
  make DESTDIR="${pkgdir}" install
  cd ..

  # install generic perl scripts
  cd perl/
  for perlscript in crossrates.pl saddle2dot.pl saddle2gml.pl treeplot.pl ; do
    install -Dm755 "$perlscript" "$pkgdir/usr/bin/"
  done
  cd ..
}

package_perl-rna-barrier() {
  depends=('perl' 'perl-rna')
  provides=('fix_bar.pl'
            'saddle.pl')
  cd "${srcdir}/Barriers-${pkgver}"
  cd perl
  make DESTDIR="${pkgdir}" install

  # remove any perl scripts not belonging to this package
  for perlscript in crossrates.pl saddle2dot.pl saddle2gml.pl treeplot.pl ; do
    rm "${pkgdir}/usr/bin/${perlscript}"
  done
  cd ..
}
