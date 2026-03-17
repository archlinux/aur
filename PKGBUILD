# Maintainer: Vasiliy Stelmachenok <ventureo@yandex.ru>
# Maintainer: so5iso4ka <so5iso4ka@icloud.com>
pkgname=freesmlauncher
pkgver=2.1.1
pkgrel=1
pkgdesc="Minecraft launcher with offline accounts support"
arch=(x86_64)
url='https://freesmlauncher.org/'
license=('GPL-3.0-only AND LGPL-3.0-or-later AND LGPL-2.0-or-later AND Apache-2.0 AND MIT AND LicenseRef-Batch AND OFL-1.1')
depends=(
  cmark
  gcc-libs
  glibc
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
makedepends=(cmake extra-cmake-modules git jdk17-openjdk ninja scdoc ghc-filesystem gamemode)
optdepends=(
  'glfw-pure: Native Wayland support'
  'openal: to use system OpenAL libraries'
  'visualvm: Profiling support'
  'xorg-xrandr: for older minecraft versions'
  'flite: minecraft voice narration'
)
source=("$pkgname::git+https://github.com/FreesmTeam/FreesmLauncher#tag=$pkgver")
sha256sums=('1510ac408123422a3404e4e3b66a261c24067a60a4fa486c23aa9768f7ea3266')

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

  # Rename to resolve conflict with prismlauncher
  mv "$pkgdir/usr/share/mime/packages/modrinth-mrpack-mime.xml" \
    "$pkgdir/usr/share/mime/packages/$pkgname.xml"
}

# vim:set ts=2 sw=2 et:
