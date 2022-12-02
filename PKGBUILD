# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>
# Contributor: Foster McLane <fkmclane@gmail.com>
# Contributor: Jonathan Thomas <jonathan@openshot.org>

pkgbase=libopenshot-audio
pkgname=(libopenshot-audio libopenshot-audio-docs)
pkgver=0.3.0
pkgrel=1
pkgdesc="A high-quality audio editing and playback library used by libopenshot."
arch=(x86_64)
url="https://openshot.org/"
license=(GPL3)
makedepends=(alsa-lib cmake doxygen freetype2 libx11 python zlib)
options=(debug)
source=($pkgname-$pkgver.tar.gz::https://github.com/OpenShot/$pkgname/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('75f4f4170f8e4f442a31834e65b9ab56bfb2e034d81e0015add5d79c9ccaa3dd2806ae78b1ca97fab20eefa4c37990609755d0c07c306ca19f9cdca3884f0163')
b2sums=('a5cc1eba31ebc9750d69046d0a8963a5b4af5615bf57ca3ecb9989fc0c67ffd525b19162958aaab14d51d0d29ce9643da86f8bd1afd8de8e0483bfe11663c893')

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
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=None \
        -Wno-dev \
        -B build \
        -S $pkgname-$pkgver
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package_libopenshot-audio() {
  depends=(
    alsa-lib libasound.so
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
