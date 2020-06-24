# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor:  Michael Kogan <michael dot kogan at gmx dot net>

pkgname=perl-gtk2-notify
_cpanname=Gtk2-Notify
pkgver=0.05
pkgrel=24
pkgdesc="Perl interface to libnotify"
arch=('i686' 'x86_64')
url="http://metacpan.org/release/${_cpanname}"
license=('LGPL')
depends=('gtk2-perl' 'libnotify')
makedepends=('perl-extutils-pkgconfig' 'perl-extutils-depends'
	     'perl-module-install' 'perl-module-build-xsutil')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/$_cpanname-$pkgver.tar.gz"
	"libnotify.patch")
sha512sums=('071144ad4a5670b8b2451baf358c4a88'
         'c54d841861c9adfaa77b80bdf9cb0f98')

prepare() {
  cd $_cpanname-$pkgver
  patch -Np2 -b -z .orig <../libnotify.patch
}
build() {
  cd $_cpanname-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  sed 's,q(build/doc.pl),q(./build/doc.pl),g' -i Makefile
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
  cd $_cpanname-$pkgver
  make DESTDIR="$pkgdir" install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
  _perl_depends
}
sha512sums=('e6242c21f6a3345d990830798744c8dd3abf648c0110d395197fc74b185b68189f9fc90e0fc14717cc09505d67fbaf8f45c1b3fae65c873275537e55c9e35434'
            '036b5c0f1ca045efc97d28eea5f805b0d7ba91e74a3171aca2f66a65ef4591e486781f46940da78e3ff6c5dbc71ea100d1cab6de5dd31339c88f421b5ab5ed70')
