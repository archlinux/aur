# $Id: PKGBUILD 174748 2016-05-11 04:31:41Z fyan $
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-gtk2-unique
_realname=Gtk2-Unique
pkgver=0.05
pkgrel=15
pkgdesc="Perl bindings for the C library libunique"
arch=('i686' 'x86_64')
url="https://metacpan.org/release/${_realname}"
license=('LGPL' 'PerlArtistic')
makedepends=('perl-extutils-depends' 'perl-extutils-pkgconfig')
depends=('gtk2-perl' 'libunique' 'perl')
checkdepends=('xorg-server-xvfb')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/P/PO/POTYL/${_realname}-${pkgver}.tar.gz"
        "$pkgname.patch")
md5sums=('0beb552933b765a017588563a71af123'
         'f8e15e1b93e2629e1745f8e4de8524ff')

build() {
  cd "$srcdir/$_realname-$pkgver"
  patch -Np1 -i "$srcdir/$pkgname.patch"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/$_realname-$pkgver"
  xvfb-run -a -s "-extension GLX -screen 0 1280x1024x24" make test
}

package() {
  cd  "$srcdir/$_realname-$pkgver"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
# template start; name=perl-binary-module-dependency; version=1;
if [[ $(find "$pkgdir/usr/lib/perl5/" -name "*.so") ]]; then
	_perlver_min=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]);')
	_perlver_max=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]+1);')
	depends+=("perl>=$_perlver_min" "perl<$_perlver_max")
fi
# template end;
}
