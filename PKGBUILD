# Maintainer: Raiku <rikunn.rikunn@proton.me>
pkgname=r2k
pkgver=1.4
pkgrel=3
url="https://github.com/gitRaiku/r2k"
pkgdesc="A suckless romaji to kana converter"
arch=(any)
license=('GPL-3.0')
depends=('wayland' 'wlroots' 'libx11' 'libxft' 'libxkbcommon' 'freetype2' 'xorg-xwayland')
makedepends=('make' 'wayland-protocols')
install="${pkgname}.install"
source=("https://github.com/gitRaiku/r2k/archive/refs/tags/v$pkgver.tar.gz"
        "https://github.com/gitRaiku/r2k/releases/download/v$pkgver/config.h")
sha256sums=('c1e9406ae1453da9324ebcd23277423046e0b8aa512bca92ef37ae600dea635b'
            'SKIP')

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
  sed -i 's/usr\/local\/bin/usr\/bin/' r2kd.service
  install -Dm 0644 r2kd.service -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm 0755 r2kdict -t "$pkgdir/usr/share/r2k"
  install -Dm 0755 bin/r2k -t "$pkgdir/usr/bin"
  install -Dm 0755 bin/r2kd -t "$pkgdir/usr/bin"
}
