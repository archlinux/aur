# Maintainer: Sebastien Bariteau <numkem@gmail.com>
pkgname=perl-geoip
_gitname=geoip-api-perl
pkgver=1.51
pkgrel=2
pkgdesc="GeoIP Perl API"
arch=(i686 x86_64)
license=(GPL)
url="https://github.com/maxmind/geoip-api-perl"
source=("https://github.com/maxmind/${_gitname}/archive/v${pkgver}.zip")
md5sums=('2eb8f7202d3b77d86f7248af61860c90')
depends=('geoip')
provides=('cassandra')

build() {
  cd ${_gitname}-${pkgver}

  # install module in vendor directories.
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
  cd ${_gitname}-${pkgver}
  make install DESTDIR=${pkgdir}

  # remove perllocal.pod and .packlist
  find $pkgdir -name perllocal.pod -delete
  find $pkgdir -name .packlist -delete
  _perl_depends
}
