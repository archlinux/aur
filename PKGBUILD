# Maintainer: Dudemanguy <random342@airmail.cc>
# Contributor: Vaporeon <vaporeon@tfwno.gf>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gtk2-patched-filechooser-icon-view
pkgver=2.24.33
pkgrel=4
pkgdesc="GTK2 patched with ahodesuka's filechooser-icon-view patch"
url="https://github.com/Dudemanguy/gtk/tree/gtk2-filechooser-icon-view"
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(
  atk
  cairo
  desktop-file-utils
  fontconfig
  gdk-pixbuf2
  glib2
  glibc
  gtk-update-icon-cache
  libcups
  librsvg
  libx11
  libxcomposite
  libxcursor
  libxdamage
  libxext
  libxfixes
  libxi
  libxinerama
  libxrandr
  libxrender
  pango
  shared-mime-info
)
makedepends=(
  git
  glib2-devel
  gobject-introspection
  gtk-doc
)
optdepends=(
  'adwaita-icon-theme: Default icon theme'
  'gnome-themes-standard: Default widget theme'
  'python: gtk-builder-convert'
)
provides=(
  gtk2=$pkgver
  libgailutil.so
  libg{d,t}k-x11-2.0.so
)
conflicts=('gtk2')
install=gtk2.install
source=(
  "git+https://gitlab.gnome.org/GNOME/gtk.git#tag=$pkgver"
  gtkrc
  gtk-query-immodules-2.0.hook
  0001-Lower-severity-of-XID-collision-warnings.patch
  gtk2-filechooser-icon-view.patch
)
b2sums=('1b18d1cfef55466209cf93be45af15dc058a8b74d13ab590cfc7f0b09b0584adc62d4330aaed65185c0142cc8c326e4274c8e75e0af94bec5be3cfcca105c1e6'
        '0583436972edcebb09ce6c3f445f6ea4d7f92132da0ef317ee93665b646061ba261281b0186ed6655e63bbb668c58e37f6987919d4c054ccda19ca034aa718dc'
        '9c531f9f605e1739e13c39c1cac22daddd9574f3082f18bcf0b9dfaa4c41f2485d55be03a9ed12fb4504d509f0d5ac63980a9d9349e3f80a06595c6430c78096'
        '45ecc976d9eb9d990fc204230aa052a6d1b2bdfdc94788be37d576ab262a1da49855eb46ecd4bfce4efde6e2f817a1660c6d1fa756be3b372f7f8d13b0ef0fd0'
        '3bfc017cdb94f604b6d211747641cc6564955c0f4108654cea11dc19a574854ee0d56019f34faa577f3b92708a2c7b57b4a1a2146c9d7772bf0a567288be60a6')

prepare() {
  cd gtk
  git apply -3 ../0001-Lower-severity-of-XID-collision-warnings.patch
  git apply -3 ../gtk2-filechooser-icon-view.patch
  sed -i '/AM_INIT_AUTOMAKE/s/]/ foreign]/' configure.ac
  autoreconf -fvi
}

build() {
  local configure_options=(
    --prefix=/usr
    --sysconfdir=/etc
    --localstatedir=/var
    --with-xinput=yes
    --disable-gtk-doc
  )

  CFLAGS+=" -Wno-error=implicit-int -Wno-error=incompatible-pointer-types"

  cd gtk
  ./configure "${configure_options[@]}"
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd gtk
  make DESTDIR="$pkgdir" install

  install -Dt "$pkgdir/usr/share/gtk-2.0" -m644 ../gtkrc
  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 ../gtk-query-immodules-2.0.hook

  # Built by GTK 4, shared with GTK 2/3
  rm "$pkgdir/usr/bin/gtk-update-icon-cache"
}

# vim:set sw=2 sts=-1 et:
