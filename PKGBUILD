# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: josephgbr <rafael.f.f1 at gmail dot com>
# Contributor: TryA <tryagainprod at gmail dot com>
# Contributor: Jan de Groot <jgc at archlinux dot org>

pkgname=lib32-libnotify
pkgver=0.8.1
pkgrel=1
pkgdesc="Library for sending desktop notifications (32-bit)"
arch=('x86_64')
url="https://gitlab.gnome.org/GNOME/libnotify"
license=('LGPL')
depends=("${pkgname#lib32-}" 'lib32-gdk-pixbuf2')
makedepends=('docbook-xsl' 'gcc-multilib' 'git' 'gtk-doc' 'lib32-gobject-introspection' 'lib32-gtk3' 'meson' 'xmlto')
_commit=650f2f123e75469b85d81fbca66e17b744a7714b  # tags/0.8.1^0
source=("${pkgname#lib32-}::git+$url.git#commit=$_commit")
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname#lib32-}
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

build() {
  # Modify environment to generate 32-bit ELF. Respects flags defined in makepkg.conf
  export CFLAGS="-m32 ${CFLAGS}"
  export CXXFLAGS="-m32 ${CXXFLAGS}"
  export LDFLAGS="-m32 ${LDFLAGS}"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
#  export PKG_CONFIG_LIBDIR='/usr/lib32/pkgconfig'

  arch-meson ${pkgname#lib32-} build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  rm -rf "${pkgdir}/usr/"{bin,include,share}
}
