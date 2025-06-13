# Maintainer: Raiku <rikunn.rikunn@proton.me>
pkgname=r2k
pkgver=1.5
pkgrel=3
url="https://github.com/gitRaiku/r2k"
pkgdesc="A suckless romaji to kana converter"
arch=(any)
license=('EUPL-1.2')
depends=('wayland' 'wlroots0.18' 'libx11' 'libxft' 'libxkbcommon' 'freetype2' 'xorg-xwayland')
makedepends=('make' 'wayland-protocols')
install="${pkgname}.install"
source=("https://github.com/gitRaiku/r2k/archive/refs/tags/v$pkgver.tar.gz"
        "https://github.com/gitRaiku/r2k/releases/download/v$pkgver/config.h")
sha256sums=('a4f745e19b0be76dc113adc8ea7fb64ba0008f5c4ffbaa8ee537d621944a1fef'
            '3636ca62d88db48d43d70caf763476677f2d9f6a2f70344b1a5e6ce5884bde5b')

prepare() {
  cp config.h r2k-$pkgver/src/config.h
}

build() {
  cd $srcdir/r2k-$pkgver
  make $MAKEOPTS
}

package() {
  cd "r2k-$pkgver"
  mv resources/RaikuDict r2kdict
  sed -i 's/usr\/local\/bin\/r2kd/usr\/bin\/r2kd/' r2kd.service
  install -Dm 0644 r2kd.service -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm 0755 r2kdict -t "$pkgdir/usr/share/r2k"
  install -Dm 0755 bin/r2k -t "$pkgdir/usr/bin"
  install -Dm 0755 bin/r2kd -t "$pkgdir/usr/bin"
}
