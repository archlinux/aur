# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=lib32-cairo-git
pkgver=1.17.4
pkgrel=1
pkgdesc="2D graphics library with support for multiple output devices (32-bit)"
url="https://cairographics.org/"
arch=(x86_64)
license=(LGPL MPL)
depends=(lib32-zlib lib32-libpng lib32-fontconfig lib32-freetype2 lib32-libx11
         lib32-libxext lib32-libxrender lib32-libxcb lib32-glib2 lib32-pixman
         cairo)
makedepends=(valgrind git meson)
provides=(lib32-cairo)
conflicts=(lib32-cairo)
source=("git+https://gitlab.freedesktop.org/cairo/cairo.git")
sha256sums=('SKIP')

pkgver() {
  cd cairo
  git describe --tags | sed 's/-/+/g'
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"

  arch-meson cairo build \
    --libdir=/usr/lib32 \
    -D spectre=disabled \
    -D tee=enabled \
    -D quartz=disabled \
    -D symbol-lookup=disabled \
    -D tests=disabled
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  rm -r "$pkgdir"/usr/{include,bin}
}
