# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-coro
_realname=Coro
pkgver=6.54
pkgrel=1
pkgdesc="CPAN/Coro - the only real threads in perl"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0' 'perl-anyevent>=5' 'perl-common-sense' 'perl-guard>=0.5')
makedepends=('perl-canary-stability')
url="https://metacpan.org/release/${_realname}"
source=("http://cpan.metacpan.org/authors/id/M/ML/MLEHMANN/${_realname}-${pkgver}.tar.gz")
md5sums=('aaf5ca766a7323feaab7c9aea77e6ea8')

build() {
  cd $_realname-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make PERL_MM_USE_DEFAULT=1
}

check() {
  cd $_realname-$pkgver
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
  cd $_realname-$pkgver
  make PERL_MM_USE_DEFAULT=1 DESTDIR="$pkgdir" install
  find "$pkgdir" \( -name '.packlist' -o -name '*.pod' \) -delete
  _perl_depends
}

# vim:set ts=2 sw=2 et:
