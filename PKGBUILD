# Contributor: Matthew McGinn <mamcgi@gmail.com>
# Contributor: György Balló
# Contributor: Eric BÃ©langer <eric@archlinux.org>

pkgname=xv
pkgver=6.0.2
pkgrel=1
pkgdesc='A nice image viewer'
arch=(i686 x86_64 armv7h aarch64)
url='https://github.com/jasper-software/xv'
license=(LicenseRef-xv)
depends=(libpng libx11 libtiff libwebp jasper libxt libjpeg-turbo zlib glibc)
makedepends=(cmake git)
options=(!emptydirs)
source=(git+$url.git#tag=v$pkgver
        license.txt)
sha256sums=('a5b8d10d7c2d2f3325313a589d1a5edf00240b7705521bdf08ecce9519713488'
            '6bcd7861188e1e8fb90b68b6d660e519488b7bae02ac1cb46c9bc48aa235e451')

prepare() {
  cd "$pkgname"
  cmake -B tmp_cmake \
    -DCMAKE_C_FLAGS="$CFLAGS" \
    -DCMAKE_EXE_LINKER_FLAGS="$LDFLAGS" \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_SYSCONFDIR="/etc" \
    -DCMAKE_BUILD_TYPE=Release
}

build() {
  cd "$pkgname"
  cmake --build tmp_cmake
  # Preparing source tarball
  git archive --format tar.gz -o "$srcdir/$pkgname-$pkgver-source.tar.gz" HEAD
}

package() {
  cd "$pkgname"
  DESTDIR="$pkgdir" cmake --build tmp_cmake --target install
  install -Dvm644 "$srcdir/license.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"

  # installing source tarball (to comply with license)
  install -Dvm644 "$srcdir/$pkgname-$pkgver-source.tar.gz" "$pkgdir/usr/share/doc/$pkgname/$pkgname-$pkgver-source.tar.gz"
  ln -s "/usr/share/licenses/$pkgname/license.txt" "$pkgdir/usr/share/doc/$pkgname/license.txt"
}
