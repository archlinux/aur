# Maintainer: Chris Arndt <aur -at- chrisarndt -dot- de>

_projname=Signet
# 'signet' is already taken by https://aur.archlinux.org/packages/signet
pkgname=${_projname,,}-tool
pkgver=0.3.0
pkgrel=1
pkgdesc='A command-line program designed for bulk editing of audio files'
arch=(aarch64 x86_64)
url='https://github.com/SamWindell/Signet'
license=(BSD-3-Clause)
groups=(pro-audio)
depends=(gcc-libs glibc)
makedepends=(cmake)
checkdepends=()
source=("$_projname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9d0d8b73dbb4805dcb9e4eb43f8116907d6e64a547b38c8322a2c61ecce09ed9')

build() {
  local cmake_options=(
    -B build-$pkgname
    -S $_projname-$pkgver
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    -D CMAKE_INSTALL_PREFIX=/usr
  )
  cmake "${cmake_options[@]}"
  cmake --build build-$pkgname
}

check() {
  # Tests assume <srcdir>/build as build directory
  ln -sf ../build-$pkgname $_projname-$pkgver/build
  ctest --test-dir build-$pkgname -C None --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build-$pkgname
  # Rename conflicting binary
  mv -vf "$pkgdir"/usr/bin/{${_projname,,},$pkgname}
  cd $_projname-$pkgver
  # license
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
  # Documentation
  install -vDm 644 *.md docs/*.md -t "$pkgdir"/usr/share/doc/$pkgname
}
