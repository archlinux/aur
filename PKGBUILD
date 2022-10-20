# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Maximilian Stein <theoddbird@posteo.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgbase=lib32-libsoup3
pkgname=(lib32-libsoup3)
pkgver=3.2.1
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
options=(debug)
_commit=89c20462d24298734c7fd476ca4c87058438e52c  # tags/3.2.1^0
source=("git+https://gitlab.gnome.org/GNOME/libsoup.git#commit=$_commit"
        0001-server-connection-Don-t-destroy-IO-data-during-steal.patch
        0002-server-connection-Ensure-we-clean-up-the-socket.patch)
b2sums=('SKIP'
        '309547e8e465511c1f6bdcb40d77e4313801e1d8514a06222b56e1cdc66f646e52558754219e3f7f805b89375c4c9f54e371d52db7e3317da1cb4d15acf7048b'
        'd705bbaca99650be7b2e47e73be1d8303fea9209bce25c2a411da03f3adcfa0500f9b834d4b5b33ed727700472486703c4203ec1d28f762c6f32b8b2dcb8d08e')

pkgver() {
  cd libsoup
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd libsoup
  
  # https://gitlab.gnome.org/GNOME/libsoup/-/issues/309
  git cherry-pick -n 5ce3a206aeaab8c01431ead75ea8107729447d8b
  git apply -3 ../0001-server-connection-Don-t-destroy-IO-data-during-steal.patch
  git apply -3 ../0002-server-connection-Ensure-we-clean-up-the-socket.patch
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
