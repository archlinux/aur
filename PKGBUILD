# Maintainer: Dobroslaw Kijowski <dobo90_at_gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Duck Hunt <vaporeon@tfwno.gf>

_pkgname=libretro-ppsspp
pkgname=libretro-ppsspp-rbp
pkgver=27206
pkgrel=1
pkgdesc='Sony PlayStation Portable core (build for Raspberry Pi)'
arch=(armv7h)
url=https://github.com/libretro/ppsspp
license=(GPL2)
groups=(libretro)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
depends=(
  ffmpeg
  libegl
  libretro-core-info
  libzip
  snappy
)
makedepends=(
  cmake
  git
  mesa
  python
)
source=(
  libretro-ppsspp::git+https://github.com/hrydgard/ppsspp.git#commit=ba06c87a7dd953ff8f376fd6a5f811d29e1bdc6a
  git+https://github.com/Kingcom/armips.git
  git+https://github.com/discordapp/discord-rpc.git
  ppsspp-glslang::git+https://github.com/hrydgard/glslang.git
  git+https://github.com/hrydgard/ppsspp-lang.git
  git+https://github.com/Tencent/rapidjson.git
  git+https://github.com/KhronosGroup/SPIRV-Cross.git
  armips-tinyformat::git+https://github.com/Kingcom/tinyformat.git
)
sha256sums=(
  SKIP
  SKIP
  SKIP
  SKIP
  SKIP
  SKIP
  SKIP
  SKIP
)

pkgver() {
  cd libretro-ppsspp

  git rev-list --count HEAD
}

prepare() {
  cd libretro-ppsspp

  for submodule in assets/lang ext/glslang; do
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
    -DUSING_GLES2=yes \
    -DHEADLESS=OFF \
    -DLIBRETRO=ON \
    -DMOBILE_DEVICE=OFF \
    -DSIMULATOR=OFF \
    -DUNITTEST=OFF \
    -DUSE_SYSTEM_LIBZIP=ON \
    -DUSE_SYSTEM_SNAPPY=ON \
    -DUSING_QT_UI=OFF \
    -DUSE_FFMPEG=yes \
    -DUSE_SYSTEM_FFMPEG=yes
  make -C build
}

package() {
  install -Dm 644 build/lib/ppsspp_libretro.so -t "${pkgdir}"/usr/lib/libretro/
  install -Dm 644 libretro-ppsspp/LICENSE.TXT -t "${pkgdir}"/usr/share/licenses/libretro-ppsspp-git/
}

# vim: ts=2 sw=2 et:
