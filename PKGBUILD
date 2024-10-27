# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: nfnty <arch@nfnty.se>

pkgname=shotcut-git
pkgdesc='Cross-platform Qt based Video Editor - Git latest'
pkgver=24.09
pkgrel=1
arch=('x86_64')
url='https://www.shotcut.org'
license=('GPL3')
depends=('qt6-base' 'qt6-declarative' 'qt6-imageformats' 'qt6-multimedia' 'qt6-translations'
         'mlt' 'movit' 'ffmpeg' 'libx264' 'libvpx' 'lame' 'frei0r-plugins' 'ladspa' 'qt6-charts')
optdepends=('swh-plugins: Several audio filters')
makedepends=('qt6-tools' 'git' 'cmake' 'ninja' 'clang')
source=("git+https://github.com/mltframework/shotcut.git")
sha512sums=('SKIP')

prepare() {
  cd shotcut
  sed -e 's|${Qt6_LUPDATE_EXECUTABLE}|/usr/lib/qt6/bin/lupdate|' -i translations/CMakeLists.txt
}

build() {
  cd shotcut
  compile_version=$(echo $pkgver | sed 's/v\([0-9.]*\).*/\1/')

  # https://github.com/mltframework/shotcut/issues/1275
  export CXXFLAGS+=" -DSHOTCUT_NOUPGRADE"

  cmake \
    -Bbuild \
    -GNinja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSHOTCUT_VERSION=$compile_version
  cmake --build build --verbose
}

pkgver() {
  cd shotcut
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

package() {
  cd shotcut

  DESTDIR="${pkgdir}" cmake --install build
}

# vim:set ft=sh sw=2 sts=2 et:
