pkgname=zig-git
pkgver=0.16.0.r2848.gb4ffb402c082
pkgrel=1
pkgdesc='General-purpose programming language and toolchain'
arch=('aarch64' 'x86_64')
url='https://ziglang.org/'
license=('MIT')
options=(!debug !lto strip)
conflicts=(zig)
provides=("zig=${pkgver%%.r*}")
depends=("clang>=21" icu libffi libxml2 "lld>=21" "llvm-libs>=21" ncurses xz zlib zstd)
makedepends=(cmake git icu libffi libxml2 "llvm>=21" ncurses ninja xz zlib zstd)
source=("git+https://codeberg.org/ziglang/zig.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd zig

  MAJ=$(grep "set(ZIG_VERSION_MAJOR" CMakeLists.txt | cut -d' ' -f2 | cut -d')' -f1)
  MIN=$(grep "set(ZIG_VERSION_MINOR" CMakeLists.txt | cut -d' ' -f2 | cut -d')' -f1)
  PAT=$(grep "set(ZIG_VERSION_PATCH" CMakeLists.txt | cut -d' ' -f2 | cut -d')' -f1)
  HASH=$(git describe --long --tags --abbrev=12 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g' | cut -d'.' -f4,5)
  echo "$MAJ.$MIN.$PAT.${HASH}"
}

build() {
  CFLAGS="${CFLAGS/-Wp,-D_FORTIFY_SOURCE=3/}"
  CXXFLAGS="${CXXFLAGS/-Wp,-D_FORTIFY_SOURCE=3/}"

  cmake -S zig -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=MinSizeRel \
    -DCMAKE_C_STANDARD=17 \
    -DCMAKE_CXX_STANDARD=20 \
    -DZIG_PIE=ON \
    -DZIG_SHARED_LLVM=ON \
    -DZIG_USE_LLVM_CONFIG=ON \
    -DZIG_TARGET_TRIPLE=native-linux.6.12-gnu.2.40 \
    -DZIG_TARGET_MCPU=baseline

  ninja -C build
}

package() {
  DESTDIR=${pkgdir} ninja -C build install
}
