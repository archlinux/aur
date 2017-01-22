# Maintainer: Niels Martignène <niels.martignene@gmail.com>

pkgname=teensytools-git
pkgver=0.8.0.r70.ge282172
pkgrel=1
pkgdesc="GUI and command-line tools to manage Teensy devices"
arch=('x86_64' 'i686')
url="http://github.com/Koromix/teensytools"
license=('custom:Unlicense')
depends=('teensyduino' 'libudev.so' 'qt5-base')
makedepends=('git' 'imagemagick')
provides=('teensytools' 'ty')
conflicts=('ty')
source=('git+https://github.com/Koromix/teensytools.git')
sha256sums=('SKIP')

pkgver() {
  cd teensytools

  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd teensytools

  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd teensytools

  make install DESTDIR="${pkgdir}"

  for size in 16 32 48 256; do
    mkdir -p "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
    convert -resize "${size}x${size}" resources/images/teensycommander.png \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/teensycommander.png"
    convert -resize "${size}x${size}" resources/images/teensyupdater.png \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/teensyupdater.png"
  done

  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/teensytools-git/LICENSE.txt"
}
