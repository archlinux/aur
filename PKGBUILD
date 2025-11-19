# Maintainer: Yong Do-Hyun <froster12@naver.com>

pkgname=projtlauncher
pkgver=0.0.1
pkgrel=1
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
MAIN_COMMIT_HASH="0154de9edd0b0a53bb5a8f674ed86a04ed213c17"
LIB_COMMIT_HASH="23b955121b8217c1c348a9ed2483167a6f3ff4ad"
source=(
  'projt-launcher-${MAIN_COMMIT_HASH}.tar.gz::https://github.com/Project-Tick/ProjT-Launcher/archive/${MAIN_COMMIT_HASH}.tar.gz'
  'libnbtplusplus-${LIB_COMMIT_HASH}.tar.gz::https://github.com/Project-Tick/libnbtplusplus/archive/${LIB_COMMIT_HASH}.tar.gz'
  {lionshead,batch,mdi}.license
)
sha256sums=('0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5' 'd5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed' '2ee3ba8d96e9882150783b6444651ea4a65d779532ecac8646f2ecd3a48c2770' '009e25d32aab6dbae193aac4b82fa1a26cb07f288225b2906da425a0f219bc4c' '32646946afc31ef5a4ce2cbb5a5a68a9f552c540a78ef23344c51c3efca58fa6')

pkgver() {
  cd "projt-launcher-${MAIN_COMMIT_HASH}"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "projt-launcher-${MAIN_COMMIT_HASH}"

  git submodule init
  git config submodule.libraries/cmark.active false
  git config submodule.libraries/extra-cmake-modules.active false
  git config submodule.libraries/filesystem.active false
  git config submodule.libraries/libnbtplusplus.url "${srcdir}/libnbtplusplus"
  git config submodule.libraries/quazip.active false
  git config submodule.libraries/tomlplusplus.active false
  git config submodule.libraries/zlib.active false
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "projt-launcher-${MAIN_COMMIT_HASH}"

  export PATH="/usr/lib/jvm/java-17-openjdk/bin:$PATH"

  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DLauncher_BUILD_PLATFORM="archlinux" \
    -DLauncher_APP_BINARY_NAME="${_pkgname}" \
    -DLauncher_QT_VERSION_MAJOR="6" \
    -Wno-dev
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  # licenses
  install -Dm644 lionshead.license -t "$pkgdir"/usr/share/licenses/$pkgname/
  install -Dm644 batch.license -t "$pkgdir"/usr/share/licenses/$pkgname/
  install -Dm644 mdi.license -t "$pkgdir"/usr/share/licenses/$pkgname/
}
