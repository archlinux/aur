# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: TryA <tryagainprod@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgbase=lib32-libproxy
pkgname=(
  lib32-libproxy
)
pkgver=0.5.12
pkgrel=1
pkgdesc="Automatic proxy configuration management library (32-bit)"
url="https://libproxy.github.io/libproxy/"
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(
  lib32-curl
  lib32-duktape
  lib32-gcc-libs
  lib32-glib2
  lib32-glibc
  libproxy
)
makedepends=(
  git
  gsettings-desktop-schemas
  meson
)
source=(
  "git+https://github.com/libproxy/libproxy#tag=$pkgver"
)
b2sums=('aa049e4f7f37683b5c64e35770e9c3e5463d4fcf81e259c9bbd2facbd34f2eec46f28a455d9252bef475bf33bf39c70fa274a8470f5c6279f5e9e1c2de1e04b9')

prepare() {
  cd libproxy
}

build() {
  local meson_options=(
    --cross-file lib32
    -D docs=false
    -D introspection=false
    -D release=true
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
