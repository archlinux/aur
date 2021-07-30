# Maintainer: Dobroslaw Kijowski <dobo90_at_gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Duck Hunt <vaporeon@tfwno.gf>

_pkgname=libretro-ppsspp
pkgname=libretro-ppsspp-rbp
pkgver=30123
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
  zstd
)
makedepends=(
  cmake
  git
  mesa
  ninja
  python
)
_commit=8d7f57c4721e450a94c04238c8db3b39ca8f6a72
source=(
  libretro-ppsspp::git+https://github.com/hrydgard/ppsspp.git#commit=${_commit}
  git+https://github.com/Kingcom/armips.git
  git+https://github.com/discordapp/discord-rpc.git
  ppsspp-glslang::git+https://github.com/hrydgard/glslang.git
  git+https://github.com/hrydgard/ppsspp-lang.git
  ppsspp-miniupnp::git+https://github.com/hrydgard/miniupnp.git
  git+https://github.com/Tencent/rapidjson.git
  git+https://github.com/KhronosGroup/SPIRV-Cross.git
  armips-tinyformat::git+https://github.com/Kingcom/tinyformat.git
  libretro-ppsspp-assets-path.patch
  libretro-ppsspp-system-zstd.patch
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
            'c00fabec601ebf3e209871fe409d047ab47040c199e9e8e5f9ba0abdd9086ce6'
            'c65ae3f20976a573b1a74600b02515e3f665513864a49e10db57c2fd170819e7')

pkgver() {
  cd libretro-ppsspp

  git rev-list --count HEAD
}

prepare() {
  cd libretro-ppsspp

  #patch -Np1 -i ../libretro-ppsspp-assets-path.patch
  patch -Np1 -i ../libretro-ppsspp-system-zstd.patch

  for submodule in assets/lang ext/glslang ext/miniupnp; do
    git submodule init ${submodule}
    git config submodule.${submodule}.url ../ppsspp-${submodule#*/}
    git submodule update ${submodule}
  done
  for submodule in ext/{armips,rapidjson,SPIRV-Cross}; do
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
  cmake -S libretro-ppsspp -B build -G Ninja \
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
    -DUSE_SYSTEM_ZSTD=ON \
    -DUSING_QT_UI=OFF \
    -Wno-dev \
    -DUSE_FFMPEG=yes \
    -DUSE_SYSTEM_FFMPEG=yes
  cmake --build build
}

package() {
  install -Dm 644 build/lib/ppsspp_libretro.so -t "${pkgdir}"/usr/lib/libretro/
  install -Dm 644 libretro-ppsspp/LICENSE.TXT -t "${pkgdir}"/usr/share/licenses/libretro-ppsspp/
  install -dm 755 "${pkgdir}"/usr/share/libretro/ppsspp
  cp -dr --no-preserve=ownership build/assets "${pkgdir}"/usr/share/libretro/ppsspp/
}

# vim: ts=2 sw=2 et:
