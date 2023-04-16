# Maintainer: dudemanguy <random342@airmail.cc>
# Contributor: Vaporeon <vaporeon@tfwno.gf>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gtk2-patched-filechooser-icon-view
pkgver=2.24.33
pkgrel=3
pkgdesc="GTK2 patched with ahodesuka's filechooser-icon-view patch"
url="https://github.com/Dudemanguy/gtk/tree/gtk2-filechooser-icon-view"
arch=(x86_64)
depends=(
  atk
  cairo
  desktop-file-utils
  gtk-update-icon-cache
  libcups
  librsvg
  libxcomposite
  libxcursor
  libxdamage
  libxi
  libxinerama
  libxrandr
  pango
  shared-mime-info
)
makedepends=(
  git
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
license=('LGPL')
install=gtk2.install
_commit=68631945733158f164427db84f01301d7e875763  # tags/2.24.33^0
source=(
  "git+https://gitlab.gnome.org/GNOME/gtk.git#commit=$_commit"
  gtkrc
  gtk-query-immodules-2.0.hook
  xid-collision-debug.patch
  gtk2-filechooser-icon-view.patch
)
b2sums=('SKIP'
        '0583436972edcebb09ce6c3f445f6ea4d7f92132da0ef317ee93665b646061ba261281b0186ed6655e63bbb668c58e37f6987919d4c054ccda19ca034aa718dc'
        '9c531f9f605e1739e13c39c1cac22daddd9574f3082f18bcf0b9dfaa4c41f2485d55be03a9ed12fb4504d509f0d5ac63980a9d9349e3f80a06595c6430c78096'
        'c35b2f16ea3402f41a7a5ac83a93b423e46f9355e11186742402887ba94fc58e9a5c1d7fc55141fab72f230a973c5ac6346090b225a5eff9e416e397bd1b1ec4'
        '3bfc017cdb94f604b6d211747641cc6564955c0f4108654cea11dc19a574854ee0d56019f34faa577f3b92708a2c7b57b4a1a2146c9d7772bf0a567288be60a6')

pkgver() {
  cd gtk
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd gtk
  git apply -3 ../xid-collision-debug.patch
  git apply -3 ../gtk2-filechooser-icon-view.patch
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  local configure_options=(
    --prefix=/usr
    --sysconfdir=/etc
    --localstatedir=/var
    --with-xinput=yes
    --disable-gtk-doc
  )

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
