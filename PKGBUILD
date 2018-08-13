# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-snmp
_cpanname=SNMP
pkgver=5.0401
pkgrel=4
pkgdesc="Perl/CPAN Module SNMP"
arch=("i686" "x86_64")
url="https://metacpan.org/release/$_cpanname"
license=('GPL' 'PerlArtistic')
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/H/HA/HARDAKER/$_cpanname-$pkgver.tar.gz")
depends=('perl>=0' 'net-snmp')
md5sums=('7deaef5e9375c4dbdbd9b6c3bc1ae5e1')

build() {
  cd ${_cpanname}-${pkgver}

  # install module in vendor directories.
  NETSNMP_DONT_CHECK_VERSION=1 \
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}
nocheck() {
  cd ${_cpanname}-${pkgver}
  make PERL_MM_USE_DEFAULT=1 test
}
_perl_depends() {
# template start; name=perl-binary-module-dependency; version=1;
if [[ $(find "$pkgdir/usr/lib/perl5/" -name "*.so") ]]; then
	_perlver_min=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]);')
	_perlver_max=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]+1);')
	depends+=("perl>=$_perlver_min" "perl<$_perlver_max")
fi
# template end;
}
package() {
  cd ${_cpanname}-${pkgver}
  make PERL_MM_USE_DEFAULT=1 DESTDIR="${pkgdir}" install
  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
  _perl_depends
}
