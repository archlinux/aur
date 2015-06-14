# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Created: 08/01/2012

_author=S/ST/STEPANOV
_perlmod=IMDB-Film
pkgname=perl-imdb-film
pkgver=0.53
pkgrel=2
pkgdesc='IMDB::Film - OO Perl interface to the movies database IMDB'
arch=('any')
url="http://search.cpan.org/dist/IMDB-Film/"
license=('GPL' 'PerlArtistic')
groups=()
depends=(
   perl-html-parser
   perl-libwww
   perl-cache-cache
)
makedepends=(
  perl-text-unidecode
  perl-cache-cache
)
optdepends=()
provides=(
  perl-imdb-baseclass
  perl-imdb-persons
)
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
noextract=()

build(){
  cd "$srcdir"/$_perlmod-$pkgver
  
  # Setting these env variables overwrites any command-line-options we don't want...
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  # If using Makefile.PL
  if [ -r Makefile.PL ]; then
    /usr/bin/perl Makefile.PL
    make
  # If using Build.PL
  elif [ -r Build.PL ]; then
    /usr/bin/perl Build.PL
    perl Build
  fi
}
check(){
  cd "$srcdir"/$_perlmod-$pkgver

  # If using Makefile.PL
  if [ -r Makefile.PL ]; then
    make test
  # If using Build.PL
  elif [ -r Build.PL ]; then
    perl Build test
  fi
}
package(){
  cd "$srcdir"/$_perlmod-$pkgver
  
  # If using Makefile.PL
  if [ -r Makefile.PL ]; then
    make install
  # If using Build.PL
  elif [ -r Build.PL ]; then
    perl Build install
  fi

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
md5sums=('7db6bcc1f5c705215745c157bb39f020')
