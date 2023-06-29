# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: TryA <tryagainprod@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgbase=lib32-libproxy
pkgname=(
  lib32-libproxy
)
pkgver=0.5.2
pkgrel=2
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
source=(
  "git+https://github.com/libproxy/libproxy#commit=$_commit"
  0001-Fix-crash-querying-URLs-without-a-host.patch
)
b2sums=('SKIP'
        '32672271cce8d52c6051e51d5ccaf6186bcc26a582cd7e746e53ccc5c632c2f3019a1abfdc2c08ba9bf32a62af87ad027fce0a54b48c4abfdc8c4b7c700c7007')

pkgver() {
  cd libproxy
  git describe --tags | sed 's/^libproxy-//;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd libproxy

  # https://bugs.archlinux.org/task/78881
  git apply -3 ../0001-Fix-crash-querying-URLs-without-a-host.patch
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
