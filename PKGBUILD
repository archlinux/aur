# Maintainer: komaruworld <rtysus228 at gmail dot com>

pkgname=mocktail-git
pkgver=1.0.3.r87.gd5f9c91
pkgrel=1
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
  'lld'
  'ninja'
  'nlohmann-json'
  'pkgconf'
  'vulkan-headers'
)
optdepends=('gamemode: Feral GameMode integration')
provides=('mocktail')
conflicts=('mocktail' 'mocktail-bin')
options=('!debug')
source=(
  'mocktail::git+https://github.com/komaruworld/mocktail.git#branch=main'
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd mocktail

  local version
  version="$(sed -n \
    's/^[[:space:]]*VERSION[[:space:]]\+\([0-9][0-9.]*\).*/\1/p' \
    CMakeLists.txt | head -n 1)"
  printf '%s.r%s.g%s' \
    "${version}" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

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
