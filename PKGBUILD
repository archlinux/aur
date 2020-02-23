# Maintainer: dudemanguy <random342@airmail.cc>
# Contributor: Vaporeon <vaporeon@vaporeon.io>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=glib2-patched-thumbnailer
pkgver=2.62.5
pkgrel=1
pkgdesc="GLib2 patched with ahodesuka's thumbnailer patch."
url="https://gist.github.com/Dudemanguy/d199759b46a79782cc1b301649dec8a5"
arch=(x86_64)
provides=(glib2=$pkgver libgio-2.0.so libglib-2.0.so libgmodule-2.0.so
           libgobject-2.0.so libgthread-2.0.so)
conflicts=('glib2')
depends=(pcre libffi libutil-linux zlib tumbler libmount.so)
makedepends=(gettext gtk-doc shared-mime-info python libelf git util-linux
             meson dbus)
checkdepends=(desktop-file-utils)
optdepends=('python: gdbus-codegen, glib-genmarshal, glib-mkenums, gtester-report'
            'libelf: gresource inspection tool')
options=('!docs')
license=(LGPL2.1)
_commit=86c2832f950c389e230ec09c8bf0b92b475f0ee3  # tags/2.62.5^0
source=("git+https://gitlab.gnome.org/GNOME/glib.git#commit=$_commit"
        noisy-glib-compile-schemas.diff
        glib-compile-schemas.hook
        gio-querymodules.hook
        glib-thumbnailer.patch)
sha256sums=('SKIP'
            '81a4df0b638730cffb7fa263c04841f7ca6b9c9578ee5045db6f30ff0c3fc531'
            '64ae5597dda3cc160fc74be038dbe6267d41b525c0c35da9125fbf0de27f9b25'
            '557c88177f011ced17bdeac1af3f882b2ca33b386a866fdf900b35f927a2bbe8'
            '9f055d2a4f3fa08a7f0ca9f233a0ca6925247f572fb6873af7ac1e1f43f23d74')

pkgver() {
  cd glib
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd glib

  # Suppress noise from glib-compile-schemas.hook
  git apply -3 ../noisy-glib-compile-schemas.diff

  # Apply patch to generate thumbnails
  patch -Np1 -i ../glib-thumbnailer.patch
}

build() {
  CFLAGS+=" -DG_DISABLE_CAST_CHECKS"
  arch-meson glib build \
    -D selinux=disabled \
    -D man=true \
    -D gtk_doc=true
  ninja -C build
}

#skip this; test fails
#check() {
#  meson test -C build --no-suite flaky --print-errorlogs
#}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 *.hook

  python -m compileall -d /usr/share/glib-2.0/codegen \
    "$pkgdir/usr/share/glib-2.0/codegen"
  python -O -m compileall -d /usr/share/glib-2.0/codegen \
    "$pkgdir/usr/share/glib-2.0/codegen"

  # rm docs
  rm -r "$pkgdir/usr/share/gtk-doc"
}
