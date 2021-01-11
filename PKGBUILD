# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: jtts <jussaar@mbnet.fi>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=lib32-dconf-git
pkgver=0.38.0
pkgrel=1
pkgdesc='A low-level configuration system'
arch=(x86_64)
url=https://live.gnome.org/dconf
license=(LGPL2.1)
depends=(
  dconf
  lib32-glib2
)
makedepends=(
  bash-completion
  docbook-xsl
  git
  intltool
  meson
  python
  vala
)
provides=(lib32-dconf)
conflicts=(lib32-dconf)
source=(git+https://gitlab.gnome.org/GNOME/dconf.git)
sha256sums=(SKIP)

pkgver() {
  cd dconf

  git describe --tags
}

build() {
  export CC='gcc -m32'
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig

  arch-meson dconf build \
    --libdir=/usr/lib32 \
    -D enable-man=false \
    -D enable-gtk_doc=false
  ninja $NINJAFLAGS -C build
}

package() {
  DESTDIR="${pkgdir}" ninja $NINJAFLAGS -C build install
  rm -rf "${pkgdir}"/usr/{bin,include,lib,share}
}

# vim: ts=2 sw=2 et:
