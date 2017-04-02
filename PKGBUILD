# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Ben Reedy <thebenj88@gmail.com>
# Contributor: Clement Guerin <geecko.dev@free.fr>
# Contributor: Thiago Kenji Okada <thiago.mast3r@gmail.com>

pkgbase=ppsspp
pkgname=('ppsspp' 'ppsspp-qt')
pkgver=1.4
pkgrel=1
pkgdesc='A PSP emulator written in C++'
arch=('x86_64')
url='http://www.ppsspp.org/'
license=('GPL2')
depends=('glew' 'libzip' 'sdl2')
makedepends=('cmake' 'git' 'glu' 'qt5-tools')
_commit='186d471305cad6fe83d8716d6b328f0e8b32b38c'
source=("git+https://github.com/hrydgard/ppsspp.git#commit=${_commit}"
        'git+https://github.com/hrydgard/ppsspp-ffmpeg.git#commit=a2e98d7ba4c7c5cac08608732c3058cb46e3e0ef'
        'ppsspp-glslang::git+https://github.com/hrydgard/glslang.git#commit=b16f7e6819267e57c3c244808d1981f0ce34acbc'
        'git+https://github.com/hrydgard/ppsspp-lang.git#commit=ed0bbfb389da213bd891d179d1d92e95b8f05e43'
        'git+https://github.com/Kingcom/armips.git#commit=770365d44df35d6e675c58bb2a774ca412278ef5'
        'armips-tinyformat::git+https://github.com/Kingcom/tinyformat.git#commit=b7f5a22753c81d834ab5133d655f1fd525280765'
        'git+https://github.com/KhronosGroup/SPIRV-Cross.git#commit=6381b2ff9c0d975af8fd2974c97aa12a69ab6cc6'
        'ppsspp.desktop')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '1c332702d0aeced07df7e12ba8530bc3f19a52bc76c355f6c84c141becfd46d8')

prepare() {
  cd ppsspp

  for submodule in ffmpeg assets/lang ext/glslang; do
    git submodule init ${submodule}
    git config submodule.${submodule}.url ../ppsspp-${submodule#*/}
    git submodule update ${submodule}
  done
  for submodule in ext/{SPIRV-Cross,armips}; do
    git submodule init ${submodule}
    git config submodule.${submodule}.url ../${submodule#*/}
    git submodule update ${submodule}
  done

  pushd ext/armips

  for submodule in ext/tinyformat; do
    git submodule init ${submodule}
    git config submodule.${submodule}.url ../../../armips-${submodule#*/}
    git submodule update ${submodule}
  done

  popd

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
    -DCMAKE_SKIP_RPATH='ON'
  make

  cd ../build-qt

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_SKIP_RPATH='ON' \
    -DUSING_QT_UI='ON'
  make
}

package_ppsspp() {
  conflicts=('ppsspp-qt')

  cd ppsspp/build-sdl

  install -dm 755 "${pkgdir}"/usr/{bin,share/{applications,icons,man/man1,pixmaps,ppsspp}}
  install -m 755 PPSSPPSDL "${pkgdir}"/usr/bin/ppsspp
  cp -dr --no-preserve='ownership' assets "${pkgdir}"/usr/share/ppsspp/
  cp -dr --no-preserve='ownership' ../icons/hicolor "${pkgdir}"/usr/share/icons/
  install -m 644 ../icons/icon-512.svg "${pkgdir}"/usr/share/pixmaps/ppsspp.svg
  install -m 644 ../../ppsspp.desktop "${pkgdir}"/usr/share/applications/
}

package_ppsspp-qt() {
  depends+=('qt5-base' 'qt5-multimedia')
  conflicts=('ppsspp')

  cd ppsspp/build-qt

  install -dm 755 "${pkgdir}"/usr/{bin,share/{applications,man/man1,pixmaps}}
  install -m 755 PPSSPPQt "${pkgdir}"/usr/bin/ppsspp
  cp -dr --no-preserve='ownership' assets "${pkgdir}"/usr/share/ppsspp/
  cp -dr --no-preserve='ownership' ../icons/hicolor "${pkgdir}"/usr/share/icons/
  install -m 644 ../icons/icon-512.svg "${pkgdir}"/usr/share/pixmaps/ppsspp.svg
  install -m 644 ../../ppsspp.desktop "${pkgdir}"/usr/share/applications/
}

# vim: ts=2 sw=2 et:
