# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>
# Contributor: Foster McLane <fkmclane@gmail.com>
# Contributor: Jonathan Thomas <jonathan@openshot.org>

pkgbase=libopenshot-audio
pkgname=(
  libopenshot-audio
  libopenshot-audio-docs
)
pkgver=0.3.3
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
sha512sums=('e21bf2812e48448044bc7ca84971a034ede56d294ad139326114365586b74a410bd9e5d36ac48f4183898b1d3065c70f674dcfa3141f2847e18fa74137b8768c')
b2sums=('8a381daf1cadd9e59b9944b8d21bbb4b6b69307894de97dac0057c0af9e45d400a65b1ef59ea4f80cfc69d42917d7556ae87f2e1c1d361a3d96b7f6cf2da4993')

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
