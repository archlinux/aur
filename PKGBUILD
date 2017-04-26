# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Ben Reedy <thebenj88@gmail.com>
# Contributor: Clement Guerin <geecko.dev@free.fr>
# Contributor: Thiago Kenji Okada <thiago.mast3r@gmail.com>

pkgbase=ppsspp
pkgname=('ppsspp' 'ppsspp-headless' 'ppsspp-qt')
pkgver=1.4
pkgrel=3
pkgdesc='A PSP emulator written in C++'
arch=('x86_64')
url='http://www.ppsspp.org/'
license=('GPL2')
depends=('glew' 'sdl2')
makedepends=('cmake' 'git' 'glu' 'libzip' 'qt5-tools')
_commit='186d471305cad6fe83d8716d6b328f0e8b32b38c'
source=("git+https://github.com/hrydgard/ppsspp.git#commit=${_commit}"
        'git+https://github.com/hrydgard/ppsspp-ffmpeg.git#commit=a2e98d7ba4c7c5cac08608732c3058cb46e3e0ef'
        'ppsspp-glslang::git+https://github.com/hrydgard/glslang.git#commit=b16f7e6819267e57c3c244808d1981f0ce34acbc'
        'git+https://github.com/hrydgard/ppsspp-lang.git#commit=ed0bbfb389da213bd891d179d1d92e95b8f05e43'
        'git+https://github.com/Kingcom/armips.git#commit=770365d44df35d6e675c58bb2a774ca412278ef5'
        'armips-tinyformat::git+https://github.com/Kingcom/tinyformat.git#commit=b7f5a22753c81d834ab5133d655f1fd525280765'
        'git+https://github.com/KhronosGroup/SPIRV-Cross.git#commit=6381b2ff9c0d975af8fd2974c97aa12a69ab6cc6'
        'ppsspp.sh'
        'ppsspp-headless.sh'
        'ppsspp-qt.sh'
        'ppsspp.desktop'
        'ppsspp-qt.desktop'
        'ppsspp-flags.patch')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '873d63c6ef9acdf7121f4bcc4cb849bb8a006abc508c403786c24ebd500e0eec'
            '5c168ae19d19059095101e5ff587d5b107b16d070721541f765d002e15d89ed4'
            'e14964ec3a931d10ed71a88316735f4c47ac7fd62f346973e0c9a0d0a2ff6cab'
            '1c332702d0aeced07df7e12ba8530bc3f19a52bc76c355f6c84c141becfd46d8'
            'b3b1fb9e0ecd3c4472b51f27d028a69514b1a3823c26e33da6ffaebfb1522b7f'
            '6694643d96dae673f01555637139468eb277f3379afbcceccad3f7e0ae670278')

prepare() {
  cd ppsspp

  patch -Np1 -i ../ppsspp-flags.patch

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
    -DCMAKE_SKIP_RPATH='ON' \
    -DHEADLESS='ON'
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
  depends+=('hicolor-icon-theme' 'libzip')

  cd ppsspp/build-sdl

  install -dm 755 "${pkgdir}"/{opt/ppsspp,usr/{bin,share/{applications,icons,pixmaps}}}
  install -m 755 PPSSPPSDL "${pkgdir}"/opt/ppsspp/
  cp -dr --no-preserve='ownership' assets "${pkgdir}"/opt/ppsspp/
  cp -dr --no-preserve='ownership' ../icons/hicolor "${pkgdir}"/usr/share/icons/
  install -m 644 ../icons/icon-512.svg "${pkgdir}"/usr/share/pixmaps/ppsspp.svg
  install -m 755 ../../ppsspp.sh "${pkgdir}"/usr/bin/ppsspp
  install -m 644 ../../ppsspp.desktop "${pkgdir}"/usr/share/applications/
}

package_ppsspp-headless() {
  cd ppsspp/build-sdl

  install -dm 755 "${pkgdir}"/{opt/ppsspp,usr/bin}
  install -m 755 PPSSPPHeadless "${pkgdir}"/opt/ppsspp/
  install -m 755 ../../ppsspp-headless.sh "${pkgdir}"/usr/bin/ppsspp-headless
}

package_ppsspp-qt() {
  conflicts=('ppsspp')
  depends+=('hicolor-icon-theme' 'libzip' 'qt5-base')

  cd ppsspp/build-qt

  install -dm 755 "${pkgdir}"/{opt/ppsspp,usr/{bin,share/{applications,icons,pixmaps}}}
  install -m 755 PPSSPPQt "${pkgdir}"/opt/ppsspp/
  cp -dr --no-preserve='ownership' assets "${pkgdir}"/opt/ppsspp/
  cp -dr --no-preserve='ownership' ../icons/hicolor "${pkgdir}"/usr/share/icons/
  install -m 644 ../icons/icon-512.svg "${pkgdir}"/usr/share/pixmaps/ppsspp.svg
  install -m 755 ../../ppsspp-qt.sh "${pkgdir}"/usr/bin/ppsspp-qt
  install -m 644 ../../ppsspp-qt.desktop "${pkgdir}"/usr/share/applications/
}

# vim: ts=2 sw=2 et:
