# Maintainer: Alexander Jacocks <alexander@redhat.com>

pkgname="axpbox"
pkgver=1.1.2
pkgrel=1
pkgdesc="Alpha emulator"
arch=('i686' 'x86_64')
url="https://github.com/lenticularis39/axpbox"
license=('GPLv2')
depends=('libpcap' 'sdl2' 'openbsd-netcat')
makedepends=('cmake')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v$pkgver.tar.gz"
        "https://download-mirror.savannah.gnu.org/releases/vgabios/vgabios-0.6a.bin"
        "https://raymii.org/s/inc/downloads/es40-srmon/cl67srmrom.exe")
sha256sums=('7e45fd7e1a8bb71e1634133b9d4e91cf08bf0ac1a6aac7a66716311d84854383'
            'e656d080eb4b32417f56b51fce9f7ba8b60019998463f84f98b3f0cb41f36eb0'
            '392546cd375a734883a48026d36f6f48e3b0fce636f6dd9ee190d49a042fc885')

build() {
  cd "${pkgname}-${pkgver}"
  cmake -E make_directory build
  cd build
  cmake .. -DCMAKE_C_COMPILER="clang" -DCMAKE_CXX_COMPILER="clang++" -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS="-Wall"
  MAKEFLAGS=-j"$(nproc)" cmake --build . --config Release
}

check() {
  cd "${pkgname}-${pkgver}"
  test/run
}

package() {
  echo "Entering directory $srcdir/${pkgname%-*}/build."
  cd "$srcdir/${pkgname}-${pkgver}/build"
  install -d "$pkgdir/usr/bin"
  install axpbox "$pkgdir/usr/bin/axpbox"

  echo "Entering directory $srcdir/${pkgname}-${pkgver}."
  cd "$srcdir/${pkgname}-${pkgver}"
  install -d "$pkgdir/usr/share/$pkgname"
  install -d "$pkgdir/usr/share/$pkgname/rom"
  install -D -t "$pkgdir/usr/share/$pkgname/rom" "$srcdir/cl67srmrom.exe"
  install -D -t "$pkgdir/usr/share/$pkgname/rom" "$srcdir/vgabios-0.6a.bin"
  install -d "$pkgdir/usr/share/doc/$pkgname"
  install -D -t "$pkgdir/usr/share/doc/$pkgname" *.md
}
