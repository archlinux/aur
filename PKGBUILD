# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>

_pkgname=sidef
pkgname=sidef-git
pkgver=3.95
pkgrel=1
pkgdesc="A modern object-oriented programming language (-git version)."
arch=('any')
url="https://github.com/trizen/sidef"
license=('Artistic2.0')

provides=('sidef')
conflicts=('sidef')

options=('!emptydirs')
makedepends=('git')
depends=(
    'perl>=5.22.0' 'perl-data-dump' 'perl-math-gmpq>=0.45' 'perl-math-gmpz>=0.39' 'perl-math-mpfr>=3.36' 'perl-math-mpc'
    'perl-math-prime-util-gmp>=0.44' 'perl-term-readline-gnu' 'perl-algorithm-combinatorics' 'perl-algorithm-loops'
)
optdepends=('perl-math-prime-util: for better performance in several functions')
source=('git://github.com/trizen/sidef.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --always | sed -e 's|-|.|g'
}

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                                          \
      PERL_AUTOINSTALL=--skipdeps                                                     \
      PERL_MM_OPT="INSTALLDIRS=vendor INSTALLVENDORSCRIPT=/usr/bin DESTDIR='$pkgdir'"

    cd "$srcdir/$_pkgname"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_pkgname"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_pkgname"
  make install
  rm -r "$pkgdir/usr/lib"

  #cd "share/sidef"
  #for i in *
  #do
  #    install -Dm644 "$i" "$pkgdir/usr/share/$pkgname/$i"
  #done

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
