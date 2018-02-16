# Maintainer: dudemanguy <random342@airmail.cc>
# Contributor: Vaporeon <vaporeon@tfwno.gf>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gtk2-patched-filechooser-icon-view
pkgver=2.24.32
pkgrel=2
arch=(x86_64)
pkgdesc="GTK2 patched with ahodesuka's filechooser-icon-view patch."
url="https://gist.github.com/Dudemanguy911/d70734d5bdf82e79cbfb22894fac8a1b/"
provides=("gtk2=$pkgver")
conflicts=('gtk2')
depends=('atk' 'pango' 'libxcursor' 'libxinerama' 'libxrandr' 'libxi' 'libxcomposite' 'libxdamage'
         'shared-mime-info' 'cairo' 'libcups' 'gtk-update-icon-cache' 'librsvg'
         'desktop-file-utils' 'gtk-doc' 'glib2-patched-thumbnailer')
makedepends=('gobject-introspection' 'python2' 'git' 'gtk-doc')
optdepends=('gnome-themes-standard: Default widget theme' 
            'gnome-icon-theme: Default icon theme')
license=('LGPL')
install=gtk2.install
_commit=ed7d3e25f8b6debae6ccc8b50d1329155338cab8 # tags/2.24.32^0
source=("git+https://gitlab.gnome.org/GNOME/gtk.git#commit=$_commit"
        gtkrc
        gtk-query-immodules-2.0.hook
        xid-collision-debug.patch
        gtk2-filechooser-icon-view.patch)

sha256sums=('SKIP'
            'b77a427df55a14182c10ad7e683b4d662df2846fcd38df2aa8918159d6be3ae2'
            '9656a1efc798da1ac2dae94e921ed0f72719bd52d4d0138f305b993f778f7758'
            'd758bb93e59df15a4ea7732cf984d1c3c19dff67c94b957575efea132b8fe558'
            '91e5c18be6dffc05af41561b38934259494bc14041a9c1d91b0b9b1a1dcd2be5')
pkgver() {
  cd gtk
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd gtk
  patch -Np1 -i ../xid-collision-debug.patch
  patch -Np1 -i $srcdir/gtk2-filechooser-icon-view.patch
  sed -i '1s/python$/&2/' gtk/gtk-builder-convert
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd gtk

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --with-xinput=yes \
    --disable-gtk-doc

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd gtk
  make DESTDIR="$pkgdir" install

  install -Dt "$pkgdir/usr/share/gtk-2.0" -m644 ../gtkrc
  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 ../gtk-query-immodules-2.0.hook

  rm "$pkgdir/usr/bin/gtk-update-icon-cache"
}
