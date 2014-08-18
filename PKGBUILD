# Maintainer: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=ppsspp
pkgver=0.9.9.1
pkgrel=1
pkgdesc='PSP emulator written in C++'
arch=('i686' 'x86_64')
url='http://www.ppsspp.org/'
license=('GPL2')
depends=('zlib' 'sdl' 'libpng' 'libgl' 'hicolor-icon-theme' 'xdg-utils')
makedepends=('git' 'cmake' 'mesa' 'mesa-libgl' 'glu' 'chrpath' 'zlib' 'sdl')
install=ppsspp.install
source=(git://github.com/hrydgard/ppsspp.git#tag=v$pkgver
        git://github.com/hrydgard/native.git#commit=2ba8e36
        lang::git://github.com/hrydgard/ppsspp-lang.git#commit=fdc4558
        ffmpeg::git://github.com/hrydgard/ppsspp-ffmpeg.git#commit=bc6302be
        ppsspp.desktop)
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'b70b8b3913079468db3469abeacaa9f6')

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
  install -Dm755 build/PPSSPPSDL "$pkgdir"/usr/bin/PPSSPPSDL
  install -Dm755 build/PPSSPPHeadless "$pkgdir"/usr/bin/PPSSPPHeadless
  chrpath -d "$pkgdir"/usr/bin/PPSSPP{SDL,Headless}

  install -d "$pkgdir"/usr/share/ppsspp "$pkgdir"/usr/share/icons/
  cp -r build/assets "$pkgdir"/usr/share/ppsspp/
  cp -r ppsspp/assets/unix-icons/hicolor "$pkgdir"/usr/share/icons/hicolor

  install -Dm644 ppsspp.desktop "$pkgdir"/usr/share/applications/ppsspp.desktop
}
