# Maintainer: Niels Martignène <niels.martignene@gmail.com>

pkgname=tytools
pkgver=0.9.2
pkgrel=1
pkgdesc="GUI and command-line tools to manage Teensy devices"
arch=('x86_64' 'i686')
url="http://github.com/Koromix/tytools"
license=('custom:Unlicense')
depends=('libudev.so' 'qt5-base')
optdepends=('teensyduino: Arduino integration')
makedepends=('git' 'imagemagick')
provides=('tytools' 'ty')
conflicts=('ty' 'teensytools')
source=("https://github.com/Koromix/tytools/archive/v${pkgver}.tar.gz")
sha256sums=('2264212639b73d3b79276a09aeeabbc1c23ddf0f5e3b8c6383b05fbcaf662472')

build() {
  cd "tytools-${pkgver}"

  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "tytools-${pkgver}"

  make install DESTDIR="${pkgdir}"

  for size in 16 32 48 256; do
    mkdir -p "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
    convert -resize "${size}x${size}" resources/images/tycommander.png \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/tycommander.png"
    convert -resize "${size}x${size}" resources/images/tyupdater.png \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/tyupdater.png"
  done

  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/tytools-git/LICENSE.txt"
}
