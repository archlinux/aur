# Maintainer: Huki <gk7huki@gmail.com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: Bjørn Lindeijer <bjorn@lindeijer.nl>

pkgname=lib32-dumb
_pkgbasename=dumb
pkgver=2.0.3
pkgrel=3
pkgdesc='IT, XM, S3M and MOD player library'
arch=(x86_64)
license=(custom:dumb GPL)
url='https://dumb.sf.net/'
depends=('lib32-glibc' $_pkgbasename)
makedepends=(cmake ninja)
source=($_pkgbasename-$pkgver.tar.gz::"https://github.com/kode54/dumb/archive/$pkgver.tar.gz")
sha256sums=('99bfac926aeb8d476562303312d9f47fd05b43803050cd889b44da34a9b2a4f9')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  mkdir -p build
  cd build
  cmake "$srcdir/$_pkgbasename-$pkgver" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib32 \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_ALLEGRO4=OFF \
    -DBUILD_EXAMPLES=OFF \
    -GNinja
  ninja
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  rm -rf "$pkgdir"/usr/{share,include,bin}

  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
