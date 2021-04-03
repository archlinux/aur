# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-snmp-info
_cpanname=SNMP-Info
pkgver=3.71
pkgrel=1
pkgdesc="Perl/CPAN Module SNMP::Info"
arch=('any')
url="https://metacpan.org/release/$_cpanname"
license=('BSD')
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/O/OL/OLIVER/$_cpanname-$pkgver.tar.gz")
depends=('perl' 'net-snmp' 'perl-netaddr-ip')
makedepends=('perl-test-harness' 'perl-module-build')
md5sums=('42b4b498d7f4f64bd13a6195d8c24a13')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "${srcdir}/${_cpanname}-${pkgver}"
    /usr/bin/perl Build.PL
    ./Build
  )
}
check() {
  cd "${srcdir}/${_cpanname}-${pkgver}"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    ./Build test
  )
}
package() {
  cd "${srcdir}/${_cpanname}-${pkgver}"
  ( export PERL_AUTOINSTALL=--skipdeps                       \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'"
    ./Build install
  )
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
  rm -fr "$pkgdir/usr/lib"
}
