# Maintainer: Amish <contact at via dot aur>
# Contributor: Justin Davis <jrcd83@gmail.com>
# Contributor : Tony Sokhon <tonyskn@gmail.com>

pkgname=perl-par-packer
pkgver=1.047
pkgrel=1
pkgdesc="PAR Packager"
arch=('any')
url='https://metacpan.org/release/PAR-Packer'
license=('PerlArtistic' 'GPL')
# This package bundles libperl.so into parl and when executing
# needs the same version of perl used when building this package
_perlver=$(eval "`perl -V:version`"; echo ${version:-0})
options=('!emptydirs')
depends=("perl=${_perlver}" 'perl-archive-zip>=1' 'perl-getopt-argvfile>=1.07' 'perl-ipc-run3>=0.048' 'perl-module-scandeps>=1.21' 'perl-par>=1.010' 'perl-par-dist>=0.22')
makedepends=('perl-extutils-makemaker>=6.62')
source=("https://cpan.metacpan.org/authors/id/R/RS/RSCHUPP/PAR-Packer-${pkgver}.tar.gz")
md5sums=('103a265266464dc6cbfd9dfb13b800f3')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB="${srcdir}/PAR-Packer-${pkgver}/lib"                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "${srcdir}/PAR-Packer-${pkgver}"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "${srcdir}/PAR-Packer-${pkgver}"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "${srcdir}/PAR-Packer-${pkgver}"
  make install
  #remove conflicting man page
  rm "$pkgdir/usr/share/man/man1/pp.1"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

