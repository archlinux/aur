# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: xw258
# Contributor: genesis66

pkgname=lib32-fltk
pkgver=1.3.9
pkgrel=1
pkgdesc="Graphical user interface toolkit for X (32-bit)"
arch=('x86_64')
url="https://www.fltk.org"
license=(custom:FLTK)
depends=("${pkgname#lib32-}" 'lib32-glu' 'lib32-libjpeg-turbo' 'lib32-libpng' 'lib32-libxcursor' 'lib32-libxinerama' 'lib32-libxft')
makedepends=('cmake' 'lib32-alsa-lib' 'libxft')
options=('staticlibs')
source=("${pkgname#lib32-}-$pkgver.tar.gz::https://github.com/fltk/fltk/archive/release-$pkgver.tar.gz")
sha512sums=('2dfeeed9fdc6db62a6620e7c846dbe0bf97dacce3077832e314a35bf16ba6a45803373188a7b3954eada5829385b9914241270b71f12aaf3e9e3df45eb2b1b95')

build() {
  # Modify environment to generate 32-bit ELF. Respects flags defined in makepkg.conf
  export CFLAGS="-m32 -ffat-lto-objects ${CFLAGS}"
  export CXXFLAGS="-m32 -ffat-lto-objects ${CXXFLAGS}"
  export LDFLAGS="-m32 ${LDFLAGS}"
  export PKG_CONFIG_LIBDIR="/usr/lib32/pkgconfig"

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DFLTK_LIBDIR=/usr/lib32 \
        -DOPTION_CREATE_LINKS=ON \
        -DOPTION_BUILD_SHARED_LIBS=ON \
        -B build \
        -S "${pkgname#lib32-}-release-$pkgver"
  make VERBOSE=1 -C build
}

package() {
  make VERBOSE=1 DESTDIR="$pkgdir" install -C build
  rm -rf "$pkgdir/usr/"{bin,include,share}
  install -vDm 644 "${pkgname#lib32-}-release-$pkgver/"COPYING "$pkgdir/usr/share/licenses/$pkgname/"LICENSE
}
