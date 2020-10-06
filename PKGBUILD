# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Mikko Seppälä <t-r-a-y@mbnet.fi>

pkgname=lib32-glib2-git
pkgver=2.64.0+250+gf733eff2e
pkgrel=1
pkgdesc="Low level core library (32-bit)"
url="https://wiki.gnome.org/Projects/GLib"
license=(LGPL2.1)
arch=(x86_64)
depends=(lib32-pcre lib32-libffi lib32-util-linux lib32-zlib glib2)
makedepends=(gettext shared-mime-info python lib32-libelf git util-linux
             meson lib32-dbus)
#checkdepends=(desktop-file-utils lib32-glib2)
source=("git+https://gitlab.gnome.org/GNOME/glib.git"
        multilib.diff
        gio-querymodules-32.hook)
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd glib
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd glib

  # Test suite workaround
  git apply -3 ../multilib.diff
}

build() {
  export CC="gcc -m32 -mstackrealign"
  export CXX="g++ -m32 -mstackrealign"
  export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"

  CFLAGS+=" -DG_DISABLE_CAST_CHECKS"
  arch-meson glib build \
    -D selinux=disabled \
    --libdir=/usr/lib32
  meson compile -C build
}

#check() {
  # Spurious wakeups in g_cond_wait_until, only on lib32
#  meson test -C build --no-suite flaky --no-suite slow --print-errorlogs || :
#}

package() {
  depends+=(libmount.so)
  conflicts=(lib32-glib2)
  provides+=(lib32-glib2 libgio-2.0.so libglib-2.0.so libgmodule-2.0.so libgobject-2.0.so
             libgthread-2.0.so)

  DESTDIR="$pkgdir" meson install -C build

  rm -r "$pkgdir"/usr/{share,include}
  find "$pkgdir/usr/bin" -type f -not -name gio-querymodules -printf 'Removing %P\n' -delete
  mv "$pkgdir"/usr/bin/gio-querymodules{,-32}

  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 *.hook
}

# vim:set sw=2 et:
