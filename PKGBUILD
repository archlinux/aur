# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>
# Contributor: Foster McLane <fkmclane@gmail.com>
# Contributor: Jonathan Thomas <jonathan@openshot.org>

pkgbase=libopenshot-audio
pkgname=(
  libopenshot-audio
  libopenshot-audio-docs
)
pkgver=0.3.1
pkgrel=1
pkgdesc="A high-quality audio editing and playback library used by libopenshot."
arch=(x86_64)
url="https://github.com/openshot/libopenshot-audio"
license=(GPL3)
makedepends=(
  alsa-lib
  cmake
  doxygen
  freetype2
  libx11
  python
  zlib
)
source=($url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
sha512sums=('e90abadeae72563458621c5c275f113bb033cad5c35a16ffaecc9ed1369a80bfda14d6775f6b855f62808988a21d268aaee590e68b0bd73d6fe2602c61347955')
b2sums=('101fd487cffc65392e955f2af2fc3047d931c0ac40c05c7977b57360a043fe1b0f3ad48c84a06f4d6ac720d13c30b2f78dcb3df550fd4b56047c6ecb99ee983a')

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
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -S $pkgname-$pkgver
    -W no-dev
  )

  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

check() {
  ctest --test-dir build --output-on-failure
}

package_libopenshot-audio() {
  depends=(
    alsa-lib
    gcc-libs
    glibc
    zlib
  )
  optdepends=('libopenshot-audio-docs: for documentation')
  provides=(libopenshot-audio.so)

  DESTDIR="$pkgdir" cmake --install build

  (
    cd "$pkgdir"
    _pick libopenshot-audio-docs usr/share/doc/
  )

  install -vDm 644 $pkgname-$pkgver/{AUTHORS,README.md} -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_libopenshot-audio-docs() {
  pkgdesc+=" - documentation"

  mv -v $pkgname/* "$pkgdir"
}
