# Maintainer: Niels Martignène <niels.martignene@gmail.com>

pkgname=ty-git
pkgver=0.7.0.r232.g7866541
pkgrel=1
pkgdesc="GUI and command-line tools to manage Teensy devices"
arch=('x86_64' 'i686')
url="http://github.com/Koromix/ty"
license=('custom:MPL2')
depends=('teensyduino' 'libudev.so' 'qt5-base')
makedepends=('git' 'imagemagick')
provides=('ty')
conflicts=('ty')
source=('git+https://github.com/Koromix/ty.git')
sha256sums=('SKIP')

pkgver() {
  cd ty

  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd ty

  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ty

  make install DESTDIR="${pkgdir}"

  for size in 16 32 48 256; do
    mkdir -p "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
    convert -resize "${size}x${size}" tyqt/images/tyqt.png "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/tyqt.png"
  done

  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/ty-git/LICENSE.txt"
}
