# Maintainer: Sergei Zhmylev <zhmylove@narod.ru>

pkgname=korgwm
_cpanname=X11-korgwm
pkgver=6.0
pkgrel=1.0
pkgdesc="Tiling window manager written in Perl"
arch=('i686' 'x86_64')
url="http://metacpan.org/release/$_cpanname"
license=('PerlArtistic')
makedepends=('perl-extutils-depends' 'perl-module-install' 'perl-extutils-pkgconfig')
depends=('perl-anyevent' 'perl-anyevent-dbus' 'perl-glib-object-introspection' 'perl-gtk3' 'perl-yaml-tiny' 'perl-x11-xcb>=0.23')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/Z/ZH/ZHMYLOVE/${_cpanname}-${pkgver}.tar.gz")
md5sums=('279609f6ed1dc5959482f26e0a949601')
sha512sums=('8978fa746eaa536824c2d1b733e4c23f35e00531b8db99cda4d6b017b2dc74f02101a366487a36430996a865221a9d677d9756f939180f7a6ee48fc25f780f12')

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
