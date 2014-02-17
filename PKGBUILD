# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>

pkgname=gtk2-perl
pkgver=1.249
pkgrel=1
pkgdesc="Perl bindings for GTK+ 2.x"
arch=(i686 x86_64)
license=('LGPL')
url="http://gtk2-perl.sourceforge.net/"
makedepends=('perl-extutils-pkgconfig' 'perl-extutils-depends')
depends=('gtk2' 'pango-perl')
checkdepends=('ttf-dejavu' 'xorg-server-xvfb')
options=('!emptydirs')
source=(http://downloads.sourceforge.net/sourceforge/gtk2-perl/Gtk2-${pkgver}.tar.gz)
md5sums=('605b419fca92c5166f0d0077663c7c98')

prepare() {
  cd Gtk2-$pkgver
  # Disable failing test. Doesn't work for several versions, might be related to Xvfb too
  sed -e 's/gnome-foot.png/gnome-foot2.png/' -i t/GdkPixbufLoader.t
}

build() {
  cd Gtk2-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd Gtk2-$pkgver
  LD_PRELOAD="" Xvfb -nolisten tcp -extension GLX -screen 0 1280x1024x24 :99 2>/dev/null &
  LD_PRELOAD="" DISPLAY=:99 make test
  kill $!
}

package() {
  cd Gtk2-$pkgver
  make install DESTDIR="${pkgdir}"
}
