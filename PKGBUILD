# Maintainer: komaruworld <rtysus228 at gmail dot com>

pkgname=mocktail
pkgver=0.1.0
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
  'ninja'
  'nlohmann-json'
  'pkgconf'
)
optdepends=('gamemode: Feral GameMode integration')
conflicts=('mocktail-bin' 'mocktail-git')
options=('!debug')
source=(
  "mocktail::git+https://github.com/komaruworld/mocktail.git#tag=${pkgver}"
  'libjnivm::git+https://github.com/ChristopherHX/libjnivm.git'
  'vulkan-headers::git+https://github.com/KhronosGroup/Vulkan-Headers.git'
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)

prepare() {
  cd mocktail

  git submodule init
  git config submodule.third_party/libjnivm.url "${srcdir}/libjnivm"
  git config submodule.third_party/Vulkan-Headers.url \
    "${srcdir}/vulkan-headers"
  git -c protocol.file.allow=always submodule update
}

build() {
  cmake -S mocktail -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DMOCKTAIL_DEFAULT_COMPATIBILITY_MANIFEST=/usr/share/mocktail/metadata/roblox_compatibility.json \
    -DMOCKTAIL_DEFAULT_SIGNING_TRUST_MANIFEST=/usr/share/mocktail/metadata/roblox_signing_certificates.json \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 mocktail/LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
