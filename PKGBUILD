# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=jack_transport_link
pkgver=0.0.13
pkgrel=1
pkgdesc='A bridge between Ableton Link to and from JACK transport'
arch=(aarch64 x86_64)
url='https://github.com/x37v/jack_transport_link'
license=(GPL-2.0-only)
groups=(pro-audio)
depends=(glibc jack libgcc libstdc++)
makedepends=(cmake)
source=("$url/releases/download/v$pkgver/$pkgname-v$pkgver-src.tar.gz")
sha256sums=('359da6dda7cc6df0edce63c5af6c1f767fede6114d8cf258c17f976064d7ec76')

build() {
  local cmake_options=(
    -B build-$pkgname
    -S $pkgname-v$pkgver
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D INSTALL_SERVICE_FILE=OFF
  )
  cmake "${cmake_options[@]}"
  cmake --build build-$pkgname
}

package() {
  depends+=(libgcc_s.so libjack.so libstdc++.so)
  DESTDIR="$pkgdir" cmake --install build-$pkgname
  cd $pkgname-v$pkgver
  install -vDm 644 README.md config/*.service.* -t "$pkgdir"/usr/share/doc/$pkgname
}
