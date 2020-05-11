# Contributor: Jie Zhu <alienchuj@gmail.com>

_basename="perl-perl-languageserver"
pkgname=${_basename}-git
pkgver=2.1.r21.f74d741
pkgrel=1
pkgdesc="Language Server for Perl"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-anyevent>=0' 'perl-scalar-list-utils>=0' 'perl-class-refresh>=0' 'perl-padwalker>=0' 'perl-anyevent-aio>=0' 'perl-compiler-lexer-git' 'perl-coro>=0' 'perl-data-dump>=0' 'perl-io-aio>=0' 'perl-json>=0' 'perl-moose>=0' 'perl>=5.014')
makedepends=()
provides=(${_basename}=${pkgver})
conflicts=(${_basename})
url="https://github.com/richterger/Perl-LanguageServer"
source=(${_basename}::git+https://github.com/richterger/Perl-LanguageServer)
md5sums=('SKIP')

prepare() {
  cd "$srcdir/$_basename"
  echo "2.1.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_basename"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_basename"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_basename"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
