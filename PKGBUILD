# Maintainer: Sergei Zhmylev <zhmylove@narod.ru>

pkgname=korgwm
_cpanname=X11-korgwm
pkgver=6.1
pkgrel=1.0
pkgdesc="Tiling window manager written in Perl"
arch=('i686' 'x86_64')
url="http://metacpan.org/release/$_cpanname"
license=('PerlArtistic')
makedepends=('perl-extutils-depends' 'perl-module-install' 'perl-extutils-pkgconfig')
depends=('perl-anyevent' 'perl-anyevent-dbus' 'perl-glib-object-introspection' 'perl-gtk3' 'perl-yaml-tiny' 'perl-x11-xcb>=0.23')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/Z/ZH/ZHMYLOVE/${_cpanname}-${pkgver}.tar.gz")
md5sums=('021eaf12e6eff53da3249169e78f02a7')
sha512sums=('17166bee5e01ec9e2dfc920a2de221dffef66cb5fba89c3ec27c74eda287f4c58069451725a2586e93492569c632bd9b560405bb66ae3625a1a2b6a08562662f')

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
