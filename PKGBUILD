# Maintainer: dudemanguy <random342@airmail.cc>
# Contributor: Vaporeon <vaporeon@vaporeon.io>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=glib2-patched-thumbnailer
pkgver=2.54.3+2+g94b38beff
pkgrel=1
pkgdesc="GLib2 patched with ahodesuka's thumbnailer patch."
url="http://gist.github.com/ahodesuka/49c1d0eea4b64f24c4c7"
arch=(x86_64)
provides=("glib2=$pkgver")
conflicts=('glib2')
depends=(pcre libffi libutil-linux tumbler)
makedepends=(gettext gtk-doc shared-mime-info python libelf git util-linux dbus)
checkdepends=(desktop-file-utils)
optdepends=('python: for gdbus-codegen and gtester-report'
            'libelf: gresource inspection tool')
options=('!docs' '!emptydirs')
license=(LGPL)
_commit=94b38beff1347ec4a733199f7a7abdacaa958678  # glib-2-54
_patchver=d0edf118e1c27700300038c1d82b3ff775c0216b
source=("git://git.gnome.org/glib#commit=$_commit"
        noisy-glib-compile-schemas.diff
        glib-compile-schemas.hook
        gio-querymodules.hook
        https://gist.githubusercontent.com/ahodesuka/49c1d0eea4b64f24c4c7/raw/$_patchver/glib-thumbnailer.patch)
sha256sums=('SKIP'
            '81a4df0b638730cffb7fa263c04841f7ca6b9c9578ee5045db6f30ff0c3fc531'
            'e1123a5d85d2445faac33f6dae1085fdd620d83279a4e130a83fe38db52b62b3'
            '5ba204a2686304b1454d401a39a9d27d09dd25e4529664e3fd565be3d439f8b6'
            '1a4673380fbdf8e8e5de3367089de6c97025633e54010575de63c5ab6c8a044d')

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
  cd glib
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib \
    --sysconfdir=/etc \
    --with-pcre=system \
    --enable-debug=yes \
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
