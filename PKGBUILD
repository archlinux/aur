# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: TryA <tryagainprod@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgbase=lib32-libproxy
pkgname=(
  lib32-libproxy
)
pkgver=0.5.4
pkgrel=1
pkgdesc="Automatic proxy configuration management library (32-bit)"
url="https://libproxy.github.io/libproxy/"
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(
  lib32-curl
  lib32-duktape
  lib32-glib2
  libproxy
)
makedepends=(
  git
  gsettings-desktop-schemas
  meson
)
_commit=dff9a603d823dcc740ec966cd27960daa6b891b1  # tags/0.5.4
source=(
  "git+https://github.com/libproxy/libproxy#commit=$_commit"
)
b2sums=('SKIP')

pkgver() {
  cd libproxy
  git describe --tags | sed 's/^libproxy-//;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd libproxy
}

build() {
  local meson_options=(
    --cross-file lib32
    -D docs=false
    -D introspection=false
    -D vapi=false
  )

  arch-meson libproxy build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package_lib32-libproxy() {
  provides=(libproxy.so)
  conflicts=()

  meson install -C build --destdir "$pkgdir"
  rm -r "$pkgdir"/usr/{bin,include,share}
}

# vim:set sw=2 sts=-1 et:
