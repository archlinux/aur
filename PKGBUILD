# $Id: PKGBUILD 107172 2014-03-14 00:14:28Z heftig $
# Maintainer: Gustavo Castro <gustawho[at]gmail[dot]com>

pkgname=gnash
pkgdesc="A GNU Flash movie player"
pkgver=0.8.12
pkgrel=3
arch=(i686 x86_64)
url="http://www.gnu.org/software/gnash/"
license=(GPL3)
depends=(curl giflib sdl agg libjpeg libpng libltdl libgl glu speex fontconfig cairo ffmpeg jemalloc boost-libs gtk2 libldap hicolor-icon-theme desktop-file-utils gconf gtkglext)
makedepends=(libtool mesa xulrunner pkgconfig boost git)
provides=(gnash-common gnash-gtk)
conflicts=(gnash-common gnash-gtk)
replaces=(gnash-common gnash-gtk)
options=(!emptydirs)
backup=(etc/gnashrc etc/gnashthumbnailrc etc/gnashpluginrc)
install=gnash-gtk.install
source=("gnash::git://git.sv.gnu.org/gnash.git"	)
sha256sums=('SKIP')

prepare() {
  cd gnash
  ./autogen.sh
}

build() {
  cd gnash
  sed -i '27371s/--cxxflags/--cflags/' configure
  sed -i '27371s%"$% -I/usr/include/jemalloc"%' configure
  sed -i '36s/.*/ bool adjacent_tokens_only() const { return false; }/' libbase/accumulator.h
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --with-plugins-install=system \
    --with-npapi-plugindir=/usr/lib/mozilla/plugins \
    --enable-gui=sdl,gtk,dump \
    --enable-media=ffmpeg \
    --enable-renderer=all \
    --enable-device=x11

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool

  make
}

package() {
  cd gnash
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir" install install-plugin

  install -m755 -d "$pkgdir/usr/share/gconf/schemas"
  gconf-merge-schema "$pkgdir/usr/share/gconf/schemas/gnash.schemas" --domain gnash \
    "$pkgdir"/usr/share/applications/*.schemas
  rm -f "$pkgdir"/usr/share/applications/*.schemas
}

