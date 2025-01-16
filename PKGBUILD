# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Maximilian Stein <theoddbird@posteo.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgbase=lib32-libsoup3
pkgname=(
  lib32-libsoup3
)
pkgver=3.6.4
pkgrel=1
pkgdesc="HTTP client/server library for GNOME (32-bit)"
url="https://wiki.gnome.org/Projects/libsoup"
arch=(x86_64)
license=(LGPL-2.0-or-later)
depends=(
  lib32-brotli
  lib32-glib-networking
  lib32-glib2
  lib32-glibc
  lib32-krb5
  lib32-libnghttp2
  lib32-libpsl
  lib32-sqlite
  lib32-zlib
  libsoup3
)
makedepends=(
  git
  glib2-devel
  meson
  python-quart
  samba
)
checkdepends=(
  apache
  php-apache
)
source=("git+https://gitlab.gnome.org/GNOME/libsoup.git#tag=$pkgver")
b2sums=('6ade187a1ad53c36fc2824d1775242c21b85a751c6bbdd19877db722d3a317e99f30f5498c53e476536f6a0945b531a34de7c87ffae12740d38d9935adf63cac')

prepare() {
  cd libsoup
}

build() {
  local meson_options=(
    --cross-file lib32
    -D autobahn=disabled
    -D docs=disabled
    -D introspection=disabled
    -D krb5_config=krb5-config
    -D sysprof=disabled
    -D vapi=disabled
  )

  arch-meson libsoup build "${meson_options[@]}"
  meson compile -C build
}

check() {
  # Python's output buffering messes with the tests reading stdout lines from
  # http2-server.py through a pipe
  PYTHONUNBUFFERED=1 meson test -C build --print-errorlogs
}

package_lib32-libsoup3() {
  depends+=(
    libbrotlidec.so
    libgssapi_krb5.so
    libg{lib,object,io}-2.0.so
    libpsl.so
  )
  optdepends=('samba: Windows Domain SSO')
  provides+=(libsoup-3.0.so)

  meson install -C build --destdir "$pkgdir"

  rm -r "$pkgdir"/usr/{include,share}
}

# vim:set sw=2 sts=-1 et:
