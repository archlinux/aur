# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributors: jdc, rayman2200

pkgname=corsix-th
pkgver=0.50
pkgrel=1
pkgdesc='Reimplementation of the game engine of Theme Hospital'
url='https://github.com/CorsixTH/CorsixTH'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
makedepends=('cmake')
depends=('lua' 'lua-lpeg' 'lua-filesystem' 'sdl2_mixer' 'ffmpeg' 'timidity-freepats')
install=$pkgname.install
source=($pkgname-$pkgver.tar.gz::"https://github.com/CorsixTH/CorsixTH/archive/v$pkgver.tar.gz"
        "$pkgname.sh")
sha256sums=('822cb5b4a4ec863ba410b6a37e456b360516b2362337532689070e4555c037ee'
            '3614197a30498774fff4055ee54d82a812a8b88eba353b70c3288a09ff700158')

prepare() {
  # fix location in .desktop entry
  cp -up CorsixTH-$pkgver/DebianPackage/usr/share/applications/CorsixTH.desktop $pkgname.desktop
  sed 's/games/share/g' -i $pkgname.desktop
}

build() {
  cd CorsixTH-$pkgver

  cmake -DCMAKE_BUILD_TYPE=Release -Wno-dev \
        -DLUA_PROGRAM_PATH=/usr/bin/lua -DLUA_INCLUDE_DIR=/usr/include -DLUA_LIBRARY=/usr/lib/liblua.so \
        -DCMAKE_INSTALL_PREFIX=/usr/share/ .
  cd CorsixTH
  make
}

package() {
  make -C CorsixTH-$pkgver/CorsixTH DESTDIR="$pkgdir/" install
  # launcher
  install -Dm0755 $pkgname.sh "$pkgdir"/usr/bin/CorsixTH
  # license
  install -Dm0644 CorsixTH-$pkgver/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  # .desktop integration
  install -Dm0644 $pkgname.desktop "$pkgdir"/usr/share/applications/CorsixTH.desktop
}
