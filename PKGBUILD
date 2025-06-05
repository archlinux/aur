# Maintainer: Wilken Gottwalt <wilken dot gottwalt at posteo dot net>

pkgname=zig-git
pkgver=0.14.1.r1.g6d1f0eca773e
pkgrel=1
pkgdesc='General-purpose programming language and toolchain'
arch=('aarch64' 'x86_64')
url='https://ziglang.org/'
license=('MIT')
options=('!lto')
conflicts=(zig)
provides=("zig=${pkgver%%.r*}")
depends=("clang>=19.1" icu libffi libxml2 "lld>=19.1" "llvm-libs>=19.1" ncurses xz zlib zstd)
makedepends=(cmake "llvm>=19.1")
checkdepends=(lib32-glibc)
source=("git+https://github.com/ziglang/zig.git#branch=0.14.x"
        "skip-localhost-test.patch")
sha256sums=('SKIP'
            'eeb5f0f72035c52bf558ffc77a171a3ddf93eac7d663ef0c82826007763717a8')

pkgver() {
  cd zig
  git describe --long --tags --abbrev=12 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${srcdir}/zig

  patch -Np1 -i ${srcdir}/skip-localhost-test.patch

  mkdir -p build
}

build() {
  cd zig

  cmake -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_C_STANDARD=17 \
    -DCMAKE_CXX_STANDARD=20 \
    -DZIG_PIE=ON \
    -DZIG_SHARED_LLVM=ON \
    -DZIG_USE_LLVM_CONFIG=ON \
    -DZIG_TARGET_TRIPLE=native-linux.6.12-gnu.2.40 \
    -DZIG_TARGET_MCPU=baseline
  cmake --build build
}

package() {
  cd zig

  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  DESTDIR=${pkgdir} cmake --install build
}
