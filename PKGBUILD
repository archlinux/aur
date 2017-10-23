# Contributor: Swift Geek <swiftgeek «at» gmail.com>
pkgname=perl-extutils-cppguess
pkgver=0.12
pkgrel=1
pkgdesc="ExtUtils::CppGuess - guess C++ compiler and flags"
arch=('any')
url="https://metacpan.org/release/ExtUtils-CppGuess/"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-capture-tiny')
makedepends=('perl-module-build')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://cpan.metacpan.org/authors/id/E/ET/ETJ/ExtUtils-CppGuess-${pkgver}.tar.gz")
md5sums=('28be49072585b25df87e54180f741a4d')
_src_dir='$srcdir/ExtUtils-CppGuess-$pkgver'

build() {
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  eval cd "$_src_dir"
  sed -i  "135i    \$self->{guess}{extra_cflags} .= ' -DPERL_IMPLICIT_SYS' if \$Config::Config{ccflags} =~ /-DPERL_IMPLICIT_SYS/;" lib/ExtUtils/CppGuess.pm
  /usr/bin/perl Makefile.PL
  make
}

check () {
  eval cd "$_src_dir"
  make test
}

package () {
  eval cd "$_src_dir"
  make install

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
