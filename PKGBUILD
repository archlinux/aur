# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>

pkgname='sidef'
pkgver='3.98'
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

md5sums=('3d17c75d3b298f1322bcbbccddba6d06')
sha512sums=('a4ab3ac0f66d7b12fe4596c99e09dc600c954a60709f051e4f67fcc14b205cdcf69bbfeb65e541d125c1aedfe63b1963b96163dd5b846f691db356ec913b49d5')

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
