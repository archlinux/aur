# Maintainer: Alexander Jacocks <alexander@redhat.com>

pkgname="axpbox-git"
pkgver=1.1.2.1.gbaa1d5b
pkgrel=1
pkgdesc="AXPbox Alpha emulator"
arch=('i686' 'x86_64')
url="https://github.com/lenticularis39/axpbox"
license=('GPLv2')
depends=('libpcap' 'sdl2' 'openbsd-netcat')
makedepends=('cmake')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=('git+https://github.com/lenticularis39/axpbox.git'
        'https://download-mirror.savannah.gnu.org/releases/vgabios/vgabios-0.6a.bin'
        'https://raymii.org/s/inc/downloads/es40-srmon/cl67srmrom.exe')
sha512sums=('SKIP'
            '49cede42527d026433623f7e266e4af38b3804392924a7f32ec4fb8473adca9cde3f57ea85bf37ce3c4a2a00ccdfc957678bf2a6ee8010d0a6a511278ef5707e'
            '3583d4b66f771c42365c989cb7dbf1b70d733eb2221ce83c092819adce98c028f745a55fd43df7fbd523a7dc3b54eed472d3f6928ba99e0abdebd2a0e666ef2e')

pkgver() {
  cd "${pkgname%-*}"
  printf "%s" "$(git describe --long --tags | sed 's/v//; s/-/./g')"
}

build() {
  cd "${pkgname%-*}"
  cmake -E make_directory build
  cd build
  cmake .. -DCMAKE_C_COMPILER="clang" -DCMAKE_CXX_COMPILER="clang++" -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS="-Wall"
  MAKEFLAGS=-j"$(nproc)" cmake --build . --config Release
}

check() {
  cd "${pkgname%-*}"
  test/run
}

package() {
  echo "Entering directory $srcdir/${pkgname%-*}/build."
  cd "$srcdir/${pkgname%-*}/build"
  install -d "$pkgdir/usr/bin"
  install axpbox "$pkgdir/usr/bin/axpbox"

  echo "Entering directory $srcdir/${pkgname%-*}."
  cd "$srcdir/${pkgname%-*}"
  install -d "$pkgdir/usr/share/$pkgname"
  install -d "$pkgdir/usr/share/$pkgname/rom"
  install -D -t "$pkgdir/usr/share/$pkgname/rom" "$srcdir/cl67srmrom.exe"
  install -D -t "$pkgdir/usr/share/$pkgname/rom" "$srcdir/vgabios-0.6a.bin"
  install -d "$pkgdir/usr/share/doc/$pkgname"
  install -D -t "$pkgdir/usr/share/doc/$pkgname" *.md
}
