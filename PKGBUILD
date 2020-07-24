# Maintainer: Andrew Crerar <andrew (dot) crerar at gmail>
# Contributor: RKA KriK <rka_krik@mail.ru>
# Contributor: Boohbah <boohbah at gmail.com>

pkgname=gtk3-git
pkgver=3.24.21.r45.g63a0e76646
pkgrel=1
pkgdesc="GObject-based multi-platform GUI toolkit (GIT Version)"
arch=('i686' 'x86_64')
url="http://www.gtk.org/"
license=('LGPL')
depends=('at-spi2-atk' 'atk' 'cairo' 'colord' 'glib2'
         'gtk-update-icon-cache' 'libcups' 'libepoxy' 'libxcomposite'
         'libxcursor' 'libxdamage' 'libxi' 'libxinerama'
         'libxkbcommon' 'libxrandr' 'pango' 'shared-mime-info'
         'wayland' 'wayland-protocols')
makedepends=('gobject-introspection')
optdepends=('gnome-icon-theme: Default icon theme'
            'gnome-themes-standard: Default widget theme')
conflicts=('gtk3' 'gtk-update-icon-cache')
provides=("gtk3=$pkgver" gtk-update-icon-cache gtk3-print-backends libgtk-3.so libgdk-3.so libgailutil-3.so)
backup=('usr/share/gtk-3.0/settings.ini')
source=('git+https://gitlab.gnome.org/GNOME/gtk.git#branch=gtk-3-24' 
        settings.ini
        gtk-query-immodules-3.0.hook
        gtk-update-icon-cache.hook
        gtk-update-icon-cache.script)
sha256sums=('SKIP'
            '01fc1d81dc82c4a052ac6e25bf9a04e7647267cc3017bc91f9ce3e63e5eb9202'
            'a0319b6795410f06d38de1e8695a9bf9636ff2169f40701671580e60a108e229'
            '2d435e3bec8b79b533f00f6d04decb1d7c299c6e89b5b175f20be0459f003fe8'
            'f1d3a0dbfd82f7339301abecdbe5f024337919b48bd0e09296bb0e79863b2541')

pkgver() {
  cd "gtk"

  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "gtk"

  ./autogen.sh --disable-schemas-compile \
               --enable-broadway-backend \
               --enable-gtk2-dependency \
               --enable-wayland-backend \
               --enable-x11-backend \
               --localstatedir=/var \
               --prefix=/usr \
               --sysconfdir=/etc

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd "gtk"

  make DESTDIR="$pkgdir" install

  install -Dt "$pkgdir/usr/share/gtk-3.0" -m644 ../settings.ini
  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 ../gtk-query-immodules-3.0.hook

  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 ../gtk-update-icon-cache.hook
  install -D ../gtk-update-icon-cache.script "$pkgdir/usr/share/libalpm/scripts/gtk-update-icon-cache"
}

