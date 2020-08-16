# Maintainer: Niels Martignène <niels.martignene@gmail.com>

pkgname=tytools-git
pkgver=0.9.2.r0.gf3f2a20
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
source=('git+https://github.com/Koromix/tytools.git')
sha256sums=('SKIP')

pkgver() {
  cd tytools

  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd tytools

  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd tytools

  make install DESTDIR="${pkgdir}"

  for size in 16 32 48 256; do
    mkdir -p "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
    convert -resize "${size}x${size}" resources/images/tycommander.png \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/tycommander.png"
    convert -resize "${size}x${size}" resources/images/tyupdater.png \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/tyupdater.png"
  done

  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/teensytools-git/LICENSE.txt"
}
