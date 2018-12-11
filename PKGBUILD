# Maintainer: Amish <contact at via dot aur>
# Contributor: Justin Davis <jrcd83@gmail.com>
# Contributor: Tony Sokhon <tonyskn@gmail.com>

pkgname=perl-par-packer
pkgver=1.047
pkgrel=3
pkgdesc="PAR Packager"
_dist=PAR-Packer
arch=('any')
url="https://metacpan.org/release/${_dist}"
license=('GPL' 'PerlArtistic')
# This package bundles libperl.so into parl and when executing
# needs the same version of perl used when building this package
_perlver=$(eval "`perl -V:version`"; echo ${version:-0})
depends=("perl=${_perlver}" 'perl-archive-zip>=1' 'perl-getopt-argvfile>=1.07' 'perl-ipc-run3>=0.048' 'perl-module-scandeps>=1.21' 'perl-par>=1.010' 'perl-par-dist>=0.22')
makedepends=('perl-extutils-makemaker>=6.62')
options=('!emptydirs' purge)
source=("https://cpan.metacpan.org/authors/id/R/RS/RSCHUPP/${_dist}-${pkgver}.tar.gz")
md5sums=('103a265266464dc6cbfd9dfb13b800f3')
sha512sums=('d128f99f7139feb5bd967b675a2407754533e550e8a3d8ae0fe782dea6ebcee9663044f56aeebf2ab67cffad7e32ef2044f5e0e23b69c65b1523759889ce6d7e')

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
