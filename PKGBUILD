# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Biru Ionut <ionut@archlinux.ro>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Mikko Seppälä <t-r-a-y@mbnet.fi>

pkgname=lib32-pango-git
pkgver=1.44.2
pkgrel=1
epoch=1
pkgdesc="A library for layout and rendering of text (32-bit)"
url="https://www.pango.org/"
arch=(x86_64)
license=(LGPL)
provides=(lib32-pango)
conflicts=(lib32-pango)
depends=(lib32-cairo lib32-libxft lib32-harfbuzz lib32-fribidi pango)
makedepends=(git meson)
optdepends=("lib32-libthai: Thai language support")
#checkdepends=(ttf-dejavu cantarell-fonts)
source=("git+https://gitlab.gnome.org/GNOME/pango.git")
sha256sums=('SKIP')

pkgver() {
  cd pango
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd pango
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"

  arch-meson pango build --libdir=/usr/lib32 -D introspection=disabled -D libthai=disabled
  ninja $NINJAFLAGS -C build
}

#check() {
#  meson test -C build --print-errorlogs
#}

package() {
  DESTDIR="$pkgdir" meson install -C build
  rm -r "$pkgdir"/usr/{bin,include}
}
