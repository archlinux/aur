# Maintainer: Volodymyr Zhdanov <wight554@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgname=glib2
pkgname=$_pkgname-clear
pkgbase=$_pkgname-clear
pkgver=2.60.6
pkgrel=2
pkgdesc="Low level core library"
url="https://wiki.gnome.org/Projects/GLib"
license=(LGPL2.1)
arch=(x86_64)
depends=(pcre libffi libutil-linux zlib)
makedepends=(gettext shared-mime-info python libelf git util-linux meson dbus)
checkdepends=(desktop-file-utils)
optdepends=('python: gdbus-codegen, glib-genmarshal, glib-mkenums, gtester-report'
            'libelf: gresource inspection tool')
conflicts=($_pkgname)
# provides=($_pkgname=$pkgver)  # Current pkgver is so old that it should not provide glib2 to Arch
options=(!emptydirs)
_commit=0a63daa96426715498b55318f68a67baee40c509  # tags/2.60.6^0
_clcommit=c57f2dff8fa0f25043e4d2ce608a2abd57ee7860  # tags/2.60.6-98^0
source=("git+https://github.com/GNOME/glib.git#commit=$_commit"
        "clearlinux::git+https://github.com/clearlinux-pkgs/glib.git#commit=$_clcommit"
        noisy-glib-compile-schemas.diff
        glib-compile-schemas.hook gio-querymodules.hook)
sha256sums=('SKIP'
            'SKIP'
            '81a4df0b638730cffb7fa263c04841f7ca6b9c9578ee5045db6f30ff0c3fc531'
            'e1123a5d85d2445faac33f6dae1085fdd620d83279a4e130a83fe38db52b62b3'
            '5ba204a2686304b1454d401a39a9d27d09dd25e4529664e3fd565be3d439f8b6')

pkgver() {
  cd glib
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd glib

  # Suppress noise from glib-compile-schemas.hook
  patch -Np1 -i ../noisy-glib-compile-schemas.diff

  # Add Clearlinux patches add-multilib-config.patch
  for i in $(grep '^Patch' ${srcdir}/clearlinux/glib.spec | sed -n 's/.*: //p'); do
    msg2 "Applying patch ${i}..."
    patch -Np1 -i "$srcdir/clearlinux/${i}"
  done
}

build() {
  CFLAGS+=" -DG_DISABLE_CAST_CHECKS -O3 -falign-functions=32 -fcf-protection=full \
            -ffat-lto-objects -flto=4 -fno-math-errno -fno-semantic-interposition \
            -fno-trapping-math -fstack-protector-strong"
  CXXFLAGS+=" -O3 -falign-functions=32 -fcf-protection=full \
              -ffat-lto-objects -flto=4 -fno-math-errno -fno-semantic-interposition \
              -fno-trapping-math -fstack-protector-strong"
  arch-meson glib build \
    -D selinux=disabled
  ninja -C build
}

check() {
  meson test -C build --no-suite flaky --print-errorlogs
}

package_glib2-clear() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 *.hook

  python -m compileall -d /usr/share/glib-2.0/codegen "$pkgdir/usr/share/glib-2.0/codegen"
  python -O -m compileall -d /usr/share/glib-2.0/codegen "$pkgdir/usr/share/glib-2.0/codegen"
}

# vim:set sw=2 et:
