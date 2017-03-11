# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Ben Reedy <thebenj88@gmail.com>
# Contributor: Clement Guerin <geecko.dev@free.fr>
# Contributor: Thiago Kenji Okada <thiago.mast3r@gmail.com>

pkgbase=ppsspp
pkgname=('ppsspp' 'ppsspp-qt')
pkgver=1.3
pkgrel=2
pkgdesc='A PSP emulator written in C++'
arch=('x86_64')
url='http://www.ppsspp.org/'
license=('GPL2')
depends=('glew' 'libzip' 'sdl2')
makedepends=('cmake' 'git' 'glu' 'qt5-tools')
source=("git+https://github.com/hrydgard/ppsspp.git#tag=v${pkgver}"
        'git+https://github.com/hrydgard/ppsspp-ffmpeg.git#commit=81379c5'
        'git+https://github.com/hrydgard/ppsspp-glslang.git#commit=4b3e84f'
        'git+https://github.com/hrydgard/ppsspp-lang.git#commit=cdf4a8d'
        'ppsspp-armips::git+https://github.com/Kingcom/armips.git#commit=1ffab37'
        'ppsspp.desktop')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '1c332702d0aeced07df7e12ba8530bc3f19a52bc76c355f6c84c141becfd46d8')

prepare() {
  cd ppsspp

  for submodule in ffmpeg lang ext/{armips,glslang}; do
    git submodule init ${submodule}
    git config submodule.${submodule}.url ../ppsspp-${submodule#*/}
    git submodule update ${submodule}
  done

  for ui in sdl qt; do
    if [[ -d build-$ui ]]; then
      rm -rf build-$ui
    fi
    mkdir build-$ui
  done
}

build() {
  cd ppsspp/build-sdl

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_SKIP_RPATH='TRUE'
  make

  cd ../build-qt

  qmake-qt5 CONFIG+='release' QMAKE_LFLAGS+='-lz' ../Qt/PPSSPPQt.pro
  make
}

package_ppsspp() {
  conflicts=('ppsspp-qt')

  cd ppsspp/build-sdl

  install -dm 755 "${pkgdir}"/usr/{bin,share/{applications,pixmaps,ppsspp}}
  install -m 755 PPSSPPSDL "${pkgdir}"/usr/bin/ppsspp
  cp -dr --no-preserve='ownership' assets "${pkgdir}"/usr/share/ppsspp/
  install -m 644 ../assets/unix-icons/icon-512.svg "${pkgdir}"/usr/share/pixmaps/ppsspp.svg
  install -m 644 ../../ppsspp.desktop "${pkgdir}"/usr/share/applications/
}

package_ppsspp-qt() {
  depends+=('qt5-base')
  provides=('ppsspp')
  conflicts=('ppsspp')

  cd ppsspp/build-qt

  install -dm 755 "${pkgdir}"/usr/{bin,share/{applications,pixmaps}}
  install -m 755 ppsspp "${pkgdir}"/usr/bin/
  install -m 644 ../assets/unix-icons/icon-512.svg "${pkgdir}"/usr/share/pixmaps/ppsspp.svg
  install -m 644 ../../ppsspp.desktop "${pkgdir}"/usr/share/applications/
}

# vim: ts=2 sw=2 et:
