# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=gjs-nohammer
pkgver=1.82.1
pkgrel=2
epoch=2
pkgdesc="Javascript Bindings for GNOME"
url="https://wiki.gnome.org/Projects/Gjs"
arch=(x86_64)
license=(LGPL-2.0-or-later)
depends=(
  cairo
  dconf
  gcc-libs
  glib2
  glibc
  gobject-introspection-runtime
  js128
  libffi
  libgirepository
  libsysprof-capture
  libx11
  readline
)
makedepends=(
  dbus
  git
  gobject-introspection
  meson
)
checkdepends=(
  gtk3
  gtk4
  xorg-server-xvfb
)
provides=(libgjs.so gjs)
conflicts=(gjs)
source=("git+https://gitlab.gnome.org/GNOME/gjs.git#tag=$pkgver"
        "git+https://gitlab.gnome.org/GNOME/gobject-introspection-tests.git"
        nohammer.patch)
b2sums=('db5fa6aea38f73baddc27643ffc09154fec12aa135a2943e8c6fc782efd053c1787d8fd5251fb605aef96dedb94ea11d8de4707c11f790c3da7a6d7eacb471d2'
        'SKIP'
        'SKIP')

prepare() {
  cd gjs

  git submodule init
  git submodule set-url subprojects/gobject-introspection-tests "${srcdir}/gobject-introspection-tests"
  git -c protocol.file.allow=always -c protocol.allow=never submodule update
  
  patch -Np1 < ../nohammer.patch

  # printf() supports %I alternative int syntax
  ## Meson disables code optimization (sets -O0) during the dependency-check phase.
  ## This causes conflicts with the default Arch build flag -D_FORTIFY_SOURCE=3,
  ## leading to the following warning (and a failed dependency check due to -Werror):
  ##     # warning: _FORTIFY_SOURCE requires compiling with optimization (-O)
  ## This adjustment offers a workaround for the issue.
  ## https://gitlab.gnome.org/GNOME/gjs/-/issues/671
  sed -i "s/'-Werror'/'-Werror=format'/" meson.build
}

build() {
  local meson_options=(
    -D installed_tests=false
  )

  arch-meson gjs build "${meson_options[@]}"
  meson compile -C build
}

check() {
  dbus-run-session xvfb-run -s '-nolisten local' \
    meson test -C build --print-errorlogs
}

package() {
  depends+=(libreadline.so)
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
