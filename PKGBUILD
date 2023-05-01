# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Maximilian Stein <theoddbird@posteo.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgbase=lib32-libsoup3
pkgname=(lib32-libsoup3)
pkgver=3.4.2
pkgrel=1
pkgdesc="HTTP client/server library for GNOME (32-bit)"
url="https://wiki.gnome.org/Projects/libsoup"
arch=(x86_64)
license=(LGPL)
depends=(
  lib32-brotli
  lib32-glib-networking
  lib32-glib2
  lib32-krb5
  lib32-libnghttp2
  lib32-libpsl
  lib32-sqlite
  libsoup3
)
makedepends=(
  git
  meson
  python-quart
  samba
)
checkdepends=(
  apache
  php-apache
)
_commit=b78cb58ee9b47f8ffe18697ee3b096743a01e6a8  # tags/3.4.2^0
source=("git+https://gitlab.gnome.org/GNOME/libsoup.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd libsoup
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd libsoup
}

build() {
  local meson_options=(
    --libdir=/usr/lib32
    -D autobahn=disabled
    -D docs=disabled
    -D introspection=disabled
    -D sysprof=disabled
    -D vapi=disabled
  )

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG='i686-pc-linux-gnu-pkg-config'

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
