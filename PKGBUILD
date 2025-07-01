# Maintainer: Jo De Boeck <deboeck.jo@gmail.com>

pkgname=big-launcher-git
pkgver=51ada9c
pkgrel=1
makedepends=('cmake' 'libarchive')
depends=('sdl3' 'sdl3_image' 'sdl3_ttf' 'libinih' 'harfbuzz' 'spdlog' 'fmt' 'libxml2')
provides=('big-launcher')
conflicts=('big-launcher')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
pkgdesc="Launcher for the big screen"
license=('MIT')
source=('git+https://github.com/complexlogic/big-launcher' 'https://github.com/complexlogic/big-launcher/files/10326572/assets.zip')
url='https://github.com/complexlogic/big-launcher'
md5sums=('SKIP' '86c72ff76831c1a458924f48cb1b7d43')

pkgver() {
  cd "$srcdir/big-launcher"
  git rev-parse --short HEAD
}

build() {
  sed -i 's:@ICONS_DIR@:/usr/share/big-launcher/&:' "$srcdir/big-launcher/config/layout.xml.in"
  sed -i 's:assets/background.svg:/usr/share/big-launcher/&:' "$srcdir/big-launcher/config/config.ini.in"
  mkdir -p "$srcdir/big-launcher/build"
  cd "$srcdir/big-launcher/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make

}

package() {
  bsdtar -xf assets.zip
  install -Dm 755 "$srcdir/big-launcher/build/big-launcher" "$pkgdir/usr/bin/big-launcher"
  install -Dm 655 "assets/background.svg" "${pkgdir}/usr/share/big-launcher/assets/background.svg"
  install -d ${pkgdir}/usr/share/big-launcher/assets/{fonts,icons,sounds}
  install -D assets/fonts/* "${pkgdir}/usr/share/big-launcher/assets/fonts"
  install -Dm 655 assets/icons/* "${pkgdir}/usr/share/big-launcher/assets/icons"
  install -Dm 655 assets/sounds/* "${pkgdir}/usr/share/big-launcher/assets/sounds"
  install -m 655 ${srcdir}/big-launcher/build/{config.ini,layout.xml} "$pkgdir/usr/share/big-launcher"
}
