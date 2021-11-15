# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Jason Chu <jchu@xentac.net>

pkgname=lib32-openal
pkgver=1.21.1
pkgrel=2
pkgdesc="Cross-platform 3D audio library, software implementation (32-bit)"
arch=(x86_64)
url="https://github.com/kcat/openal-soft"
license=(LGPL)
depends=(lib32-gcc-libs openal)
makedepends=(lib32-alsa-lib lib32-libpulse lib32-fluidsynth lib32-portaudio
             lib32-jack git cmake ninja)
optdepends=('lib32-fluidsynth: MIDI rendering')
_commit=ae4eacf147e2c2340cc4e02a790df04c793ed0a9  # tags/1.21.1
source=("git+https://github.com/kcat/openal-soft#commit=$_commit")
sha512sums=('SKIP')

pkgver() {
  cd openal-soft
  git describe --tags | sed 's/^openal-soft-//;s/-/+/g'
}

prepare() {
  cd openal-soft

  # Missing include
  git cherry-pick -n 302e88dbf0f10224a5b87be4ce43b3fdd9d20184

  # https://bugs.archlinux.org/task/72729
  git cherry-pick -n b7ff1de48efda9ad54e6a3b4c1526722c371e832
}

build() {
  export CC="gcc -m32 -mstackrealign"
  export CXX="g++ -m32 -mstackrealign"
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config

  cmake -S openal-soft -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_LIBDIR=lib32
  cmake --build build
}

package() {
  provides+=(libopenal.so)

  DESTDIR="$pkgdir" cmake --install build
  rm -rv "$pkgdir"/usr/{include,share,bin}
}
