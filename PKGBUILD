# Maintainer: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=ppsspp
pkgver=0.9.9
pkgrel=1
pkgdesc='PSP emulator written in C++'
arch=('i686' 'x86_64')
url='http://www.ppsspp.org/'
license=('GPL2')
depends=('zlib' 'sdl' 'libpng' 'libgl' 'hicolor-icon-theme' 'xdg-utils')
makedepends=('git' 'cmake' 'mesa' 'mesa-libgl' 'glu' 'chrpath' 'zlib' 'sdl')
install=ppsspp.install
source=(git://github.com/hrydgard/ppsspp.git#tag=v$pkgver
        git://github.com/hrydgard/native.git#commit=78941b08
        lang::git://github.com/hrydgard/ppsspp-lang.git#commit=7876a52f
        ffmpeg::git://github.com/hrydgard/ppsspp-ffmpeg.git#commit=bc6302be
        ppsspp-headless ppsspp-sdl ppsspp.desktop)
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'e516b0000eb9b1c42ea21e06b80b737c'
         '2d4671d325c14b43ee1edf1a6e4fcd5d'
         '0f9fffc0ad19bd4b647a81e0357e9d04')

prepare() {
  mkdir build{,-qt}
  cd $pkgbase

  git submodule init
  for submodule in native lang ffmpeg; do
    git config submodule.${submodule}.url "$srcdir"/$submodule
    git submodule update $submodule
  done
}

build() {
  cd build
  cmake ../$pkgbase -DCMAKE_BUILD_TYPE=Release -DHEADLESS=ON
  make
}

package() {
  install -d "$pkgdir"/usr/share/ppsspp "$pkgdir"/usr/share/icons/
  cp -r build/{PPSSPPSDL,PPSSPPHeadless,assets/} "$pkgdir"/usr/share/ppsspp
  chrpath -d "$pkgdir"/usr/share/ppsspp/PPSSPP{SDL,Headless}

  cp -r ppsspp/assets/unix-icons/hicolor "$pkgdir"/usr/share/icons/hicolor

  install -Dm755 ppsspp-headless "$pkgdir"/usr/bin/ppsspp-headless
  install -Dm755 ppsspp-sdl "$pkgdir"/usr/bin/ppsspp-sdl
  install -Dm644 ppsspp.desktop "$pkgdir"/usr/share/applications/ppsspp.desktop
}
