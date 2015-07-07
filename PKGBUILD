# Maintainer: Andrew Crerar <andrew (dot) crerar at gmail>
# Contributor: RKA KriK <rka_krik@mail.ru>
# Contributor: Boohbah <boohbah at gmail.com>

pkgname=gtk3-git
pkgver=3.17.4.r185.g3fb1d18
pkgrel=1
pkgdesc="GObject-based multi-platform GUI toolkit (GIT Version)"
arch=('i686' 'x86_64')
url="http://www.gtk.org/"
license=('LGPL')
depends=('at-spi2-atk' 'atk-git' 'cairo' 'colord' 'glib2-git>=2.43.4'
         'gtk-update-icon-cache' 'libcups' 'libepoxy' 'libxcomposite'
         'libxcursor' 'libxdamage' 'libxi' 'libxinerama'
         'libxkbcommon' 'libxrandr' 'pango' 'shared-mime-info'
         'wayland-git')
makedepends=('gobject-introspection-git')
optdepends=('gnome-icon-theme: Default icon theme'
            'gnome-themes-standard: Default widget theme')
conflicts=('gtk3' 'gtk-update-icon-cache')
provides=("gtk3=$pkgver" 'gtk-update-icon-cache')
backup=('usr/share/gtk-3.0/settings.ini')
install="gtk3-git.install"
source=('git://git.gnome.org/gtk+' 'settings.ini')
md5sums=('SKIP'
         '52bca1105d029c5142909b9e349bb89c')

pkgver() {
  cd "gtk+"

  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "gtk+"

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
  cd "gtk+"

  make DESTDIR="$pkgdir" install

  install -Dm644 "../settings.ini" "$pkgdir/usr/share/gtk-3.0/settings.ini"
}

