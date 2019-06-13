# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Francois Charette <firmicus@gmx.net>

pkgname=perl-net-dbus-git
_pkgname=perl-net-dbus
_gitname=net-dbus
pkgver=1.0.0.r19.g407b780
pkgrel=8
pkgdesc="Binding for DBus messaging protocol"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/Net-DBus"
license=('GPL' 'PerlArtistic')
depends=('dbus' 'perl-xml-twig')
makedepends=('git')
options=('!emptydirs')
conflicts=($_pkgname)
provides=($_pkgname)
source=("git+https://gitorious.org/$_gitname/$_gitname.git")
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --long --tags | sed -r 's,^v,,;s,([^-]*-g),r\1,;s,-,.,g'
}

build() {
  cd $_gitname
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
  cd $_gitname
  make DESTDIR="$pkgdir" install
  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
  _perl_depends
}
