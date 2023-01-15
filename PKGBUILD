# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: jtts <jussaar@mbnet.fi>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=lib32-dconf
pkgver=0.40.0
pkgrel=3
pkgdesc='A low-level configuration system (32-bit)'
arch=(x86_64)
url=https://live.gnome.org/dconf
license=(LGPL2.1)
depends=(
  dconf
  lib32-glib2
)
makedepends=(
  git
  lib32-dbus
  meson
)
_tag=4c0a26052efafae923eba42d14c5cb88da745de2
source=(git+https://gitlab.gnome.org/GNOME/dconf.git#tag=${_tag})
sha256sums=('SKIP')

pkgver() {
  cd dconf

  git describe --tags
}

build() {
  local meson_options=(
    --libdir=/usr/lib32
    -D bash_completion=false
    -D man=false
    -D vapi=false
  )

  export CC='gcc -m32'
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config

  arch-meson dconf build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
  rm -rf "${pkgdir}"/usr/{bin,include,lib,share}
}

# vim:set sw=2 sts=-1 et:
