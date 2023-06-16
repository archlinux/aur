# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: TryA <tryagainprod@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgbase=lib32-libproxy
pkgname=(
  lib32-libproxy
)
pkgver=0.5.2
pkgrel=1
pkgdesc="Automatic proxy configuration management library (32-bit)"
url="https://libproxy.github.io/libproxy/"
arch=(x86_64)
license=(LGPL)
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
_commit=e4f467b05c8adf25e5a2d5464914fc7e92bb7990  # tags/0.5.2^0
source=("git+https://github.com/libproxy/libproxy#commit=$_commit")
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
    --libdir=/usr/lib32
    -D docs=false
    -D introspection=false
    -D vapi=false
  )

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config

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
