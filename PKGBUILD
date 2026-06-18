# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>

pkgname='sidef'
_pkgname='Sidef'
pkgver='26.06'
pkgrel='1'
pkgdesc="A modern object-oriented programming language."
arch=('any')
url="https://github.com/trizen/sidef"
license=('Artistic2.0')

options=('!emptydirs')
makedepends=()
depends=(
    'perl>=5.18.0' 'perl-data-dump' 'perl-math-gmpq>=0.45' 'perl-math-gmpz>=0.39' 'perl-math-mpfr>=3.36' 'perl-math-mpc'
    'perl-math-prime-util-gmp>=0.53' 'perl-term-readline-gnu' 'perl-algorithm-combinatorics' 'perl-algorithm-loops'
    'perl-math-prime-util>=0.74'
)
optdepends=(
    'perl-forks: for better threading support'
)
source=("https://cpan.metacpan.org/authors/id/T/TR/TRIZEN/${_pkgname}-${pkgver}.tar.gz")
b2sums=('69600cfc8a899627ab2abf75e01f53ae897d704fb2ca3d245d5e3363ccb73b1bacc0355a86654c5c26f975a200f5a4329b453c75ea2f08c5dcc77e832f87cf4a')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                                          \
      PERL_AUTOINSTALL=--skipdeps                                                     \
      PERL_MM_OPT="INSTALLDIRS=vendor INSTALLVENDORSCRIPT=/usr/bin DESTDIR='$pkgdir'"

    cd "$srcdir/$_pkgname-$pkgver"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make install
  rm -r "$pkgdir/usr/lib"

  #cd "share/sidef"
  #for i in *
  #do
  #    install -Dm644 "$i" "$pkgdir/usr/share/$pkgname/$i"
  #done

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
