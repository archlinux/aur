# Maintainer: komaruworld <rtysus228 at gmail dot com>

pkgname=mocktail
pkgver=0.1.0
pkgrel=3
pkgdesc='Android x86-64 Roblox compatibility runtime for Linux'
arch=('x86_64')
url='https://github.com/komaruworld/mocktail'
license=('Apache-2.0')
depends=(
  'capstone'
  'curl'
  'fontconfig'
  'gcc-libs'
  'glib2'
  'glibc'
  'gtk4'
  'hicolor-icon-theme'
  'libadwaita'
  'libelf'
  'libglvnd'
  'libplacebo'
  'libsoup3'
  'libutf8proc'
  'libyaml'
  'minizip'
  'openssl'
  'sdl3>=3.4'
  'sdl3_ttf'
  'vulkan-icd-loader'
  'webkitgtk-6.0'
  'zlib'
)
makedepends=(
  'cmake>=3.20'
  'git'
  'ninja'
  'nlohmann-json'
  'pkgconf'
  'vulkan-headers'
)
optdepends=('gamemode: Feral GameMode integration')
conflicts=('mocktail-bin' 'mocktail-git')
options=('!debug')
_commit=6aa22c257dbb451b7c58d7ad4608710feaa3faf7
source=(
  "mocktail::git+https://github.com/komaruworld/mocktail.git#commit=${_commit}"
)
sha256sums=(
  'SKIP'
)

prepare() {
  cd mocktail

  sed -i \
    's|add_subdirectory(third_party/Vulkan-Headers EXCLUDE_FROM_ALL)|find_package(VulkanHeaders CONFIG REQUIRED)|' \
    CMakeLists.txt
}

build() {
  cmake -S mocktail -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DMOCKTAIL_DEFAULT_COMPATIBILITY_MANIFEST=/usr/share/mocktail/metadata/roblox_compatibility.json \
    -DMOCKTAIL_DEFAULT_SIGNING_TRUST_MANIFEST=/usr/share/mocktail/metadata/roblox_signing_certificates.json \
    -DMOCKTAIL_ENABLE_UPSTREAM_JNIVM=OFF \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 mocktail/LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
