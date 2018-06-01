# Maintainer: FFY00 <filipe.lains@gmail.com>
pkgname=limesuite
pkgver=18.04.1
pkgrel=1
pkgdesc="Driver and GUI for LMS7002M-based SDR platforms (LimeSDR, Novena RF7, etc.)"
arch=(any)
url="https://github.com/myriadrf/LimeSuite"
license=('Apache')
depends=('sqlite3' 'wxgtk3' 'opengl-driver' 'libusb>=1.0' 'soapysdr')
makedepends=('cmake')
provides=('limesuite' 'limesdr' 'soapylms7')
conflicts=('limesuite' 'limesdr' 'soapylms7')
source=(
  "https://github.com/myriadrf/LimeSuite/archive/v$pkgver.tar.gz"
  'limesuitegui.desktop'
)
sha256sums=(
  '188adf3f464b231b7ee9fea9d3cfc5d7053be8fa5a5a9a6adbb39d63228c5382'
  'b00c833a1dcd0b7e23a735aa4dd0a4060032f915de85ef7396f938b1bcedfecf'
)

build() {
  mkdir -p "$srcdir/LimeSuite-$pkgver/build"
  cd "$srcdir/LimeSuite-$pkgver/build"

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIME_SUITE_EXTVER="$pkgver"

  make
}

package() {
  cd "$srcdir/LimeSuite-$pkgver/build"

  make DESTDIR="$pkgdir" install

  # Install udev rules, changing mode to 666 and ommitting plugdev group
  mkdir -p "$pkgdir/etc/udev/rules.d"
  sed 's/MODE="660", GROUP="plugdev"/MODE="666"/g' "$srcdir/LimeSuite-$pkgver/udev-rules/64-limesuite.rules" > "$pkgdir/etc/udev/rules.d/64-limesuite.rules"

  install -Dm 664 "$srcdir/limesuitegui.desktop" "$pkgdir/usr/share/applications/limesuitegui.desktop"
}
