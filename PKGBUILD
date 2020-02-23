# Maintainer: dudemanguy <random342@airmail.cc>
# Contributor: Vaporeon <vaporeon@tfwno.gf>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gtk2-patched-filechooser-icon-view
pkgver=2.24.32
pkgrel=2
arch=(x86_64)
pkgdesc="https://github.com/Dudemanguy/gtk/tree/gtk2-filechooser-icon-view"
url="https://gist.github.com/Dudemanguy911/d70734d5bdf82e79cbfb22894fac8a1b/"
provides=(gtk2=$pkgver libgailutil.so libg{d,t}k-x11-2.0.so)
conflicts=('gtk2')
depends=('atk' 'pango' 'libxcursor' 'libxinerama' 'libxrandr' 'libxi' 'libxcomposite' 'libxdamage'
         'shared-mime-info' 'cairo' 'libcups' 'gtk-update-icon-cache' 'librsvg'
         'desktop-file-utils' 'gtk-doc')
makedepends=(gobject-introspection git gtk-doc)
optdepends=('gnome-themes-standard: Default widget theme'
            'adwaita-icon-theme: Default icon theme'
            'python2: gtk-builder-convert')
license=('LGPL')
install=gtk2.install
_commit=664537d6185800d7603438d4b9e18fbc6256ad41 # gtk-2-24
source=("git+https://gitlab.gnome.org/GNOME/gtk.git#commit=$_commit"
        gtkrc
        gtk-query-immodules-2.0.hook
        xid-collision-debug.patch
        gtk2-filechooser-icon-view.patch)

sha256sums=('SKIP'
            'bc968e3e4f57e818430130338e5f85a5025e21d7e31a3293b8f5a0e58362b805'
            '427e7ed2626465ea7a8986189b6c8340a0520b9f7b8e2a56cd1169d375da7425'
            'd758bb93e59df15a4ea7732cf984d1c3c19dff67c94b957575efea132b8fe558'
            '91e5c18be6dffc05af41561b38934259494bc14041a9c1d91b0b9b1a1dcd2be5')

prepare() {
  cd gtk
  git cherry-pick -n 2dbf31c0ea4f17a817b931c731f8de14c278300d
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
