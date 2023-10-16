pkgname=antiduplx-git
_pkgver=1.0.1
pkgver=1.0.1.r31.d597451
pkgrel=1
pkgdesc="Command line tool to find and remove similar pictures"
arch=('x86_64')
url="https://github.com/ermig1979/AntiDuplX"
license=(MIT)
depends=(
  gcc-libs
  glibc
  libjpeg-turbo
)
makedepends=(
  cmake
  git
  nasm
  ninja
)
source=(
  "$pkgname::git+$url.git"
  "git+https://github.com/ermig1979/Cpl.git"
  "git+https://github.com/ermig1979/Simd.git"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "$pkgname"
  printf "%s.r%s.%s" "$_pkgver" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$pkgname"
  git submodule init
  git config submodule.3rd/Cpl.url "$srcdir/Cpl"
  git config submodule.3rd/Simd.url "$srcdir/Simd"
  git -c protocol.file.allow=always submodule update -- "3rd/Cpl" "3rd/Simd"
}

build() {
  cd "$pkgname"

  cmake -B build -G Ninja -S ./prj/cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DADX_USE_SYSTEM_TURBOJPEG=ON

  cmake --build build
}

package() {
  cd "$pkgname"

  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
