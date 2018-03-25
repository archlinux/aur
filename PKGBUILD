# Maintainer: dudemanguy <random342@airmail.cc>
# Contributer: Wolfgang Frisch (wfr) <wfrisch@riseup.net>
# Contributer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=gtk3-patched-filechooser-icon-view
pkgver=3.22.29+4+gb485cf91b5
pkgrel=1
pkgdesc="GTK3 patched with dudemanguy's fork of wfr's filechooser-icon-view patch."
arch=(x86_64)
url="https://gist.github.com/Dudemanguy911/c172394e30e1e7d0f477ad15c719bc71"
provides=(gtk3=$pkgver gtk3-print-backends)
conflicts=(gtk3 gtk3-print-backends)
replaces=('gtk3-print-backends<=3.22.26-1')
depends=(atk cairo libxcursor libxinerama libxrandr libxi libepoxy gdk-pixbuf2 dconf
         libxcomposite libxdamage pango shared-mime-info at-spi2-atk wayland libxkbcommon
         adwaita-icon-theme json-glib librsvg wayland-protocols desktop-file-utils mesa
         cantarell-fonts colord rest libcups libcanberra libcloudproviders gtk-update-icon-cache)
optdepends=('glib2-patched-thumbnailer: Thumbnail generation in upload dialog')
makedepends=(gobject-introspection gtk-doc git glib2-docs sassc)

license=(LGPL)
install=gtk3.install
_commit=b485cf91b53cd21fad8b4ff35fef53e4d1a9f009  # gtk-3-22
source=("git+https://gitlab.gnome.org/GNOME/gtk.git#commit=$_commit"
        settings.ini
        gtk-query-immodules-3.0.hook
        gtk3-filechooser-icon-view.patch)        

sha256sums=('SKIP'
            '01fc1d81dc82c4a052ac6e25bf9a04e7647267cc3017bc91f9ce3e63e5eb9202'
            'de46e5514ff39a7a65e01e485e874775ab1c0ad20b8e94ada43f4a6af1370845'
            'aa25ef34086e1b47a647006fa3946328b15f82ba16dac2ab37ceed0693c5425c')
pkgver() {
  cd gtk
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd gtk

  # apply icon-view patch
  patch -Np1 -i ../gtk3-filechooser-icon-view.patch

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd gtk

  CXX=/bin/false ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-schemas-compile \
    --enable-cloudproviders \
    --enable-x11-backend \
    --enable-broadway-backend \
    --enable-wayland-backend \
    --enable-gtk-doc

  #https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {

  cd gtk
  make DESTDIR="$pkgdir" install

  install -Dm644 ../settings.ini "$pkgdir/usr/share/gtk-3.0/settings.ini"
  install -Dm644 ../gtk-query-immodules-3.0.hook "$pkgdir/usr/share/libalpm/hooks/gtk-query-immodules-3.0.hook"

  # split these out to avoid file conflicts with gtk-update-icon-cache
  rm "$pkgdir/usr/bin/gtk-update-icon-cache"
}

