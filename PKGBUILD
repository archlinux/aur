# Maintainer: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=ppsspp
pkgver=1.0.1
pkgrel=1
pkgdesc='PSP emulator written in C++'
arch=('i686' 'x86_64')
url='http://www.ppsspp.org/'
license=('GPL2')
depends=('zlib' 'sdl2' 'libpng' 'libgl' 'hicolor-icon-theme' 'xdg-utils' 'ffmpeg')
makedepends=('git' 'cmake' 'mesa' 'mesa-libgl' 'glu' 'chrpath' 'zlib' 'sdl')
install=ppsspp.install
source=(git://github.com/hrydgard/ppsspp.git#tag=v$pkgver
        git://github.com/hrydgard/native.git#commit=52ce9c1
        lang::git://github.com/hrydgard/ppsspp-lang.git#commit=52c757e
        ffmpeg::git://github.com/hrydgard/ppsspp-ffmpeg.git#commit=04d6e3e
        git://github.com/Kingcom/armips#commit=a0b878f
        ppsspp-1.0-shared-ffmpeg.patch
        ppsspp.desktop)
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         '0b6265a0ba7c8b7066adbed210a5a5bb'
         'b70b8b3913079468db3469abeacaa9f6')

prepare() {
  mkdir build
  cd $pkgname

  git submodule init
  for submodule in native lang ffmpeg ext/armips; do
    git config submodule.${submodule}.url "$srcdir"/${submodule#*/}
    git submodule update $submodule
  done

  patch -p1 -i ../ppsspp-1.0-shared-ffmpeg.patch
}

build() {
  cd build
  cmake ../$pkgbase -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  install -Dm755 build/PPSSPPSDL "$pkgdir"/usr/bin/PPSSPPSDL
  chrpath -d "$pkgdir"/usr/bin/PPSSPPSDL

  install -d "$pkgdir"/usr/share/ppsspp "$pkgdir"/usr/share/icons/
  cp -r build/assets "$pkgdir"/usr/share/ppsspp/
  cp -r ppsspp/assets/unix-icons/hicolor "$pkgdir"/usr/share/icons/hicolor

  install -Dm644 ppsspp.desktop "$pkgdir"/usr/share/applications/ppsspp.desktop
}
