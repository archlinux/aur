# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Ben Reedy <thebenj88@gmail.com>
# Contributor: Clement Guerin <geecko.dev@free.fr>
# Contributor: Thiago Kenji Okada <thiago.mast3r@gmail.com>

pkgbase=ppsspp
pkgname=('ppsspp' 'ppsspp-qt')
pkgver=1.0.1
pkgrel=2
pkgdesc='A PSP emulator written in C++'
arch=('i686' 'x86_64')
url='http://www.ppsspp.org/'
license=('GPL2')
depends=('ffmpeg' 'sdl2')
makedepends=('cmake' 'git' 'glu' 'qt5-tools')
source=("git+https://github.com/hrydgard/ppsspp.git#tag=v${pkgver}"
        'git+https://github.com/hrydgard/ppsspp-lang.git#commit=52c757e'
        'ppsspp-native::git+https://github.com/hrydgard/native.git#commit=52ce9c1'
        'ppsspp-armips::git+https://github.com/Kingcom/armips.git#commit=a0b878f'
        'ppsspp-ffmpeg.patch')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '4d60b99f9e6fe1bb81b2b1b648845f9e76289ba824fcb5e53f2117d0319e086d')

prepare() {
  cd ppsspp

  for submodule in native lang ext/armips; do
    git submodule init ${submodule}
    git config submodule.${submodule}.url ../ppsspp-${submodule#*/}
    git submodule update ${submodule}
  done

  patch -Np1 -i ../ppsspp-ffmpeg.patch
}

build() {
  cd ppsspp

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_SKIP_RPATH='TRUE'
  make

  cd ..

  if [[ -d build-qt ]]; then
    rm -rf build-qt
  fi
  mkdir build-qt && cd build-qt

  qmake-qt5 CONFIG+='release' CONFIG+='system_ffmpeg' ../Qt/PPSSPPQt.pro
  make
}

package_ppsspp() {
  conflicts=('ppsspp-qt')

  cd ppsspp/build

  install -dm 755 "${pkgdir}"/usr/{bin,share/{applications,man/man1,pixmaps,ppsspp}}
  install -m 755 PPSSPPSDL "${pkgdir}"/usr/bin/ppsspp
  cp -dr --no-preserve='ownership' assets "${pkgdir}"/usr/share/ppsspp/
  install -m 644 ../assets/unix-icons/icon-512.svg "${pkgdir}"/usr/share/pixmaps/ppsspp.svg
  install -m 644 ../debian/ppsspp.desktop "${pkgdir}"/usr/share/applications/
  install -m 644 ../debian/ppsspp.1 "${pkgdir}"/usr/share/man/man1/
}

package_ppsspp-qt() {
  depends+=('qt5-base')
  provides=('ppsspp')
  conflicts=('ppsspp')

  cd ppsspp/build-qt

  install -dm 755 "${pkgdir}"/usr/{bin,share/{applications,man/man1,pixmaps}}
  install -m 755 ppsspp "${pkgdir}"/usr/bin/
  install -m 644 ../assets/unix-icons/icon-512.svg "${pkgdir}"/usr/share/pixmaps/ppsspp.svg
  install -m 644 ../debian/ppsspp.desktop "${pkgdir}"/usr/share/applications/
  install -m 644 ../debian/ppsspp.1 "${pkgdir}"/usr/share/man/man1/
}

# vim: ts=2 sw=2 et:
