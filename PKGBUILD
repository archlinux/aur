# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: jtts <jussaar@mbnet.fi>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=lib32-colord-git
pkgver=1.4.4
pkgrel=1
pkgdesc='System daemon for managing color devices'
arch=(x86_64)
url=https://www.freedesktop.org/software/colord
license=(GPL2)
provides=(lib32-colord)
conflicts=(lib32-colord)
depends=(
  colord
  lib32-dconf
  lib32-libgudev
  lib32-libgusb
  lib32-lcms2
  lib32-polkit
  lib32-sqlite
  lib32-dbus
)
makedepends=(
  argyllcms
  bash-completion
  git
  gobject-introspection
  intltool
  meson
  python2
  sane
  vala
)
source=(git+https://github.com/hughsie/colord)
sha256sums=(SKIP)

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig

  arch-meson colord build \
    --libdir=/usr/lib32 \
    -D bash-completion=false \
    -D docs=false \
    -D man=false \
    -D tests=false \
    -D libcolordcompat=true \
    -D sane=false \
    -D vapi=true \
    -D print-profiles=false \
    -D daemon-user=colord
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
  rm -r "${pkgdir}"/usr/{bin,include,lib,share}
}

# vim: ts=2 sw=2 et:
