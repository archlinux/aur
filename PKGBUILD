# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Zinc Chen <zinc.chen@live.cn>

pkgname=perl-net-interface
_cpanname=Net-Interface
pkgver=1.016
pkgrel=3
pkgdesc="Net::Interface - Perl extension to access network interfaces    "
arch=('i686' 'x86_64')
url="https://metacpan.org/release/${_cpanname}"
license=('GPL' 'PerlArtistic')
options=('!emptydirs')
makedepends=('perl-extutils-depends' 'perl-module-install')
source=("http://cpan.metacpan.org/authors/id/M/MI/MIKER/${_cpanname}-${pkgver}.tar.gz"
	'inc.patch')
md5sums=('339079deafeb8720c569bae51dac4a0d'
         '3240db69ec69d45d4a9f768171f6f24e')

build() {
  cd ${_cpanname}-${pkgver}
  patch -Np2 -b -z .orig <../inc.patch
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
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
  make DESTDIR="$pkgdir" install
  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
  _perl_depends
}
