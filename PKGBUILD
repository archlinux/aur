# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributors: jdc, rayman2200, TheCycoONE

pkgname=corsix-th
pkgver=0.65.1
pkgrel=1
pkgdesc='Reimplementation of the game engine of Theme Hospital'
url='https://github.com/CorsixTH/CorsixTH'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
makedepends=('cmake' 'ninja')
depends=('lua' 'lua-lpeg' 'lua-filesystem' 'sdl2_mixer' 'ffmpeg')
optdepends=('freepats-legacy: Soundfont for Midi playback'
            'soundfont-fluid: Alternative soundfont for Midi playback')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/CorsixTH/CorsixTH/archive/v$pkgver.tar.gz"
        https://github.com/CorsixTH/CorsixTH/raw/95be4c96810818d05b668c373711cd8f38d4e8b4/CorsixTH/Src/th_movie.{cpp,h})
sha256sums=('b8a1503371fa0c0f3d07d3b39a3de2769b8ed25923d0d931b7075bc88e3f508f'
            '0c43f4546b6a3e812257c11ef3199c935a96a471f2ed1f37c4a3baa7f25596a6'
            '9b0c6a786d0697edc3569cfa8d59a8a0ad60d10f4c1eb0b038a77e181f823a22')

prepare() {
  rm -rf th
  mkdir th

  ln -s -f $srcdir/th_movie.{cpp,h} "$srcdir/CorsixTH-$pkgver/CorsixTH/Src/"
}

build() {
  cmake -B th -G Ninja -DCMAKE_BUILD_TYPE=Release -Wno-dev \
        -DCMAKE_INSTALL_PREFIX=/usr CorsixTH-$pkgver
  cmake --build th
}

package() {
  DESTDIR="$pkgdir/" cmake --install th
  # license
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s /usr/share/corsix-th/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/
}
