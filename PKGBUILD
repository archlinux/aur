# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>

pkgname='sidef'
pkgver='22.05'
pkgrel='1'
pkgdesc="A modern object-oriented programming language."
arch=('any')
url="https://github.com/trizen/sidef"
license=('Artistic2.0')

options=('!emptydirs')
makedepends=()
depends=(
    'perl>=5.22.0' 'perl-data-dump' 'perl-math-gmpq>=0.45' 'perl-math-gmpz>=0.39' 'perl-math-mpfr>=3.36' 'perl-math-mpc'
    'perl-math-prime-util-gmp>=0.52' 'perl-term-readline-gnu' 'perl-algorithm-combinatorics' 'perl-algorithm-loops'
)
optdepends=('perl-math-prime-util: for better performance in several functions')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('9d614e93916a659816f7e583c2246784c4d3ecac85512dff7836a2622b6fa1e6eb453aa3c20a51f05ee036e373227bd732afa6c9979435a4a7180454f46d652e')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                                          \
      PERL_AUTOINSTALL=--skipdeps                                                     \
      PERL_MM_OPT="INSTALLDIRS=vendor INSTALLVENDORSCRIPT=/usr/bin DESTDIR='$pkgdir'"

    cd "$srcdir/$pkgname-$pkgver"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install
  rm -r "$pkgdir/usr/lib"

  #cd "share/sidef"
  #for i in *
  #do
  #    install -Dm644 "$i" "$pkgdir/usr/share/$pkgname/$i"
  #done

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
