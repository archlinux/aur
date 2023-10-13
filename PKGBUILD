# Maintainer: Niels Martignène <niels.martignene@gmail.com>

pkgname=tytools
pkgver=0.9.9
pkgrel=1
pkgdesc="GUI and command-line tools to manage Teensy devices"
arch=('x86_64' 'i686')
url="http://github.com/Koromix/tytools"
license=('custom:Unlicense')
depends=('libudev.so' 'qt6-base')
optdepends=('teensyduino: Arduino integration')
makedepends=('git' 'imagemagick')
provides=('tytools' 'ty')
conflicts=('ty' 'teensytools')
source=('git+https://github.com/Koromix/rygel.git')
sha256sums=('SKIP')

build() {
  cd rygel

  git checkout "tytools/${pkgver}"

  ./bootstrap.sh
  ./felix -pFast tycmd tycommander tyuploader
}

package() {
  cd rygel

  mkdir -p "${pkgdir}/usr/bin"
  install -m755 bin/Fast/tycmd ${pkgdir}/usr/bin/tycmd
  install -m755 bin/Fast/tycommander ${pkgdir}/usr/bin/tycommander
  install -m755 bin/Fast/tyuploader ${pkgdir}/usr/bin/tyuploader

  mkdir -p "${pkgdir}/usr/share/applications"
  install -m644 src/tytools/tycommander/tycommander_linux.desktop "${pkgdir}/usr/share/applications/tycommander.desktop"
  install -m644 src/tytools/tyuploader/tyuploader_linux.desktop "${pkgdir}/usr/share/applications/tyuploader.desktop"

  for size in 16 32 48 256; do
    mkdir -p "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
    convert -resize "${size}x${size}" src/tytools/assets/images/tycommander.png \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/tycommander.png"
    convert -resize "${size}x${size}" src/tytools/assets/images/tyuploader.png \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/tyuploader.png"
  done

  install -Dm644 src/tytools/LICENSE.txt "${pkgdir}/usr/share/licenses/teensytools-git/LICENSE.txt"
}
