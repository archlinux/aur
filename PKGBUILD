# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=medit-full
pkgver=1.2.0
pkgrel=4
pkgdesc="Medit with the python bindings restored"
arch=('i686' 'x86_64')
url="http://mooedit.sourceforge.net"
options=('!emptydirs')
license=('GPL')
depends=('pygtk' 'libxml2' 'pcre' 'libsm' 'python2' 'gtk2' 'gcc-libs')
optdepends=('ctags' 'vte: terminal emulator')
makedepends=('pkg-config' 'perl-xml-parser' 'intltool' 'glib2-devel' 'python')
conflicts=('medit')
replaces=('medit')
provides=('medit')
install=medit.install
source=(http://downloads.sourceforge.net/mooedit/medit-${pkgver}.tar.bz2)

build() {
  cd "$srcdir"/medit-$pkgver
  export PYTHON=/usr/bin/python2
  export CFLAGS="$CFLAGS -Wno-error=incompatible-pointer-types"
  ./configure --prefix=/usr --with-python --enable-moo-module --enable-shared
  make
}

package() {
  cd "$srcdir"/medit-$pkgver
  make DESTDIR="$pkgdir" install
  cd "$pkgdir"/usr/share/medit-1/language-specs
  sed -i "s|*.sh|*.sh;PKGBUILD|" sh.lang
  rm -rf "$pkgdir"/usr/share/mime
  rm -rf "$pkgdir"/usr/share/icons/hicolor/icon-theme.cache
  
  # Build the stand-alone medit app as well
  cd "$srcdir"/medit-$pkgver/moo/medit-app
  gcc -I. -I.. -I../.. `pkg-config --cflags gtk+-2.0` -c main.c
  mv ../.libs/_moo.so ../.libs/libmoo.so
  gcc -L../.libs -lmoo `pkg-config --libs gtk+-2.0 gmodule-2.0 gthread-2.0` -o medit main.o
  install -Dm755 medit "$pkgdir"/usr/bin/medit
  install -Dm644 medit.desktop.in "$pkgdir"/usr/share/applications/medit.desktop
  cd ../mooutils/pixmaps
  install -Dm644 medit.png "$pkgdir"/usr/share/icons/hicolor/48x48/apps/medit.png
  cd "$pkgdir"/usr/lib
  ln -s python2.7/site-packages/_moo.so _moo.so
  # Since we are doing this much work to save a few MB of space, we better delete the static archive
  rm -f python2.7/site-packages/_moo.a
}

sha256sums=('f0f7b3d9e3337907a5b27aa2ff3a084250d7517b38488c50872a621b4e1f3a4d')
