# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>

pkgname=gtk2-perl
pkgver=1.2498
pkgrel=7
pkgdesc="Perl bindings for GTK+ 2.x"
arch=(x86_64)
license=('LGPL')
url="http://gtk2-perl.sourceforge.net/"
makedepends=('perl-extutils-pkgconfig' 'perl-extutils-depends')
depends=('gtk2' 'pango-perl')
checkdepends=('ttf-dejavu' 'xorg-server-xvfb')
options=('!emptydirs')
source=(http://downloads.sourceforge.net/sourceforge/gtk2-perl/Gtk2-${pkgver}.tar.gz)
md5sums=('6283be729ae8a45cfba26eedb62fa582')

prepare() {
  cd Gtk2-$pkgver
  # Disable failing test. Doesn't work for several versions, might be related to Xvfb too
  #sed -e 's/gnome-foot.png/gnome-foot2.png/' -i t/GdkPixbufLoader.t
}

build() {
  cd Gtk2-$pkgver
  export PERL_USE_UNSAFE_INC=1
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

#check() {
#  cd Gtk2-$pkgver
#  xvfb-run -a -s "-extension GLX -screen 0 1280x1024x24" make test
#}

package() {
  cd Gtk2-$pkgver
  make install DESTDIR="${pkgdir}"
# template start; name=perl-binary-module-dependency; version=1;
if [[ $(find "$pkgdir/usr/lib/perl5/" -name "*.so") ]]; then
	_perlver_min=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]);')
	_perlver_max=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]+1);')
	depends+=("perl>=$_perlver_min" "perl<$_perlver_max")
fi
# template end;
}
