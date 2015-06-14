# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Caleb Cushing <xenoterracide@gmail.com>

_author=I/IS/ISHIGAKI
_perlmod=Module-CPANTS-Analyse
pkgname=perl-module-cpants-analyse
pkgver=0.96
pkgrel=1
pkgdesc="Module::CPANTS::Analyse - Generate Kwalitee ratings for a distribution"
arch=('any')
url='http://search.cpan.org/dist/Module-CPANTS-Analyse'
license=('PerlArtistic' 'GPL')
depends=(
perl-archive-any
perl-array-diff
perl-class-accessor
perl-cpan-distnameinfo
perl-file-find-rule
perl-file-slurp
perl-io-capture
perl-libwww
perl-list-moreutils
perl-readonly
perl-software-license
perl-test-deep
perl-test-nowarnings
perl-test-warn
perl-test-yaml-meta
perl-text-csv-xs
perl-yaml-syck
'perl-archive-any-lite>=0.06'
'perl-module-extractuse>=0.33'
perl-file-find-object
)
makedepends=(
perl-set-scalar
perl-file-chdir
perl-module-signature
perl-file-find-rule-vcs
'perl-archive-any-lite>=0.06'
#'perl-cpan-meta-validator>=2.131490' → perl
'perl-module-extractuse>=0.30'
)
checkdepends=(
perl-file-find-object
perl-json-maybexs
'perl-module-extractuse>=0.33'
)
provides=(
perl-module-cpants-kwalitee
perl-module-cpants-kwalitee-brokeninstaller
perl-module-cpants-kwalitee-cpantserrors
perl-module-cpants-kwalitee-distname
perl-module-cpants-kwalitee-distros
perl-module-cpants-kwalitee-files
perl-module-cpants-kwalitee-findmodules
perl-module-cpants-kwalitee-license
perl-module-cpants-kwalitee-manifest
perl-module-cpants-kwalitee-metayml
perl-module-cpants-kwalitee-needscompiler
perl-module-cpants-kwalitee-pod
perl-module-cpants-kwalitee-prereq
perl-module-cpants-kwalitee-repackageable
perl-module-cpants-kwalitee-signature
perl-module-cpants-kwalitee-uses
perl-module-cpants-kwalitee-version
)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('2789cc03b9beda03920d22da95185f296346c7802586aa02413af0d4977568b0')
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
