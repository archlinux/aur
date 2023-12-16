# Maintainer: Sergei Zhmylev <zhmylove@narod.ru>

pkgname=korgwm
_cpanname=X11-korgwm
pkgver=3.0
pkgrel=1.1
pkgdesc="Tiling window manager written in Perl"
arch=('i686' 'x86_64')
url="http://metacpan.org/release/$_cpanname"
license=('PerlArtistic')
makedepends=('perl-extutils-depends' 'perl-module-install' 'perl-extutils-pkgconfig')
depends=('perl-anyevent' 'perl-glib-object-introspection' 'perl-gtk3' 'perl-yaml-tiny' 'perl-x11-xcb>=0.22')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/Z/ZH/ZHMYLOVE/${_cpanname}-${pkgver}.tar.gz")
md5sums=('0245a3889fa1248fe2aad0fc8c2efee3')
sha512sums=('df931f62d4421dbf37f5d6e56d3f2fce1bd9747c0722042a4d1aa211baf49776ad726ef897eea57396ab8a2457dc6ea7a09773b27ff9f26cff027a370904a15c')

build() {
  cd ${_cpanname}-${pkgver}
  perl Makefile.PL INSTALLDIRS=vendor
  make || :
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
  install -d "$pkgdir/etc/korgwm/"
  install -m 644 korgwm.conf.sample "$pkgdir/etc/korgwm/"
  _perl_depends
}
