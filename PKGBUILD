# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Maximilian Stein <theoddbird@posteo.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgbase=lib32-libsoup3
pkgname=(
  lib32-libsoup3
)
pkgver=3.6.5
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
b2sums=('30f845d794b0dd6350f4d39f53ce7f60308f25fb692d27e7e833468f91a126951ae08c24e6907815b664924d9839b821a8777dffcc7dcc681951c781696fbc63')

prepare() {
  cd libsoup
}

build() {
  local meson_options=(
    --cross-file lib32
    -D autobahn=disabled
    -D docs=disabled
    -D introspection=disabled
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
