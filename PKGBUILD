# Maintainer: dudemanguy <random342@openmailbox.org>
# Contributer: Wolfgang Frisch (wfr) <wfrisch@riseup.net>
# Contributer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=gtk3-patched-filechooser-icon-view
pkgver=3.22.19
_patchver=e1cf6281fe800c070d599aef0681ef4f776e1775
pkgrel=1
pkgdesc="GTK3 patched with dudemanguy's fork of wfr's filechooser-icon-view patch."
arch=(i686 x86_64)
url="https://gist.github.com/Dudemanguy911/c172394e30e1e7d0f477ad15c719bc71"
provides=("gtk3=$pkgver")
conflicts=("gtk3")
depends=(atk cairo libxcursor libxinerama libxrandr libxi libepoxy gdk-pixbuf2 dconf
         libxcomposite libxdamage pango shared-mime-info at-spi2-atk wayland libxkbcommon
         adwaita-icon-theme json-glib librsvg wayland-protocols desktop-file-utils mesa
         cantarell-fonts glib2-patched-thumbnailer)
makedepends=(gobject-introspection libcanberra gtk-doc git colord rest libcups glib2-docs
             sassc)
license=(LGPL)
install=gtk3.install
_commit=efbf6f183ecd24cddea743a02fe8ce545f1b55f8  # tags/3.22.19^0
source=("git+https://git.gnome.org/browse/gtk+#commit=$_commit"
        settings.ini
        gtk-query-immodules-3.0.hook
        https://gist.githubusercontent.com/Dudemanguy911/c172394e30e1e7d0f477ad15c719bc71/raw/$_patchver/gtk3-filechooser-icon-view.patch)        

sha256sums=('SKIP'
            '01fc1d81dc82c4a052ac6e25bf9a04e7647267cc3017bc91f9ce3e63e5eb9202'
            'de46e5514ff39a7a65e01e485e874775ab1c0ad20b8e94ada43f4a6af1370845'
            '0bb72e50a53430c9ea37d210ed3d7b6e4f8a5927d0a8337ebb53b861b4b2320b')

pkgver() {
  cd gtk+
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd gtk+
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
}

