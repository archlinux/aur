# Maintainer: vii <coderdayton14 at gmail dot com>

pkgname=nightcap
pkgver=0.5.2
pkgrel=1
pkgdesc='Android x86-64 Roblox compatibility runtime for Linux'
arch=('x86_64')
url='https://github.com/CoderDayton/nightcap'
license=('Apache-2.0')
depends=(
  'capstone'
  'curl'
  'ffmpeg'
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
  'libpng'
  'libsecret'
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
conflicts=('mocktail' 'nightcap-bin' 'nightcap-git')
options=('!debug' '!lto')
source=(
  "nightcap::git+https://github.com/CoderDayton/nightcap.git#tag=v${pkgver}"
)
sha256sums=(
  'SKIP'
)

prepare() {
  cd nightcap

  sed -i \
    's|add_subdirectory(third_party/Vulkan-Headers EXCLUDE_FROM_ALL)|find_package(VulkanHeaders CONFIG REQUIRED)|' \
    CMakeLists.txt
}

build() {
  cmake -S nightcap -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DMOCKTAIL_DEFAULT_COMPATIBILITY_MANIFEST=/usr/share/mocktail/metadata/roblox_compatibility.json \
    -DMOCKTAIL_DEFAULT_SIGNING_TRUST_MANIFEST=/usr/share/mocktail/metadata/roblox_signing_certificates.json \
    -DMOCKTAIL_DEFAULT_DOWNLOAD_SOURCES_MANIFEST=/usr/share/mocktail/metadata/roblox_download_sources.json \
    -DMOCKTAIL_ENABLE_UPSTREAM_JNIVM=OFF \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 nightcap/LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
