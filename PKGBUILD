# Maintainer: Sergei Zhmylev <zhmylove@narod.ru>

pkgname=korgwm
_cpanname=X11-korgwm
pkgver=5.0
pkgrel=1.0
pkgdesc="Tiling window manager written in Perl"
arch=('i686' 'x86_64')
url="http://metacpan.org/release/$_cpanname"
license=('PerlArtistic')
makedepends=('perl-extutils-depends' 'perl-module-install' 'perl-extutils-pkgconfig')
depends=('perl-anyevent' 'perl-anyevent-dbus' 'perl-glib-object-introspection' 'perl-gtk3' 'perl-yaml-tiny' 'perl-x11-xcb>=0.23')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/Z/ZH/ZHMYLOVE/${_cpanname}-${pkgver}.tar.gz")
md5sums=('9c3c7f8a85943759f9043d457df1786c')
sha512sums=('1cd031d643b62972ca10d36a31614f8c16a178b27521b3a1158299f2e04a51304695c8d5a96991a58c575b0f2156eb47b94451fe16441699635283ca38d516fb')

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
