# Maintainer: Dudemanguy <random342@airmail.cc>
# Contributor: Vaporeon <vaporeon@vaporeon.io>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>


pkgbase=glib2-patched-thumbnailer
pkgname=(
  glib2-patched-thumbnailer
)
pkgver=2.86.3
pkgrel=1
pkgdesc="GLib2 patched with ahodesuka's thumbnailer patch."
url="https://gist.github.com/Dudemanguy/d199759b46a79782cc1b301649dec8a5"
license=(LGPL-2.1-or-later)
arch=(x86_64)
conflicts=('glib2')
depends=(
  bash
  glibc
  libffi
  libsysprof-capture
  pcre2
  util-linux-libs
  tumbler
  zlib
)
makedepends=(
  dbus
  dconf
  gettext
  gi-docgen
  git
  gobject-introspection
  libelf
  meson
  python
  python-docutils
  python-packaging
  shared-mime-info
  util-linux
)
checkdepends=(
  desktop-file-utils
  glib2
)
source=(
  "git+https://gitlab.gnome.org/GNOME/glib.git?signed#tag=$pkgver"
  "git+https://gitlab.gnome.org/GNOME/gvdb.git"
  0001-glib-compile-schemas-Remove-noisy-deprecation-warnin.patch
  0002-gdesktopappinfo-Add-more-known-terminals.patch
  0003-meson.build-Avoid-linking-with-libatomic.patch
  0004-glocalfileinfo-add-dbus-thumbnail-generation-request.patch
  gio-querymodules.hook
  glib-compile-schemas.hook
)
b2sums=('c384d8196e7966261d78245b59a0d14a061d49f7fb15faebd6e10527eb58c2893bffaee30f894b45feaeb1e1d8ccfc65e79958c42458b298e1e9675f68202780'
        'SKIP'
        '47cd08ba7e4b3ca0cd19f6dc20e4d73e30cf90f2b78c3d620ee0c7a4d8a4b325a5e88ec2dcc3a63402c16cc1ce8061130afc313e3cbfcd220dff3e642b113a69'
        'cc39621757253c9f9e11da4ae40dc16d24f2898a7ee34fbfe5b7709c4f0139c04fab6c1138402c16859b2421c45d55bdde522aa1a1b2c6c3544d87b7c2d10dff'
        '1213701c3058300eb12db0b07010936c10d975825a6e5ebffc20aef809005973f7f1c0b108dea18a65cb6819eed9dcefdb6da6357aef75a778dbd11e14f31be1'
        '84be383030a30f3c681e3b444e7475b7ea7653bf873f3548a77cb00860fc4e1e4731e83be888068dbb36f8ba63d5322449f9d11dbe619de8bea8f9c96e46d2f0'
        '14c9211c0557f6d8d9a914f1b18b7e0e23f79f4abde117cb03ab119b95bf9fa9d7a712aa0a29beb266468aeb352caa3a9e4540503cfc9fe0bbaf764371832a96'
        'd30d349b4cb4407839d9074ce08f5259b8a5f3ca46769aabc621f17d15effdb89c4bf19bd23603f6df3d59f8d1adaded0f4bacd0333afcab782f2d048c882858')
validpgpkeys=(
  53EF3DC3B63E2899271BD26322E8091EEA11BBB7 # Emmanuele Bassi <ebassi@gnome.org>
  923B7025EE03C1C59F42684CF0942E894B2EAFA0 # Philip Withnall <pwithnall@gnome.org>
)

prepare() {
  cd glib

  # Suppress noise from glib-compile-schemas.hook
  git apply -3 ../0001-glib-compile-schemas-Remove-noisy-deprecation-warnin.patch

  # Add ghostty and ptyxis to known terminals list
  # This is a downstream only patch; GNOME will not add new terminal emulators.
  # https://gitlab.gnome.org/GNOME/glib/-/issues/338#note_1076172
  git apply -3 ../0002-gdesktopappinfo-Add-more-known-terminals.patch

  # Drop dep on libatomic
  # https://gitlab.archlinux.org/archlinux/packaging/packages/qemu/-/issues/6
  # https://gitlab.gnome.org/GNOME/glib/-/issues/3407
  # https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4774
  git apply -3 ../0003-meson.build-Avoid-linking-with-libatomic.patch

  # Apply patch to generate thumbnails
  git apply -3 ../0004-glocalfileinfo-add-dbus-thumbnail-generation-request.patch

  git submodule init
  git submodule set-url subprojects/gvdb "$srcdir/gvdb"
  git -c protocol.file.allow=always -c protocol.allow=never submodule update
}

build() {
  local meson_options=(
    --default-library both
    -D dtrace=disabled
    -D glib_debug=disabled
    -D introspection=enabled
    -D man-pages=enabled
    -D selinux=disabled
    -D sysprof=enabled
    -D systemtap=disabled
  )

  # Produce more debug info: GLib has a lot of useful macros
  CFLAGS+=" -g3"
  CXXFLAGS+=" -g3"

  # use fat LTO objects for static libraries
  CFLAGS+=" -ffat-lto-objects"
  CXXFLAGS+=" -ffat-lto-objects"

  arch-meson glib build "${meson_options[@]}"
  meson compile -C build
}

check() {
   # Test fails even without dbus patch for some reason. Skip for now.
   meson test -C build --no-suite flaky --no-suite slow --print-errorlogs ||:
}

package_glib2-patched-thumbnailer() {
  depends+=(
    libffi.so
    libmount.so
  )
  provides+=(glib2=$pkgver libg{lib,io,irepository,module,object,thread}-2.0.so)
  optdepends=(
    'dconf: GSettings storage backend'
    'glib2-devel: development tools'
    'gvfs: most gio functionality'
  )
  options+=(!docs staticlibs)
  install=glib2.install

  meson install -C build --destdir "$pkgdir"

  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 *.hook
  touch "$pkgdir/usr/lib/gio/modules/.keep"

  python -m compileall -d /usr/share/glib-2.0/codegen \
    "$pkgdir/usr/share/glib-2.0/codegen"
  python -O -m compileall -d /usr/share/glib-2.0/codegen \
    "$pkgdir/usr/share/glib-2.0/codegen"

  # Remove glib2-devel files
  rm -rf $pkgdir/usr/bin/gdbus-codegen
  rm -rf $pkgdir/usr/bin/glib-{mkenums,genmarshal}
  rm -rf $pkgdir/usr/bin/gresource
  rm -rf $pkgdir/usr/bin/gtester{,-report}

  rm -rf $pkgdir/usr/share/gdb/
  rm -rf $pkgdir/usr/share/glib-2.0/gdb/
  rm -rf $pkgdir/usr/share/glib-2.0/codegen/

  rm -rf $pkgdir/usr/share/bash-completion/completions/gresource

  rm -rf $pkgdir/usr/share/man/man1/gdbus-codegen.1
  rm -rf $pkgdir/usr/share/man/man1/glib-{mkenums,genmarshal}.1
  rm -rf $pkgdir/usr/share/man/man1/gresource.1
  rm -rf $pkgdir/usr/share/man/man1/gtester{,-report}.1
}

# vim:set sw=2 sts=-1 et:
