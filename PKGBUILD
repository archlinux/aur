# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Ben Reedy <thebenj88@gmail.com>
# Contributor: Clement Guerin <geecko.dev@free.fr>
# Contributor: Thiago Kenji Okada <thiago.mast3r@gmail.com>
# Contributor: uberushaximus <uberushaximus@gmail.com>

pkgbase=ppsspp-git
pkgname=('ppsspp-git' 'ppsspp-qt-git')
pkgver=1.0.1.r2744.7e70a74
pkgrel=1
pkgdesc='A PSP emulator written in C++'
arch=('i686' 'x86_64')
url='http://www.ppsspp.org/'
license=('GPL2')
depends=('ffmpeg' 'sdl2')
makedepends=('cmake' 'git' 'glu' 'qt5-tools')
source=('git+https://github.com/hrydgard/ppsspp.git'
        'git+https://github.com/hrydgard/ppsspp-lang.git'
        'ppsspp-armips::git+https://github.com/Kingcom/armips.git'
        'ppsspp.desktop')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            '1c332702d0aeced07df7e12ba8530bc3f19a52bc76c355f6c84c141becfd46d8')

pkgver() {
  cd ppsspp

  echo "$(git describe --tags | sed 's/^v//; s/-/.r/; s/-g/./')"
}

prepare() {
  cd ppsspp

  for submodule in lang ext/armips; do
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
    -DCMAKE_SKIP_RPATH='TRUE' \
    -DUSE_SYSTEM_FFMPEG='TRUE'
  make

  cd ../build-qt

  qmake-qt5 CONFIG+='release' CONFIG+='system_ffmpeg' ../Qt/PPSSPPQt.pro
  make
}

package_ppsspp-git() {
  provides=('ppsspp')
  conflicts=('ppsspp' 'ppsspp-qt' 'ppsspp-qt-git')

  cd ppsspp/build-sdl

  install -dm 755 "${pkgdir}"/usr/{bin,share/{applications,man/man1,pixmaps,ppsspp}}
  install -m 755 PPSSPPSDL "${pkgdir}"/usr/bin/ppsspp
  cp -dr --no-preserve='ownership' assets "${pkgdir}"/usr/share/ppsspp/
  install -m 644 ../assets/unix-icons/icon-512.svg "${pkgdir}"/usr/share/pixmaps/ppsspp.svg
  install -m 644 ../../ppsspp.desktop "${pkgdir}"/usr/share/applications/
}

package_ppsspp-qt-git() {
  depends+=('qt5-base')
  provides=('ppsspp')
  conflicts=('ppsspp' 'ppsspp-git' 'ppsspp-qt')

  cd ppsspp/build-qt

  install -dm 755 "${pkgdir}"/usr/{bin,share/{applications,man/man1,pixmaps}}
  install -m 755 ppsspp "${pkgdir}"/usr/bin/
  install -m 644 ../assets/unix-icons/icon-512.svg "${pkgdir}"/usr/share/pixmaps/ppsspp.svg
  install -m 644 ../../ppsspp.desktop "${pkgdir}"/usr/share/applications/
}

# vim ts=2 sw=2 et:
