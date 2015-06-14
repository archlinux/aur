# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>

pkgname=perl-padre-plugin-spellcheck
pkgver=1.33
pkgrel=1
_author=B/BO/BOWTIE
_perlmod=Padre-Plugin-SpellCheck
pkgdesc='Padre::Plugin::SpellCheck - Check spelling in Padre, The Perl IDE'
arch=('any')
url="http://search.cpan.org/dist/Padre-Plugin-SpellCheck"
license=('GPL' 'PerlArtistic')
depends=(
perl-padre
perl-module-util
perl-text-aspell
perl-text-hunspell
perl-class-accessor
perl-file-which
perl-try-tiny
)
makedepends=(perl)
optdepends=(
'aspell-lang-code: additional dictonaries'
'hunspell-lang-code: additional dictonaries')
provides=(
perl-padre-plugin-spellcheck-checker
perl-padre-plugin-spellcheck-engine
perl-padre-plugin-spellcheck-fbp-checker
perl-padre-plugin-spellcheck-fbp-preferences
perl-padre-plugin-spellcheck-preferences
)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('18141aebc5747799af866e6358a1d03d301e0b3a952ea08a96de7adff2ab2395')
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
