# Maintainer: Vasiliy Stelmachenok <ventureo@yandex.ru>
# Maintainer: so5iso4ka <so5iso4ka@icloud.com>
# Contributor: asyync1024 <asyync1024 at proton dot me>
pkgname=freesmlauncher
pkgver=2.2.2
pkgrel=1
pkgdesc="Minecraft launcher with offline accounts support"
arch=(x86_64)
url='https://freesmlauncher.org/'
license=('GPL-3.0-only AND LGPL-3.0-or-later AND LGPL-2.0-or-later AND Apache-2.0 AND MIT AND LicenseRef-Batch AND OFL-1.1')
depends=(
  cmark
  glibc
  libstdc++
  libgcc
  hicolor-icon-theme
  java-runtime
  libarchive
  mesa-utils
  pciutils
  qrencode
  qt6-base
  qt6-imageformats
  qt6-networkauth
  qt6-svg
  tomlplusplus
  zlib
)
options=(!lto)
makedepends=(cmake extra-cmake-modules jdk17-openjdk ninja scdoc gamemode vulkan-headers)
optdepends=(
  'glfw-pure: Native Wayland support'
  'openal: to use system OpenAL libraries'
  'visualvm: Profiling support'
  'xorg-xrandr: for older minecraft versions'
  'flite: minecraft voice narration'
)
source=(https://github.com/FreesmTeam/FreesmLauncher/releases/download/${pkgver}/FreesmLauncher-${pkgver}.tar.gz)
sha256sums=('3de6d59dcded840526041ecd99e9a4dba073811099126fbd590e2a9f4ac5b189')

build() {
  export PATH="/usr/lib/jvm/java-17-openjdk/bin/:$PATH"

  local _cmake_options=(
      -S "FreesmLauncher-$pkgver"
      -B build
      -G Ninja
      -D CMAKE_BUILD_TYPE='None'
      -D CMAKE_INSTALL_PREFIX='/usr'
      -D Launcher_BUILD_PLATFORM='archlinux'
      -D Launcher_ENABLE_JAVA_DOWNLOADER=ON
      -D Launcher_DISABLE_WERROR=ON
      -D CMAKE_C_FLAGS="$CFLAGS -DNDEBUG"
      -D CMAKE_CXX_FLAGS="$CXXFLAGS -DNDEBUG"
  )

  cmake "${_cmake_options[@]}"

  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "FreesmLauncher-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "FreesmLauncher-$pkgver/docs/COPYING.md" -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
