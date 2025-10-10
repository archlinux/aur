# Maintainer:
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Yichao Yu <yyc1992@gmail.com>
# Contributor: kfgz <kfgz@interia.pl>

pkgbase=glib2-git
pkgname=(
  glib2-git
  glib2-devel-git
  glib2-docs-git
)
pkgver=2.86.0.r146.gd54816d
pkgrel=1
pkgdesc="Low Level Core Library"
url="https://gitlab.gnome.org/GNOME/glib"
license=(LGPL-2.1-or-later)
arch=('x86_64')
depends=(
  bash
  glibc
  libffi
  libsysprof-capture
  pcre2
  util-linux-libs
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
)
source=("git+https://gitlab.gnome.org/GNOME/glib.git"
        "git+https://gitlab.gnome.org/GNOME/gvdb.git"
        0001-noisy-glib-compile-schemas.patch
        0002-gdesktopappinfo-Add-more-known-terminals.patch
        0003-meson.build-Avoid-linking-with-libatomic-when-unneed.patch
        glib-compile-schemas.hook
        gio-querymodules.hook
)
b2sums=('SKIP'
        'SKIP'
        '4ddbd31f5f466fce99d82890292ff922555a9ab379d22202aeea5127f58798668f871dea0485cc0f458069276ad512412285ede6c8f3e36bea899358f49e931a'
        'cc39621757253c9f9e11da4ae40dc16d24f2898a7ee34fbfe5b7709c4f0139c04fab6c1138402c16859b2421c45d55bdde522aa1a1b2c6c3544d87b7c2d10dff'
        '76033114a10d3df461981502eb386d0d6e645eaf27885f5e6dc75bc8495d770e0e75338f7191ae534825b30b75a84e2e9889f33fcdbd109ae10a85c2d34b1e28'
        'acc2f474139e535f4bdd70ac22a9150f786b3395e679b14d0d3fbb9361d511bb1b5069d95b2a7ac9c0f3d901b03a0c037eb273446ba00764191b30a777bd2bc9'
        '14c9211c0557f6d8d9a914f1b18b7e0e23f79f4abde117cb03ab119b95bf9fa9d7a712aa0a29beb266468aeb352caa3a9e4540503cfc9fe0bbaf764371832a96')

pkgver() {
    cd glib
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd glib

  # Suppress noise from glib-compile-schemas.hook
  git apply -3 ../0001-noisy-glib-compile-schemas.patch

  # Add ghostty and ptyxis to known terminals list
  git apply -3 ../0002-gdesktopappinfo-Add-more-known-terminals.patch

  # drop dep on libatomic
  git apply -3 ../0003-meson.build-Avoid-linking-with-libatomic-when-unneed.patch

  git submodule init
  git submodule set-url subprojects/gvdb "$srcdir/gvdb"
  git -c protocol.file.allow=always -c protocol.allow=never submodule update
}

build () {
  local meson_options=(
    --default-library both
    -D documentation=true
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
  meson test -C build --no-suite flaky --no-suite slow --print-errorlogs
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_glib2-git() {
  depends+=(
    libffi.so
    libmount.so
  )
  provides+=(libg{lib,io,irepository,module,object,thread}-2.0.so)
  optdepends=(
    'dconf: GSettings storage backend'
    'glib2-devel: development tools'
    'gvfs: most gio functionality'
  )
  options+=(staticlibs)
  install=glib2.install
  provides+=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  meson install -C build --destdir "$pkgdir"

  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 *.hook
  touch "$pkgdir/usr/lib/gio/modules/.keep"

  python -m compileall -d /usr/share/glib-2.0/codegen "$pkgdir/usr/share/glib-2.0/codegen"
  python -O -m compileall -d /usr/share/glib-2.0/codegen "$pkgdir/usr/share/glib-2.0/codegen"

  cd "$pkgdir"

  # Split docs
  _pick docs usr/share/doc

  # Split devel
  _pick devel usr/bin/gdbus-codegen
  _pick devel usr/bin/glib-{mkenums,genmarshal}
  _pick devel usr/bin/gresource
  _pick devel usr/bin/gtester{,-report}

  _pick devel usr/share/gdb/
  _pick devel usr/share/glib-2.0/gdb/
  _pick devel usr/share/glib-2.0/codegen/

  _pick devel usr/share/bash-completion/completions/gresource

  _pick devel usr/share/man/man1/gdbus-codegen.1
  _pick devel usr/share/man/man1/glib-{mkenums,genmarshal}.1
  _pick devel usr/share/man/man1/gresource.1
  _pick devel usr/share/man/man1/gtester{,-report}.1
}

package_glib2-devel-git() {
  pkgdesc+=" - development files"
  depends=(
    glib2-git
    glibc
    libelf
    python
    python-packaging
  )
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")
  mv devel/* "$pkgdir"
}

package_glib2-docs-git() {
  pkgdesc+=" - documentation"
  arch=(any)
  depends=()
  license+=(LicenseRef-Public-Domain)
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  mv docs/* "$pkgdir"
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 glib/docs/reference/COPYING
}

# vim: set ts=2 sw=2 et:
