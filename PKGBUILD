# Maintainer: AltoXorg <machinademoniko@gmail.com>

_reponame=SpaghettiKart
_torch_commit=2d474ddb8da8b213fbdbb49d0273ce31fa955f35
_lus_commit=f40cfd33b8bc6237d635d4ed82838a7e3f785386
_sdl_gcdb_commit=9cc9325b050f84808fcc77a868f1ee934555346f  # This needs to be updated on every package release

pkgname=spaghettikart
pkgver=1.0.0
pkgrel=1
pkgdesc="An unofficial native port of Mario Kart 64"
license=("unknown" "MIT")
arch=("x86_64" "i686" "armv7h" "aarch64")
url="https://github.com/HarbourMasters/${_reponame}"
depends=("sdl2" "sdl2_net" "zenity" "libogg" "libvorbis" "libzip" "tinyxml2" "fmt" "spdlog")
makedepends=("git" "cmake" "ninja" "nlohmann-json")  # nlohmann-json is set as required on LUS's CMakeLists.txt but not dynamic linked
install="spaghettikart.install"
source=("${_reponame}-${pkgver}.tar.gz::https://github.com/HarbourMasters/${_reponame}/archive/refs/tags/${pkgver}.tar.gz"
        "Torch-${_torch_commit:0:8}.tar.gz::https://github.com/HarbourMasters/Torch/archive/${_torch_commit}.tar.gz"
        "libultraship-${_lus_commit:0:8}.tar.gz::https://github.com/Kenix3/libultraship/archive/${_lus_commit}.tar.gz"
        "https://github.com/mdqinc/SDL_GameControllerDB/raw/${_sdl_gcdb_commit}/gamecontrollerdb.txt"
        "spaghettikart-cmake-flags.patch"
        "spaghettikart.desktop")
sha256sums=('8000025feb798488432e7fb6024ac42ca9b281aa070b4e1e58d361efe0e5b10e'
            '5d57aac6d7051485207a049eb385c9eeb71d013240720fbd17a35522e0ae4aa0'
            'abe8cfe0b0c3cf6654abb01fc5704faa7c77272f7e31f707e3a659aa72c3c87c'
            'dbda45f3000470f0217fa8cd111c13cdb3bb64f65425449b324815bff7d53bf1'
            '9dc9125a0498a26e4878abdbef3f102602af2d0608312e5ae302b1b68b4d4f27'
            '4c17e6b2514dbc11c87542b2c99bb2de1fed8747a562b9c26a908c3ea86a6f5e')

SHIP_PREFIX=/opt/spaghettikart

_is_debug() {
  for opt in "${OPTIONS[@]}"; do
    if [ "$opt" = debug ]; then
      return 0
    fi
  done

  return 1
}


prepare() {
  cd "${srcdir}/${_reponame}-${pkgver}"

  rm -r libultraship torch
  cp -r ../libultraship-${_lus_commit} libultraship
  cp -r ../Torch-${_torch_commit} torch

  # Required patch for compilation
  patch -Np1 -i "${srcdir}/spaghettikart-cmake-flags.patch"
}

build() {
  cd "${srcdir}/${_reponame}-${pkgver}"

  if _is_debug; then
    BUILD_TYPE=RelWithDebInfo
  else
    BUILD_TYPE=Release
  fi

  export CFLAGS="${CFLAGS/-Werror=format-security/}"
  export CXXFLAGS="${CXXFLAGS/-Werror=format-security/}"

  cmake . \
    -Bbuild \
    -GNinja \
    -DNON_PORTABLE=On \
    -DCMAKE_INSTALL_PREFIX=$SHIP_PREFIX

  cmake --build build --config $BUILD_TYPE $NINJAFLAGS
  cmake --build build --config $BUILD_TYPE --target GenerateO2R  # Generates spaghetti.o2r
}

package() {
  cd "${srcdir}/${_reponame}-${pkgver}"

  # Create Directories
  install -dm755 "${pkgdir}/${SHIP_PREFIX}" "${pkgdir}/usr/bin/"

  # Main executable & assets to /opt
  cp -r build/yamls "${pkgdir}/${SHIP_PREFIX}"
  install -m755 build/Spaghettify "${pkgdir}/${SHIP_PREFIX}"
  install -m644 -t "${pkgdir}/${SHIP_PREFIX}" \
        build/config.yml \
        build/spaghetti.o2r \
        "${srcdir}/gamecontrollerdb.txt"

  # Link executable to /usr/bin, add to desktop entry & icons
  ln -s "${SHIP_PREFIX}/Spaghettify" "${pkgdir}/usr/bin/Spaghettify"
  install -Dm644 "${srcdir}/spaghettikart.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 icon.png "${pkgdir}/usr/share/pixmaps/spaghettikart.png"

  # Licenses (HarbourMasters libraries are MIT, game engine + port source code is nonfree)
  install -Dm644 "libultraship/LICENSE" "${pkgdir}/usr/share/licenses/spaghettikart/libultraship-LICENSE"
  install -Dm644 "torch/LICENSE" "${pkgdir}/usr/share/licenses/spaghettikart/torch-LICENSE"

  # Copy game documentation
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/spaghettikart/README.md"
}
