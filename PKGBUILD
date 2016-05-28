# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributors: jdc, rayman2200

pkgname=corsix-th
pkgver=0.50
pkgrel=3
pkgdesc='Reimplementation of the game engine of Theme Hospital'
url='https://github.com/CorsixTH/CorsixTH'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
makedepends=('cmake')
depends=('lua' 'lua-lpeg' 'lua-filesystem' 'sdl2_mixer' 'ffmpeg' 'timidity-freepats')
install=$pkgname.install
source=($pkgname-$pkgver.tar.gz::"https://github.com/CorsixTH/CorsixTH/archive/v$pkgver.tar.gz"
        $pkgname-fix-parameters-to-sws_scale.patch::"https://github.com/CorsixTH/CorsixTH/commit/4ae56e100911c1763cb9fd9a4b8647e323ecc032.patch"
        "$pkgname.sh")
sha256sums=('822cb5b4a4ec863ba410b6a37e456b360516b2362337532689070e4555c037ee'
            '65161006dfc0aaff77d0beffd3894203ca2f304d0db71f54329859fa08c712ab'
            '3614197a30498774fff4055ee54d82a812a8b88eba353b70c3288a09ff700158')

prepare() {
  cd CorsixTH-$pkgver

  # fix location in .desktop entry
  sed 's/games/share/g' DebianPackage/usr/share/applications/CorsixTH.desktop > ../$pkgname.desktop
  # fix crash in ffmpeg 2.8+
  patch -Np1 < ../$pkgname-fix-parameters-to-sws_scale.patch
  # fix compilation with recent ffmpeg
  sed 's/PIX_FMT_RGB24/AV_&/g;s/PixelFormat/AV&/g' -ibak CorsixTH/Src/th_movie.{cpp,h}
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
