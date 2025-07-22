# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=libremidi
pkgver=4.5.0
pkgrel=1
pkgdesc='Modern C++ MIDI 1/2 real-time and file I/O library'
arch=(x86_64)
url='https://github.com/celtera/libremidi'
license=(MIT BSD-2-Clause)
depends=(glibc gcc-libs jack2)
makedepends=(git cmake ninja alsa-lib pipewire boost readerwriterqueue)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('06e919e51a1e3a57b2cc363fd8684867e3765d955ef753fe61694d797792ba1b0433245a307c9c4b52a1055b9dcb47966ccc13fe219b0a80b3bab92bfd18ccbf')
b2sums=('711c0cf59df996968a116a26e5b1f9c478b1219262d30184d6039ec697a3cb2b23ca79d6ece8da1f8db040aa4e5d4fc7d5999834234e3e6a4100642bfef642d4')

build() {
  local cmake_options=(
    -B build
    -S "$pkgname"
    -G Ninja
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_BUILD_TYPE=Release
    -D LIBREMIDI_FIND_BOOST=ON
    -D BUILD_SHARED_LIBS=ON
    -W no-dev
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # why is this installing readerwriterqueue?
  pushd "$pkgdir"
  rm -rf usr/{include/readerwriterqueue,lib/cmake/readerwriterqueue}
  popd

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgname/LICENSE.md"
}
