pkgname=zig-git
pkgver=0.17.0.r245.gf7a607ef68c9
pkgrel=1
pkgdesc='General-purpose programming language and toolchain'
arch=('aarch64' 'x86_64')
url='https://ziglang.org/'
license=('MIT')
conflicts=(zig)
provides=("zig=${pkgver%%.r*}")
depends=(clang compiler-rt icu libffi libxml2 lld llvm-libs ncurses python xz zlib zstd)
makedepends=(clang cmake compiler-rt git icu libffi lld libxml2 llvm llvm-libs ncurses xz zlib zstd)
options=(!emptydirs staticlibs lto)
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
  CFLAGS="${CFLAGS/-Wp,-D_FORTIFY_SOURCE=3/} -ffat-lto-objects"
  CXXFLAGS="${CXXFLAGS/-Wp,-D_FORTIFY_SOURCE=3/} -ffat-lto-objects"

  cmake -S zig -B build -G "Unix Makefiles" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=MinSizeRel \
    -DCMAKE_C_STANDARD=17 \
    -DCMAKE_CXX_STANDARD=20 \
    -DZIG_PIE=ON \
    -DZIG_SHARED_LLVM=ON \
    -DZIG_USE_LLVM_CONFIG=ON \
    -DZIG_TARGET_TRIPLE=native-linux.6.18-gnu.2.42 \
    -DZIG_TARGET_MCPU=baseline
  cmake --build build
}

package() {
  DESTDIR=${pkgdir} cmake --install build
  install -Dm644 ${srcdir}/zig/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  rm ${pkgdir}/usr/doc/langref.html
}
