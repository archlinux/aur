# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: TryA <tryagainprod@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgbase=lib32-libproxy
pkgname=(
  lib32-libproxy
)
pkgver=0.5.5
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
source=(
  "git+https://github.com/libproxy/libproxy#tag=$pkgver"
)
b2sums=('8d5cb6295541ef386e328a77ac9dd827c85da4d57ba50c910996c690d1fd9d97ef0d4df37183fdfa3e9bd7bcac7c5e54afc1cd83c157c0b7d01cc4cc298535b8')

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
