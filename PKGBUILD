# Maintainer: Danilo Bargen <aur at dbrgn dot ch>
pkgname=openmittsu-git
_fullname=openMittsu
pkgver=r8.d61d58c
pkgrel=2
pkgdesc="An open source implementation and desktop client of the Threema Messenger App."
arch=('x86_64' 'i686')
url="https://github.com/blizzard4591/openMittsu"
license=('GPL')
depends=('libsodium' 'qrencode' 'qt5-base' 'qt5-multimedia')
makedepends=('git' 'cmake')
provides=('openmittsu')
conflicts=('openmittsu')
source=('git+https://github.com/blizzard4591/openMittsu'
        'openmittsu.desktop')
sha256sums=('SKIP'
            'e37f4cf33dec07d3c486bb1ea454795a4c06be0443391c6741cc37f3b03bc3c3')

prepare() {
  cd "$srcdir/$_fullname"
  git submodule init
  git submodule update
}

build() {
  # Temporary build dir
  rm -rf "$srcdir/$_fullname-build"
  git clone --recursive "$srcdir/$_fullname" "$srcdir/$_fullname-build"
  cd "$srcdir/$_fullname-build"

  # Compile
  cd "$srcdir/$_fullname-build"
  cmake \
    -DLIBSODIUM_INCLUDE_DIRS="/usr/include" \
    -DLIBSODIUM_LIBRARIES="/usr/lib/libsodium.so" \
    -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
    .
  make
}

package() {
  cd "$srcdir/$_fullname-build"
  make install

  install -Dm644 "$srcdir/openmittsu.desktop" "$pkgdir/usr/share/applications/openmittsu.desktop"
}

pkgver() {
  cd "$srcdir/$_fullname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# vim:set ts=2 sw=2 et:
