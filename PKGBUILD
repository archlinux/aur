# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-x11-xcb
_cpanname=X11-XCB
pkgver=0.16
pkgrel=4
pkgdesc="Perl bindings for libxcb"
arch=('i686' 'x86_64')
url="http://metacpan.org/release/$_cpanname"
license=('PerlArtistic')
makedepends=('perl-xs-object-magic' 'perl-extutils-depends' 'libpthread-stubs' 'python'
	     'perl-module-install' 'perl-extutils-pkgconfig' 'perl-data-dump')
depends=('libxau' 'libxdmcp' 'perl-mouse' 'perl-mousex-nativetraits' 'perl-try-tiny'
		'perl-xml-simple' 'perl-xml-descent' 'libxcb' 'xcb-util'
		'xcb-util-wm')
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/M/MS/MSTPLBG/${_cpanname}-${pkgver}.tar.gz"
	"inc.patch")
md5sums=('15c56ac74a7412378c26e5d343e19246'
         'fd779512518f4bf5e8ae9a1596dd201f')

prepare() {
  cd ${_cpanname}-${pkgver}
  patch -Np2 -b -z .orig <../inc.patch
}

build() {
  cd ${_cpanname}-${pkgver}
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
  find $pkgdir -name '.packlist' -delete
  find $pkgdir -name '*.pod' -delete
  _perl_depends
}
