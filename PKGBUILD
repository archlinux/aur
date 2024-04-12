# Contributor: Matthew McGinn <mamcgi@gmail.com>
# Contributor: György Balló
# Contributor: Eric BÃ©langer <eric@archlinux.org>

pkgname=xv
pkgver=5.0.0
pkgrel=1
_commit=bc95540a69b845b8b33c31225e6092bd07c51d9d
pkgdesc='A nice image viewer'
arch=(i686 x86_64 armv7h aarch64)
url='https://github.com/jasper-software/xv'
license=(LicenseRef-xv)
depends=(libpng libx11 libtiff libwebp jasper libxt libjpeg-turbo zlib glibc)
makedepends=(cmake git)
options=(!emptydirs)
source=(git+$url.git#commit=$_commit
        license.txt)
sha1sums=('17ed1cb8ff3a8397005b350cc3efb5fa4602d39e'
          '4561344e8f2c30eee9c55b14a14f062d89d6e7b7')

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
