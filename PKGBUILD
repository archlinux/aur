# Maintainer: Lubosz Sarnecki <lubosz at gmail dot com>

pkgname=superfamiconv-git
pkgver=0.11.0.r4.68e3477
pkgrel=1
pkgdesc='A tile graphics converter with flexible and composable command line options.'
arch=(x86_64)
url=https://github.com/Optiroc/SuperFamiconv
license=(MIT)

depends=(
  gcc-libs
)

makedepends=(
  ninja
  cmake
  git
)
provides=(superfamiconv)
conflicts=(superfamiconv)
source=("git+https://github.com/Optiroc/SuperFamiconv.git")
md5sums=(SKIP)

pkgver() {
  cd SuperFamiconv
  git describe --tags | sed 's/^v//; s/-dev//; s/-/.r/; s/-g/./'
}

prepare() {
  cd SuperFamiconv
  # Readd install target, upstream has reverted it (by accdent?)
  git cherry-pick -n 2d4c6bafa6d83c2cb8aacaadac20e03644b49601
}

build() {
  local cmake_options=(
    -B build
    -G Ninja
    -S SuperFamiconv
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_INSTALL_PREFIX='/usr'
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$srcdir/SuperFamiconv/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
