# Maintainer: Wouter Wijsman <wwijsman@live.nl>
# Maintainer original package: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Duck Hunt <vaporeon@tfwno.gf>

pkgname=libretro-ppsspp-gameros
pkgver=28196
pkgrel=2
pkgdesc='Sony PlayStation Portable core with all required assets'
arch=(x86_64)
url=https://github.com/libretro/ppsspp
license=(GPL2)
groups=(libretro)
depends=(
  gcc-libs
  glew
  glibc
  libgl
  libpng
  libretro-core-info
  libzip
  snappy
  zlib
)
makedepends=(
  cmake
  git
  libglvnd
  python
)
provides=(
  libretro-ppsspp
)
conflicts=(
  libretro-ppsspp
)
_commit=f0ea814107e3c29fc3c961195765e9148fa97fdd
source=(
  libretro-ppsspp::git+https://github.com/hrydgard/ppsspp.git#commit=${_commit}
  git+https://github.com/Kingcom/armips.git
  git+https://github.com/discordapp/discord-rpc.git
  git+https://github.com/hrydgard/ppsspp-ffmpeg.git
  ppsspp-glslang::git+https://github.com/hrydgard/glslang.git
  git+https://github.com/hrydgard/ppsspp-lang.git
  ppsspp-miniupnp::git+https://github.com/hrydgard/miniupnp.git
  git+https://github.com/Tencent/rapidjson.git
  git+https://github.com/KhronosGroup/SPIRV-Cross.git
  armips-tinyformat::git+https://github.com/Kingcom/tinyformat.git
  libretro.cpp.patch
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd libretro-ppsspp

  git rev-list --count HEAD
}

prepare() {
  cd libretro-ppsspp

  patch -p1 libretro/libretro.cpp < ../libretro.cpp.patch

  for submodule in ffmpeg assets/lang ext/glslang ext/miniupnp; do
    git submodule init ${submodule}
    git config submodule.${submodule}.url ../ppsspp-${submodule#*/}
    git submodule update ${submodule}
  done
  for submodule in ext/{armips,discord-rpc,rapidjson,SPIRV-Cross}; do
    git submodule init ${submodule}
    git config submodule.${submodule}.url ../${submodule#*/}
    git submodule update ${submodule}
  done

  cd ext/armips

  for submodule in ext/tinyformat; do
    git submodule init ${submodule}
    git config submodule.${submodule}.url ../../../armips-${submodule#*/}
    git submodule update ${submodule}
  done
}

build() {
  cmake -S libretro-ppsspp -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_SKIP_RPATH=ON \
    -DOpenGL_GL_PREFERENCE=GLVND \
    -DHEADLESS=OFF \
    -DLIBRETRO=ON \
    -DMOBILE_DEVICE=OFF \
    -DSIMULATOR=OFF \
    -DUNITTEST=OFF \
    -DUSE_SYSTEM_LIBZIP=ON \
    -DUSE_SYSTEM_SNAPPY=ON \
    -DUSING_QT_UI=OFF
  make -C build
}

package() {
  install -Dm 644 build/lib/ppsspp_libretro.so -t "${pkgdir}"/usr/lib/libretro/
  install -Dm 644 libretro-ppsspp/LICENSE.TXT -t "${pkgdir}"/usr/share/licenses/libretro-ppsspp-git/

  mkdir -p "${pkgdir}"/usr/share/libretro/bios/ppsspp/
  cp -r build/assets "${pkgdir}"/usr/share/libretro/bios/ppsspp/
}

# vim: ts=2 sw=2 et:
