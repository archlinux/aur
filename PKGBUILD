# Maintainer: Vasiliy Stelmachenok <ventureo@yandex.ru>
pkgname=freesmlauncher
pkgver=1.3.3
pkgrel=1
pkgdesc="Minecraft launcher with offline accounts support"
arch=(x86_64)
url='https://freesmlauncher.windstone.space/'
license=('GPL-3.0-only AND LGPL-3.0-or-later AND LGPL-2.0-or-later AND Apache-2.0 AND MIT AND LicenseRef-Batch AND OFL-1.1')
depends=(
  glibc
  gcc-libs
  java-runtime
  libgl
  qt6-base
  qt6-5compat
  qt6-svg
  qt6-imageformats
  qt6-networkauth
  quazip-qt6
  zlib
  hicolor-icon-theme
  tomlplusplus
  cmark
)
makedepends=(cmake extra-cmake-modules git jdk17-openjdk scdoc ghc-filesystem gamemode)
optdepends=(
  'glfw-pure: Native Wayland support'
  'openal: to use system OpenAL libraries'
  'visualvm: Profiling support'
  'xorg-xrandr: for older minecraft versions'
  'flite: minecraft voice narration'
)
source=("git+https://github.com/FreesmTeam/FreesmLauncher#tag=sequoia-$pkgver")
sha256sums=('9a2b92b503fcdc9dc324705d0eb6b6880817417a7cc65f3d02cf6490886c50db')

prepare() {
  cd "FreesmLauncher"
  git remote set-url origin https://github.com/FreesmTeam/FreesmLauncher
  git submodule update --init --filter=tree:0 --recursive
}

build() {
  cd "FreesmLauncher"

  export PATH="/usr/lib/jvm/java-17-openjdk/bin/:$PATH"

  cmake -DCMAKE_BUILD_TYPE= \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DLauncher_QT_VERSION_MAJOR="6" \
    -DLauncher_ENABLE_JAVA_DOWNLOADER=ON \
    -Bbuild -S.
  cmake --build build
}

check() {
  cd "FreesmLauncher"
  ctest .
}

package() {
  cd "FreesmLauncher/build"
  DESTDIR="$pkgdir" cmake --install .
}

# vim:set ts=2 sw=2 et:
