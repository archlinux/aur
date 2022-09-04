# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Maximilian Stein <theoddbird@posteo.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgname=lib32-libsoup3
pkgver=3.0.8
pkgrel=1
pkgdesc='HTTP client/server library for GNOME'
url=https://wiki.gnome.org/Projects/libsoup
arch=(x86_64)
license=(LGPL)
depends=(
  lib32-brotli
  lib32-glib-networking
  lib32-krb5
  lib32-libxml2
  lib32-sqlite
  lib32-libpsl
  lib32-libnghttp2
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
optdepends=('samba: Windows Domain SSO')
options=(debug)
_commit=66b1deac20ce3857d0c6cf225d4517027e532c0b  # tags/3.0.8^0
source=(git+https://gitlab.gnome.org/GNOME/libsoup.git#tag=${_commit})
sha256sums=('SKIP')

pkgver() {
  cd libsoup
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG='i686-pc-linux-gnu-pkg-config'

  arch-meson libsoup build \
    --libdir=/usr/lib32 \
    -D gtk_doc=false \
    -D autobahn=disabled \
    -D introspection=disabled \
    -D sysprof=disabled \
    -D vapi=disabled
  meson compile -C build
}

check() {
  # Python's output buffering messes with the tests reading stdout lines from
  # http2-server.py through a pipe
  PYTHONUNBUFFERED=1 meson test -C build --print-errorlogs
}

package() {
  depends+=(
    libbrotlidec.so
    libgssapi_krb5.so
    libg{lib,object,io}-2.0.so
    libpsl.so
  )
  provides+=(libsoup-3.0.so)

  meson install -C build --destdir "${pkgdir}"
  rm -rf "${pkgdir}"/usr/{include,share}
}

# vim:set sw=2 sts=-1 et:
