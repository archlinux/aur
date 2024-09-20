# Maintainer: Josef Vybíhal <josef.vybihal at gmail dot com>
# Contributor: Jeffrey Tolar <tolar.jeffrey at gmail dot com>
# Contributor: Will Chappell <wtchappell@gmail.com>
# Contributor: denton <e9203.00 gmail com>
# Note: 
pkgname=perl-app-cope
_appname=cope
_dist=App-Cope
pkgver=1.1
pkgrel=5
pkgdesc="A wrapper around programs that output to a terminal, to give them colour for utility and aesthetics while still keeping them the same at the text level."
url=http://stuff.cytzol.org/cope/
arch=(any)
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10' 'perl-class-inspector' 'perl-env-path' 'perl-file-sharedir'
         'perl-io-stty' 'perl-io-tty' 'perl-list-moreutils' 'perl-params-util'
         'perl-regexp-common' 'perl-regexp-ipv6' 'perl-number-format')
makedepends=('git' 'perl-module-install' 'make')
conflicts=($_appname $_appname-git)
provides=($_appname)
install="${pkgname}.install"

source=("${_dist}-${pkgver}::git+https://github.com/xvybihal/cope.git#branch=v1.1")
sha256sums=('SKIP')


build() {
  cd "${srcdir}/${_dist}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "${srcdir}/${_dist}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "${srcdir}/${_dist}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR=$pkgdir
  
  # Install the 'cope_path' command for use in bash startup scripts.
  mkdir -p $pkgdir/usr/bin
  install -C bin/cope_path.pl $pkgdir/usr/bin/cope_path

  # Clean
  find $pkgdir -name perllocal.pod -delete
  find $pkgdir -name .packlist -delete
}

