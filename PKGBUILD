# Maintainer: AltoXorg <machinademoniko@gmail.com>

_reponame=SpaghettiKart
_torch_commit=5773373b3620e4a6bc6c92fdc4690d66741c086d
_lus_commit=5e33d3e7cd0396f847923cd6c471eaf324e90351
_sdl_gcdb_commit=dce2d3593c6a96a57716d13d58aa3b1d4965fe6f  # This needs to be updated on every package release

pkgname=spaghettikart
pkgver=0.9.9.1
_vertag=Latest2
pkgrel=2
pkgdesc="An unofficial native port of Mario Kart 64"
license=("unknown" "MIT")
arch=("x86_64" "i686" "armv7h" "aarch64")
url="https://github.com/HarbourMasters/${_reponame}"
depends=("sdl2" "sdl2_net" "zenity" "libogg" "libvorbis" "libzip" "tinyxml2" "fmt" "spdlog")
makedepends=("git" "cmake" "ninja" "nlohmann-json")  # nlohmann-json is set as required on LUS's CMakeLists.txt but not dynamic linked
install="spaghettikart.install"
source=(#"${_reponame}-${pkgver}.tar.gz::https://github.com/HarbourMasters/${_reponame}/archive/refs/tags/${pkgver}.tar.gz"
        "${_reponame}-${pkgver}.tar.gz::https://github.com/HarbourMasters/${_reponame}/archive/refs/tags/${_vertag}.tar.gz"  # Tag should have been in a version format
        "Torch-${_torch_commit:0:8}.tar.gz::https://github.com/HarbourMasters/Torch/archive/${_torch_commit}.tar.gz"
        "libultraship-${_lus_commit:0:8}.tar.gz::https://github.com/Kenix3/libultraship/archive/${_lus_commit}.tar.gz"
        "https://github.com/mdqinc/SDL_GameControllerDB/raw/${_sdl_gcdb_commit}/gamecontrollerdb.txt"
        "torch-src-dest-paths.patch::https://github.com/HarbourMasters/Torch/pull/187.patch"
        "lus-save-file-path.patch::https://github.com/Kenix3/libultraship/pull/908.patch"
        "spaghettikart-non-portable-fix.patch"
        "spaghettikart.desktop")
sha256sums=('5c3e79f8440f65c0f36270a781f26f9b83ecd58de2e414c68b4bb0a057707d69'
            'c4809596a77415d7376691aa80bdee601b358613a196ad6cf59fdf4185c03227'
            '40691d2f05679d6c96a33bb8382fd0f4ca09d2c932532aa1aa51de3df635eeb4'
            'a401e7784adb216419677d401b14f2c8b1b3247d00e35f617ea5900da3ea409e'
            '80cb215a02a38d5148bf9084721774427857fd6ba187609156439a391d25907e'
            '906d6265cf744c6f988f39b5986232304801a8a49aea1e39cf8911bd83ddc497'
            '29506f5deaa631bd0ee17e4a89737e0dc12bee1d71041e0b24bbb59b660c8039'
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
  cd "${srcdir}/${_reponame}-${_vertag}"

  rm -r libultraship torch
  cp -r ../libultraship-${_lus_commit} libultraship
  cp -r ../Torch-${_torch_commit} torch

  patch -Np1 -i "${srcdir}/spaghettikart-non-portable-fix.patch"

  cd libultraship
  patch -Np1 -i "${srcdir}/lus-save-file-path.patch"

  cd ../torch
  patch -Np1 -i "${srcdir}/torch-src-dest-paths.patch"
}

build() {
  cd "${srcdir}/${_reponame}-${_vertag}"

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
  cd "${srcdir}/${_reponame}-${_vertag}"

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
