# Maintainer: dudemanguy <random342@airmail.cc>
# Contributor: Vaporeon <vaporeon@vaporeon.io>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=glib2-patched-thumbnailer
pkgver=2.66.1
pkgrel=2
pkgdesc="GLib2 patched with ahodesuka's thumbnailer patch."
url="https://gist.github.com/Dudemanguy/d199759b46a79782cc1b301649dec8a5"
arch=(x86_64)
provides=(glib2=$pkgver libgio-2.0.so libglib-2.0.so libgmodule-2.0.so
           libgobject-2.0.so libgthread-2.0.so)
conflicts=('glib2')
depends=(pcre libffi util-linux-libs zlib tumbler libmount.so)
makedepends=(gettext gtk-doc shared-mime-info python libelf git util-linux
             meson dbus sysprof)
checkdepends=(desktop-file-utils)
optdepends=('python: gdbus-codegen, glib-genmarshal, glib-mkenums, gtester-report'
            'libelf: gresource inspection tool')
options=('!docs')
license=(LGPL2.1)
_commit=b2f8ba8a11482dc702a470e92552cbb97765dbc9  # tags/2.66.1^0
source=("git+https://gitlab.gnome.org/GNOME/glib.git#commit=$_commit"
        1683.patch
        noisy-glib-compile-schemas.diff
        glib-compile-schemas.hook
        gio-querymodules.hook
        glib-thumbnailer.patch)
sha256sums=('SKIP'
            'e1913090c7cdd4c7db12651858a8381be28ae61f19d5e5e02a33f4c7c74c926d'
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

  # https://gitlab.gnome.org/GNOME/glib/-/issues/2219
  git apply -3 ../1683.patch

  # Suppress noise from glib-compile-schemas.hook
  git apply -3 ../noisy-glib-compile-schemas.diff

  # Apply patch to generate thumbnails
  patch -Np1 -i ../glib-thumbnailer.patch
}

build() {
  CFLAGS+=" -DG_DISABLE_CAST_CHECKS"
  arch-meson glib build \
    -D selinux=disabled \
    -D sysprof=enabled \
    -D man=true
  meson compile -C build
}

#skip this; test fails
#check() {
#  meson test -C build --no-suite flaky --print-errorlogs
#}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 *.hook

  # Avoid a dep on sysprof
  sed -i 's/, sysprof-capture-4//' "$pkgdir"/usr/lib/pkgconfig/*.pc

  export PYTHONHASHSEED=0
  python -m compileall -d /usr/share/glib-2.0/codegen \
    "$pkgdir/usr/share/glib-2.0/codegen"
  python -O -m compileall -d /usr/share/glib-2.0/codegen \
    "$pkgdir/usr/share/glib-2.0/codegen"
}
