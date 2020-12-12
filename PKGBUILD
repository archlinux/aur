# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: FadeMind <fademind@gmail.com>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>

pkgname=lib32-libgudev-nosystemd-git
pkgver=234
pkgrel=1
pkgdesc='GObject bindings for libudev'
arch=(x86_64)
url=https://wiki.gnome.org/Projects/libgudev
license=(LGPL2.1)
depends=(lib32-glib2)
optdepends=('libgudev: 64bit support')
makedepends=(
  git
#  gtk-doc
  python
)
provides=(libgudev-1.0.so lib32-libgudev)
conflicts=(lib32-libgudev)
source=(git+https://gitlab.gnome.org/GNOME/libgudev.git)
sha256sums=(SKIP)

pkgver() {
  cd libgudev
  git describe --tags | sed 's/-/+/g'
}

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig

  arch-meson libgudev build \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    -D tests=disabled \
    -D vapi=disabled \
    -D gtk_doc=false \
    -D introspection=disabled
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
  rm -rf ${pkgdir}/usr/{include,share}
}

# vim: ts=2 sw=2 et:

