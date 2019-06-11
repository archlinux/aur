# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-alpm
_cpanname=ALPM
pkgver=3.06
pkgrel=11
pkgdesc='ArchLinux Package Manager backend library.'
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0' 'pacman')
url="https://metacpan.org/release/$_cpanname"
source=("https://cpan.metacpan.org/authors/id/A/AP/APG/$_cpanname-$pkgver.tar.gz")
md5sums=('6463afd95e292f3a9040e2c722663f05')

build() (
  cd $_cpanname-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
)

#check() (
#  cd $_cpanname-$pkgver
#  make test
#)

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
  cd $_cpanname-$pkgver
  make install DESTDIR="$pkgdir"
  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
  _perl_depends
}
