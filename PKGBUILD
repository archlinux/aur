# Maintainer: Evan Goode <mail@evangoo.de>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: txtsd <aur.archlinux@ihavea.quest>
# Contributor: seth <getchoo at tuta dot io>
# Contributor: fn2006 <usernamefn2006alreadyused@protonmail.com>
# Contributor: Lenny McLennington <lennymclennington@protonmail.com>
# Contributor: Elijah Gregg <lovetocode999@tilde.team>
# Contributor: Miko <mikoxyzzz@gmail.com>
# Contributor: Cheru Berhanu <aur attt cheru doot dev>
# Contributor: dada513 <dada513@protonmail.com>

pkgname=fjordlauncher-git
_pkgname=${pkgname%-git}
pkgver=11.0.0.0.r3.g2907c217f
pkgrel=1
pkgdesc='Prism Launcher fork with support for alternative auth servers'
arch=(i686 x86_64 aarch64)
url='https://github.com/unmojang/FjordLauncher'
license=('GPL-3.0-only AND LGPL-3.0-or-later AND LGPL-2.0-or-later AND Apache-2.0 AND MIT AND LicenseRef-Batch AND OFL-1.1')
depends=(
  cmark
  gcc-libs
  glibc
  hicolor-icon-theme
  java-runtime=17
  libarchive
  libgl
  qrencode
  qt6-base
  qt6-imageformats
  qt6-networkauth
  qt6-svg
  qt6-wayland
  tomlplusplus
  zlib
)
provides=('fjordlauncher')
conflicts=('fjordlauncher')
makedepends=(
  cmake
  extra-cmake-modules
  gamemode
  git
  jdk17-openjdk
  scdoc
  vulkan-headers
)
optdepends=(
  'glfw: to use system GLFW libraries'
  'openal: to use system OpenAL libraries'
  'visualvm: Profiling support'
  'xorg-xrandr: for older minecraft versions'
  'java-runtime=8: for older minecraft versions'
  'flite: minecraft voice narration'
  'gamemode: to optimize gameplay'
)
source=(
  'git+https://github.com/unmojang/FjordLauncher.git'
  'git+https://github.com/PrismLauncher/libnbtplusplus.git'
  {lionshead,batch,mdi}.license
)
sha256sums=('SKIP'
            'SKIP'
            '2ee3ba8d96e9882150783b6444651ea4a65d779532ecac8646f2ecd3a48c2770'
            '009e25d32aab6dbae193aac4b82fa1a26cb07f288225b2906da425a0f219bc4c'
            '32646946afc31ef5a4ce2cbb5a5a68a9f552c540a78ef23344c51c3efca58fa6')

pkgver() {
  cd "FjordLauncher"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "FjordLauncher"

  git submodule init
  git config submodule.libraries/libnbtplusplus.url "${srcdir}/libnbtplusplus"
  git config submodule.flatpak/shared-modules.active false
  git -c protocol.file.allow=always submodule update
}

build() {
  export PATH="/usr/lib/jvm/java-17-openjdk/bin:$PATH"

  cmake -S FjordLauncher -B build \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DLauncher_BUILD_PLATFORM="archlinux" \
    -DLauncher_APP_BINARY_NAME="${_pkgname}" \
    -DLauncher_QT_VERSION_MAJOR="6" \
    -DLauncher_ENABLE_JAVA_DOWNLOADER=ON \
    -DCMAKE_C_FLAGS="$CFLAGS -DNDEBUG" \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS -DNDEBUG" \
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
