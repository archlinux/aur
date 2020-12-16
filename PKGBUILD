# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Mikko Sepp\u00e4l\u00e4 <t-r-a-y@mbnet.fi>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=lib32-atk-git
pkgver=2.36.0
pkgrel=1
pkgdesc="The interface definitions of accessibility infrastructure (32-bit)"
url="https://git.gnome.org/browse/atk"
arch=(x86_64)
license=(LGPL)
provides=(lib32-atk)
conflicts=(lib32-atk)
depends=(lib32-glib2 atk)
makedepends=(gobject-introspection git meson)
source=("git+https://gitlab.gnome.org/GNOME/atk.git")
sha512sums=('SKIP')

pkgver() {
  cd atk
  git describe --tags | sed 's/^ATK_//;s/_/./g;s/-/+/g'
}

prepare() {
  cd atk
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig

  arch-meson atk build -D enable_docs=false -D introspection=false --libdir=/usr/lib32
  ninja $NINJAFLAGS -C build
}

#check() {
#  cd build
#  meson test
#}

package() {
  DESTDIR="$pkgdir" ninja $NINJAFLAGS -C build install
  rm -r "${pkgdir}"/usr/{include,share}
}

