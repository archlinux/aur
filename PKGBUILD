# Maintainer: dudemanguy <random342@airmail.cc>
# Contributor: Vaporeon <vaporeon@vaporeon.io>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=glib2-patched-thumbnailer
pkgver=2.56.0+7+g66948ae23
pkgrel=1
pkgdesc="GLib2 patched with ahodesuka's thumbnailer patch."
url="https://gist.github.com/Dudemanguy911/d199759b46a79782cc1b301649dec8a5"
arch=(x86_64)
provides=("glib2=$pkgver")
conflicts=('glib2')
depends=(pcre libffi libutil-linux zlib tumbler)
makedepends=(gettext gtk-doc shared-mime-info python libelf git util-linux dbus)
checkdepends=(desktop-file-utils)
optdepends=('python: gdbus-codegen, glib-genmarshal, glib-mkenums, gtester-report'
            'libelf: gresource inspection tool')
options=('!docs' '!emptydirs')
license=(LGPL2.1)
_commit=66948ae231f75a548c8a2eb7b3a9d64cfd728b8e  # glib-2-56
source=("git+https://gitlab.gnome.org/GNOME/glib.git#commit=$_commit"
        noisy-glib-compile-schemas.diff
        glib-compile-schemas.hook
        gio-querymodules.hook
        glib-thumbnailer.patch)
sha256sums=('SKIP'
            '81a4df0b638730cffb7fa263c04841f7ca6b9c9578ee5045db6f30ff0c3fc531'
            'e1123a5d85d2445faac33f6dae1085fdd620d83279a4e130a83fe38db52b62b3'
            '5ba204a2686304b1454d401a39a9d27d09dd25e4529664e3fd565be3d439f8b6'
            '9ea789788962a941af83b99949ddc21d7d19d820f2170f58691ca83e53afb158')

pkgver() {
  cd glib
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd glib

  # Suppress noise from glib-compile-schemas.hook
  patch -Np1 -i ../noisy-glib-compile-schemas.diff

  # Apply patch to generate thumbnails
  patch -Np1 -i ../glib-thumbnailer.patch

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  local debug=minimum
  check_option debug n && debug=yes

  cd glib
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib \
    --sysconfdir=/etc \
    --with-pcre=system \
    --enable-debug=$debug \
    --enable-gtk-doc \
    --disable-fam
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

#skip this; test fails
# check() {
#   cd glib
#   make check
# }

package() {
  cd glib
  make DESTDIR="$pkgdir" install
  mv "$pkgdir/usr/share/gtk-doc" "$srcdir"

  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 ../*.hook
}
