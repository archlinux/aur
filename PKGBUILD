# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab
# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>

pkgname=perl-bash-completion
pkgver=0.008
pkgrel=1
_author="M/ME/MELO"
_perlmod="Bash-Completion"
pkgdesc="Bash::Completion - Extensible system to provide bash completion"
arch=('any')
url="http://search.cpan.org/dist/Bash-Completion/"
license=('GPL' 'PerlArtistic')
depends=(
perl-list-moreutils 
perl-module-pluggable
)
checkdepends=(perl-test-deep)
provides=(
perl-app-bashcomplete
perl-bash-completion-plugin
perl-bash-completion-plugins-bashcomplete
perl-bash-completion-plugins-perldoc
perl-bash-completion-request
perl-bash-completion-utils
)
optdepends=('perl-bash-completion-plugins-: install plugins that you need')
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")

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

  install -dm755 "$pkgdir"/etc/bash_completion.d
  ln -s /usr/bin/vendor_perl/setup-bash-complete "$pkgdir"/etc/bash_completion.d/perl-bash-completion
}

md5sums=('fcb7e1c405d1a193fb7fa8cbe22fda37')
