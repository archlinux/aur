# Maintainer: MaxCrazy <alex02newton@gmail.com>

pkgname=shatv-git
pkgver=0.1.0.r84.g0d13218
pkgrel=1
pkgdesc='Qt-based IPTV player'
arch=('x86_64')
url='https://github.com/MaxCrazy1101/shatv'
license=('MIT')
depends=(
  'ffmpeg'
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'libarchive'
  'qt6-base'
  'qt6-declarative'
  'qt6-multimedia'
  'qt6-shadertools'
  'zlib'
)
makedepends=(
  'cmake'
  'git'
  'ninja'
  'pkgconf'
  'qt6-tools'
  'toml11'
)
provides=('shatv')
conflicts=('shatv' 'shatv-bin')
source=('git+https://github.com/MaxCrazy1101/shatv.git')
sha256sums=('SKIP')

pkgver() {
  cd shatv
  local describe
  if describe=$(git describe --long --tags --abbrev=7 2>/dev/null); then
    printf '%s' "$describe" | sed 's/^v//;s/-/.r/;s/-/./'
  else
    printf '0.1.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
}

build() {
  cmake -S shatv -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF \
    -DSHATV_ENABLE_ASR=OFF \
    -DSHATV_REQUIRE_LIBARCHIVE=ON \
    -DSHATV_FETCH_TOML11=OFF \
    -DSHATV_FETCH_ZLIB=OFF \
    -DSHATV_LINUX_PACKAGE_DISTRIBUTION=arch
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
