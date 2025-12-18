# Maintainer: Yong Do-Hyun <froster12@naver.com>

pkgname=projtlauncher
pkgver=0.0.3
pkgrel=4
pkgdesc='A modernized, community-driven Minecraft launcher based on the MultiMC/Prism Launcher lineage.'
url='https://projtlauncher.yongdohyun.org.tr'
arch=(x86_64 aarch64)
license=('GPL-3.0-or-later AND GPL-3.0-only AND LGPL-3.0-or-later AND LGPL-2.0-or-later AND Apache-2.0 AND MIT AND LicenseRef-Batch AND OFL-1.1')
depends=(
  cmark
  gcc-libs
  glibc
  hicolor-icon-theme
  java-runtime=17
  libgl
  qrencode
  qt6-5compat
  qt6-base
  qt6-imageformats
  qt6-networkauth
  qt6-svg
  quazip-qt6
  tomlplusplus
  zlib
)
makedepends=(
  cmake
  extra-cmake-modules
  gamemode
  ghc-filesystem
  git
  jdk17-openjdk
  scdoc
)
optdepends=(
  'glfw: to use system GLFW libraries'
  'openal: to use system OpenAL libraries'
  'visualvm: Profiling support'
  'xorg-xrandr: for older minecraft versions'
  'java-runtime=8: for older minecraft versions'
  'flite: minecraft voice narration'
)
source=(
  "git+https://github.com/Project-Tick/ProjT-Launcher.git#tag=${pkgver}-${pkgrel}?submodules"
  {lionshead,batch,mdi}.license
)
sha256sums=('SKIP' '2ee3ba8d96e9882150783b6444651ea4a65d779532ecac8646f2ecd3a48c2770' '009e25d32aab6dbae193aac4b82fa1a26cb07f288225b2906da425a0f219bc4c' '32646946afc31ef5a4ce2cbb5a5a68a9f552c540a78ef23344c51c3efca58fa6')

prepare() {
  cd "$srcdir/ProjT-Launcher"
  git submodule update --init --recursive
}

build() {
  cd "$srcdir/ProjT-Launcher"

  export PATH="/usr/lib/jvm/java-17-openjdk/bin:$PATH"

  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DLauncher_BUILD_PLATFORM="archlinux" \
    -DLauncher_APP_BINARY_NAME="${pkgname}" \
    -DLauncher_QT_VERSION_MAJOR="6" \
    -Wno-dev
  cmake --build build
}

check() {
  cd "$srcdir/ProjT-Launcher"
  ctest --test-dir build --output-on-failure
}

package() {
  cd "$srcdir/ProjT-Launcher"
  DESTDIR="${pkgdir}" cmake --install build

  # licenses
  install -Dm644 "$srcdir/lionshead.license" "$pkgdir/usr/share/licenses/$pkgname/lionshead.license"
  install -Dm644 "$srcdir/batch.license"     "$pkgdir/usr/share/licenses/$pkgname/batch.license"
  install -Dm644 "$srcdir/mdi.license"       "$pkgdir/usr/share/licenses/$pkgname/mdi.license"
}
