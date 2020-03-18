# Maintainer: Amish <contact at via dot aur>
# Contributor: Justin Davis <jrcd83@gmail.com>
# Contributor: Tony Sokhon <tonyskn@gmail.com>

pkgname=perl-par-packer
pkgver=1.050
pkgrel=1
pkgdesc="PAR Packager"
_dist=PAR-Packer
arch=('any')
url="https://metacpan.org/release/${_dist}"
license=('GPL' 'PerlArtistic')
# This package bundles libperl.so into parl and when executing
# needs the same version of perl used when building this package
_perlver=$(eval "`perl -V:version`"; echo ${version:-0})
depends=("perl=${_perlver}" 'perl-archive-zip>=1' 'perl-getopt-argvfile>=1.07' 'perl-ipc-run3>=0.048' 'perl-module-scandeps>=1.21' 'perl-par>=1.016' 'perl-par-dist>=0.22')
makedepends=('perl-extutils-makemaker>=6.62')
options=('!emptydirs' purge)
source=("https://cpan.metacpan.org/authors/id/R/RS/RSCHUPP/${_dist}-${pkgver}.tar.gz")
md5sums=('37d60233b4c708cfd21bd146f7541b0b')
sha512sums=('21a1d601aaf5d7c0e964e5999cc2fa7c7a9cd9dff282ad547fca0edc8d7fe6d6f72e7dbe42ba6ce057e6723b1cb783cdee0cabb283010e5f5720ba1cdd48da04')

build() {
  cd "${srcdir}/${_dist}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
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
  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
  #remove conflicting and empty man page
  rm "${pkgdir}/usr/share/man/man1/pp.1"
}
