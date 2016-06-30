# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributors: jdc, rayman2200

pkgname=corsix-th
pkgver=0.60
pkgrel=1
pkgdesc='Reimplementation of the game engine of Theme Hospital'
url='https://github.com/CorsixTH/CorsixTH'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
makedepends=('cmake')
depends=('lua' 'lua-lpeg' 'lua-filesystem' 'sdl2_mixer' 'ffmpeg' 'timidity-freepats')
install=$pkgname.install
source=($pkgname-$pkgver.tar.gz::"https://github.com/CorsixTH/CorsixTH/archive/v$pkgver.tar.gz"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('f5ff7839b6469f1da39804de1df0a86e57b45620c26f044a1700e43d8da19ce9'
            '3614197a30498774fff4055ee54d82a812a8b88eba353b70c3288a09ff700158'
            'f802f8acdc8b3d0370344c608b780620f83a21f04bdf32507466adb4222ba4bc')

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
