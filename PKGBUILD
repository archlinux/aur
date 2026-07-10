# Maintainer: Vasiliy Stelmachenok <ventureo@yandex.ru>
# Maintainer: so5iso4ka <so5iso4ka@icloud.com>
# Contributor: asyync1024 <asyync1024 at proton dot me>
pkgname=freesmlauncher
pkgver=2.2.1
pkgrel=2
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
makedepends=(cmake extra-cmake-modules git jdk17-openjdk ninja scdoc gamemode vulkan-headers)
optdepends=(
  'glfw-pure: Native Wayland support'
  'openal: to use system OpenAL libraries'
  'visualvm: Profiling support'
  'xorg-xrandr: for older minecraft versions'
  'flite: minecraft voice narration'
)
source=("$pkgname::git+https://github.com/FreesmTeam/FreesmLauncher#tag=$pkgver")
sha256sums=('528e4209bc6c0b8aa2968c13fb856ddd5703fae906f1e4411cdb0c0128b10386')

prepare() {
  cd "$pkgname"
  git remote set-url origin https://github.com/FreesmTeam/FreesmLauncher
  git submodule update --init --filter=tree:0 --recursive
}

build() {
  cd "$pkgname"

  export PATH="/usr/lib/jvm/java-17-openjdk/bin/:$PATH"

  cmake -DCMAKE_BUILD_TYPE= \
    -GNinja \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DLauncher_QT_VERSION_MAJOR="6" \
    -DLauncher_ENABLE_JAVA_DOWNLOADER=ON \
    -DLauncher_DISABLE_WERROR=ON \
    -DCMAKE_C_FLAGS="$CFLAGS -DNDEBUG" \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS -DNDEBUG" \
    -Bbuild -S.
  cmake --build build
}

check() {
  ctest --test-dir "$pkgname/build" --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install "$pkgname/build"
  install -Dm644 "$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "$pkgname/docs/COPYING.md" -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
