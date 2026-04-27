# Maintainer: Vasiliy Stelmachenok <ventureo@yandex.ru>
# Maintainer: so5iso4ka <so5iso4ka@icloud.com>
pkgname=freesmlauncher
pkgver=2.2.0
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
makedepends=(cmake extra-cmake-modules git jdk17-openjdk ninja scdoc gamemode)
optdepends=(
  'glfw-pure: Native Wayland support'
  'openal: to use system OpenAL libraries'
  'visualvm: Profiling support'
  'xorg-xrandr: for older minecraft versions'
  'flite: minecraft voice narration'
)
source=("$pkgname::git+https://github.com/FreesmTeam/FreesmLauncher#tag=$pkgver")
sha256sums=('5248ef6f5a9db5bdcfa2d600b3040a67717cb446026f00fdce1d3af32c24759f')

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
    -DCMAKE_C_FLAGS="$CFLAGS -DNDEBUG" \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS -DNDEBUG" \
    -Bbuild -S.
  cmake --build build
}

check() {
  cd "$pkgname"
  ctest .
}

package() {
  cd "$pkgname/build"
  DESTDIR="$pkgdir" cmake --install .
}

# vim:set ts=2 sw=2 et:
