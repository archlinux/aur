# Maintainer: dudemanguy <random342@airmail.cc>
# Contributer: Wolfgang Frisch (wfr) <wfrisch@riseup.net>
# Contributer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=gtk3-patched-filechooser-icon-view
pkgver=3.22.26+47+g3a1a7135a2
_patchver=543fa1dc7173d896f8d87bece94ae23944dd1e76
pkgrel=1
pkgdesc="GTK3 patched with dudemanguy's fork of wfr's filechooser-icon-view patch."
arch=(i686 x86_64)
url="https://gist.github.com/Dudemanguy911/c172394e30e1e7d0f477ad15c719bc71"
provides=("gtk3=$pkgver gtk3-print-backends")
conflicts=("gtk3 gtk3-print-backends")
replaces=("gtk3-print-backends<=3.22.26.1")
depends=(atk cairo libxcursor libxinerama libxrandr libxi libepoxy gdk-pixbuf2 dconf
         libxcomposite libxdamage pango shared-mime-info at-spi2-atk wayland libxkbcommon
         adwaita-icon-theme json-glib librsvg wayland-protocols desktop-file-utils mesa
         cantarell-fonts colord rest libcups libcanberra glib2-patched-thumbnailer)
makedepends=(gobject-introspection gtk-doc git glib2-docs sassc)

license=(LGPL)
install=gtk3.install
_commit=3a1a7135a276f2b6336c7566f6342da739a41d39  # gtk-3-22
source=("git+https://git.gnome.org/browse/gtk+#commit=$_commit"
        0001-entry-Undo-ABI-breakage-from-addition-of-insert_emoj.patch
        settings.ini
        gtk-query-immodules-3.0.hook
        https://gist.githubusercontent.com/Dudemanguy911/c172394e30e1e7d0f477ad15c719bc71/raw/$_patchver/gtk3-filechooser-icon-view.patch)        

sha256sums=('SKIP'
            '3a52d723db863564bea9245d5f65b1dc5c3ca20ee190fca249eb8bd8fdbc5c0b'
            '01fc1d81dc82c4a052ac6e25bf9a04e7647267cc3017bc91f9ce3e63e5eb9202'
            'de46e5514ff39a7a65e01e485e874775ab1c0ad20b8e94ada43f4a6af1370845'
            'bc990c3f9bbe5e39184e9203cc99eff92920d1383119db49be92a01f98d71f2e')

pkgver() {
  cd gtk+
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd gtk+

  # https://bugs.archlinux.org/task/56474
  patch -Np1 -i ../0001-entry-Undo-ABI-breakage-from-addition-of-insert_emoj.patch 

  # apply icon-view patch
  patch -Np1 -i ../gtk3-filechooser-icon-view.patch

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd gtk+

  CXX=/bin/false ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-schemas-compile \
    --enable-x11-backend \
    --enable-broadway-backend \
    --enable-wayland-backend \
    --enable-gtk-doc

  #https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {

  cd gtk+
  make DESTDIR="$pkgdir" install

  install -Dm644 ../settings.ini "$pkgdir/usr/share/gtk-3.0/settings.ini"
  install -Dm644 ../gtk-query-immodules-3.0.hook "$pkgdir/usr/share/libalpm/hooks/gtk-query-immodules-3.0.hook"

  # split these out to avoid file conflicts with gtk-update-icon-cache
  rm "$pkgdir/usr/bin/gtk-update-icon-cache"
}

