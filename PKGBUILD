# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-alpm
_cpanname=ALPM
pkgver=3.06
pkgrel=13
pkgdesc='ArchLinux Package Manager backend library.'
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0' 'pacman')
url="https://metacpan.org/release/$_cpanname"
source=("https://cpan.metacpan.org/authors/id/A/AP/APG/$_cpanname-$pkgver.tar.gz"
	"pacman521.patch")
sha512sums=('9a32f251775a1214b756f6de09eaec5b3aa9c2b7c349f5d9ef4bc1040053e8102a8017a45bc6071d39d0ecca67ab708cfb6232f18e64658327e7662d2cf9c0ee'
            'a79aee079f50128103e7e42186ff10a112212139bbd0af988c6f52438b9c68d116fbe3fb3adb080a7dce924b6c969afaddf1d40117505953ad787ece98a2e952')

prepare() {
  cd $_cpanname-$pkgver
  patch -Np1 -b -z .orig -i ../pacman521.patch
}

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
