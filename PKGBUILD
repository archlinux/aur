# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab
# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: DarkHeart luke<at>archlinux.us

pkgname=perl-extutils-xspp
pkgver=0.18
pkgrel=1
_author=S/SM/SMUELLER
_perlmod=ExtUtils-XSpp
pkgdesc='ExtUtils::XSpp - XS for C++'
arch=('any')
url="http://search.cpan.org/dist/ExtUtils-XSpp/"
license=('GPL' 'PerlArtistic')
depends=(
perl
# perl-extutils-parsexs → perl
# perl-extutils-typemaps → perl
# perl-digest-md5 → perl
)
checkdepends=(
perl-test-base 
perl-test-differences
)
makedepends=(
# perl-module-build → perl
)
optdepends=()
#{{{ provides
provides=(
perl-extutils-xspp-cmd
perl-extutils-xspp-driver
perl-extutils-xspp-exception
perl-extutils-xspp-exception-code
perl-extutils-xspp-exception-object
perl-extutils-xspp-exception-perlcode
perl-extutils-xspp-exception-simple
perl-extutils-xspp-exception-stdmessage
perl-extutils-xspp-exception-unknown
perl-extutils-xspp-grammar
perl-extutils-xspp-grammar-yappdriver
perl-extutils-xspp-lexer
perl-extutils-xspp-node
perl-extutils-xspp-node-access
perl-extutils-xspp-node-argument
perl-extutils-xspp-node-class
perl-extutils-xspp-node-comment
perl-extutils-xspp-node-constructor
perl-extutils-xspp-node-destructor
perl-extutils-xspp-node-enum
perl-extutils-xspp-node-enumvalue
perl-extutils-xspp-node-file
perl-extutils-xspp-node-function
perl-extutils-xspp-node-member
perl-extutils-xspp-node-method
perl-extutils-xspp-node-module
perl-extutils-xspp-node-package
perl-extutils-xspp-node-percany
perl-extutils-xspp-node-preprocessor
perl-extutils-xspp-node-raw
perl-extutils-xspp-node-type
perl-extutils-xspp-parser
perl-extutils-xspp-plugin-feature-default_xs_typemap
perl-extutils-xspp-typemap
perl-extutils-xspp-typemap-parsed
perl-extutils-xspp-typemap-reference
perl-extutils-xspp-typemap-simple
perl-extutils-xspp-typemap-wrapper 
) #}}}
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('9176ad646729e3bd27cf7abf114bedd3424bff1ba61185cfc7d54f3a9223a8ff')

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
