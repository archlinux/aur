# Maintainer: Benjamin Hodgetts <ben@xnode.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Ben Reedy <thebenj88@gmail.com>
# Contributor: Clement Guerin <geecko.dev@free.fr>
# Contributor: Thiago Kenji Okada <thiago.mast3r@gmail.com>
# Contributor: uberushaximus <uberushaximus@gmail.com>

pkgname='ppsspp-ex-git'
pkgver=1.6.2.r14.ad1b75292
pkgrel=1
pkgdesc='A PSP emulator written in C++ (SDL and Headless versions)'
arch=('x86_64')
url='http://www.ppsspp.org/'
license=('GPL2')
provides=('ppsspp')
conflicts=('ppsspp' 'ppsspp-qt' 'ppsspp-qt-git')
depends=('gcc-libs' 'glew' 'glibc' 'libgl' 'sdl2' 'zlib' 'hicolor-icon-theme' 'libzip')
makedepends=('cmake' 'git' 'glu' 'libzip' 'qt5-tools')
source=('git+https://github.com/hrydgard/ppsspp.git'
        'ppsspp-glslang::git+https://github.com/hrydgard/glslang.git'
        'git+https://github.com/hrydgard/ppsspp-lang.git'
        'git+https://github.com/Kingcom/armips.git'
        'armips-tinyformat::git+https://github.com/Kingcom/tinyformat.git'
        'git+https://github.com/KhronosGroup/SPIRV-Cross.git'
        'ppsspp.sh'
        'ppsspp.desktop'
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '2c2d1ee6d1ce5c2acec372d58b8079885f6d5d674633cfea489cd550252a5426'
            '1c332702d0aeced07df7e12ba8530bc3f19a52bc76c355f6c84c141becfd46d8'
)
pkgver() {
  cd ppsspp
  echo "$(git describe --tags | sed 's/^v//; s/-/.r/; s/-g/./')"
}

prepare() {
  cd ppsspp

  #patch -Np1 -i ../ppsspp-flags.patch

  for submodule in assets/lang ext/glslang; do
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

  if [[ -d build ]]; then rm -rf build; fi
  mkdir build
}

build() {
  cd ppsspp/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_SKIP_RPATH='ON' \
    -DHEADLESS='ON' \
    -DUSE_SYSTEM_FFMPEG='ON' \
    -DUSE_SYSTEM_LIBZIP='ON'
  make
}

package() {
  cd ppsspp/build

  install -dm 755 "${pkgdir}"/{opt/ppsspp,usr/{bin,share/{applications,icons,pixmaps}}}
  install -m 755 PPSSPPHeadless "${pkgdir}"/opt/ppsspp/
  install -m 755 PPSSPPSDL "${pkgdir}"/opt/ppsspp/
  cp -dr --no-preserve='ownership' assets "${pkgdir}"/opt/ppsspp/
  cp -dr --no-preserve='ownership' ../icons/hicolor "${pkgdir}"/usr/share/icons/
  install -m 644 ../icons/icon-512.svg "${pkgdir}"/usr/share/pixmaps/ppsspp.svg
  install -m 755 ../../ppsspp.sh "${pkgdir}"/usr/bin/ppsspp
  install -m 644 ../../ppsspp.desktop "${pkgdir}"/usr/share/applications/
}
