# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: xw258
# Contributor: genesis66

pkgname=lib32-fltk
pkgver=1.3.8
pkgrel=1
pkgdesc="Graphical user interface toolkit for X (32-bit)"
arch=('x86_64')
url="https://www.fltk.org"
license=(custom:FLTK)
depends=("${pkgname#lib32-}" 'lib32-glu' 'lib32-libjpeg-turbo' 'lib32-libpng' 'lib32-libxcursor' 'lib32-libxinerama' 'lib32-libxft')
makedepends=('cmake' 'lib32-alsa-lib' 'libxft')
options=('staticlibs')
source=("${pkgname#lib32-}-${pkgver}.tar.gz::https://github.com/fltk/fltk/archive/release-${pkgver}.tar.gz")
sha512sums=('197848d3b80a65cca936daf4f0b74609f0fe8332a4cd11af53385fb2aa45ad698b1e239a48732b118cd3cb189bc531711b72fb2eeeb85be887dc6c5a558fa4b3')

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

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
        -S "${pkgname#lib32-}-release-${pkgver}"
  make VERBOSE=1 -C build
}

package() {
  make VERBOSE=1 DESTDIR="${pkgdir}/" install -C build
  rm -rf "${pkgdir}/usr/"{bin,include,share}
  install -vDm 644 "${pkgname#lib32-}-release-${pkgver}/"COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"LICENSE
}
