# $Id: PKGBUILD 269035 2016-06-05 11:29:24Z bluewind $
# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: François Charette <francois ατ archlinux δοτ org>
# Contributor: Jason Chu <jchu@xentac.net>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>

pkgname=perl-tk-git
_pkgname=perl-tk
pkgver=804.036.r2.ga19af0dc
pkgrel=1
pkgdesc="A graphical user interface toolkit for Perl"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/Tk"
license=('PerlArtistic' 'GPL' 'custom')
depends=('libpng' 'libjpeg' 'tk' 'perl>=0')
checkdepends=('xorg-server-xvfb' 'perl-devel-leak' 'perl-test-pod')
makedepends=('git')
options=('!emptydirs' '!strip')
provides=($_pkgname=${epoch:+$epoch:}${pkgver%%.r*}-${pkgrel})
conflicts=($_pkgname)
source=("$pkgname::git+https://github.com/eserte/perl-tk.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's,([^-]*-g),r\1,;s,-,.,g'
}

build() {
  cd $pkgname

  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd $pkgname
#  xvfb-run make -j1 test
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
  cd $pkgname
  make install DESTDIR="$pkgdir"

  # license
  install -D -m644 pTk/license.terms \
                   "${pkgdir}/usr/share/licenses/${pkgname}/tk.license"
  install -D -m644 pTk/Tix.license \
                   "${pkgdir}/usr/share/licenses/${pkgname}/tix.license"
  _perl_depends
}
