# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Crotok <crotok [at] mailbox [dot] org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: Michael Kogan <michael dot kogan at gmx dot net>

pkgname=perl-gtk2-unique
_cpanname=Gtk2-Unique
pkgver=0.07
pkgrel=1.4
pkgdesc="Perl bindings for the C library libunique"
arch=('i686' 'x86_64')
url="https://metacpan.org/release/${_cpanname}"
license=('LGPL' 'PerlArtistic')
makedepends=('perl-extutils-depends' 'perl-extutils-pkgconfig')
depends=('perl' 'gtk2-perl' 'libunique')
checkdepends=('xorg-server-xvfb')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/X/XA/XAOC/${_cpanname}-${pkgver}.tar.gz")
md5sums=('7e540d51944f70538e2ff32907297fa5')
sha512sums=('62975a16840be7af7d5657c816367572d1b5140585d1275331e2d05dcefe18ebcccf8cb81747da92f12e085a5bef1c0ba2dcf4d2fc886baef97a22317e1e04f6')

build() {
  cd  $_cpanname-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  sed -e 's,q(build/doc.pl),q(./build/doc.pl),g' -i Makefile
  make
}

check() {
  cd  $_cpanname-$pkgver
  xvfb-run -a -s "-extension GLX -screen 0 1280x1024x24" make test
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
  cd  $_cpanname-$pkgver
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
  _perl_depends
}
