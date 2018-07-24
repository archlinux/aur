# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributors: jdc, rayman2200, TheCycoONE

pkgname=corsix-th
pkgver=0.62
pkgrel=1
pkgdesc='Reimplementation of the game engine of Theme Hospital'
url='https://github.com/CorsixTH/CorsixTH'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
makedepends=('cmake' 'librsvg')
depends=('lua' 'lua-lpeg' 'lua-filesystem' 'sdl2_mixer' 'ffmpeg' 'timidity-freepats')
install=$pkgname.install
source=($pkgname-$pkgver.tar.gz::"https://github.com/CorsixTH/CorsixTH/archive/v$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('b219270310255493c881a09bb4a5569f34a72cdaf3c3be920c1036a2450317ce'
            'a5ad57b78de82c93c9d451eca753f1fb3e78094fd86ac73fca44d759c450242f')

prepare() {
  # convert icon
  rsvg-convert -h 48 -a -o $pkgname.png CorsixTH-$pkgver/CorsixTH/Original_Logo.svg
}

build() {
  cd CorsixTH-$pkgver

  cmake -DCMAKE_BUILD_TYPE=Release -Wno-dev \
        -DCMAKE_INSTALL_PREFIX=/usr .
  cd CorsixTH
  make
}

package() {
  make -C CorsixTH-$pkgver/CorsixTH DESTDIR="$pkgdir/" install
  # executable name changed with 0.62
  ln -s $pkgname "$pkgdir"/usr/bin/CorsixTH
  # license
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s /usr/share/corsix-th/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/
  # .desktop integration
  install -Dm0644 $pkgname.desktop "$pkgdir"/usr/share/applications/CorsixTH.desktop
  install -Dm0644 $pkgname.png "$pkgdir"/usr/share/pixmaps/CorsixTH.png
}
