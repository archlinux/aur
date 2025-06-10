# Maintainer: Wilken Gottwalt <wilken dot gottwalt at posteo dot net>

pkgname=zig-git
pkgver=0.15.0.r769.g4d7980645961
pkgrel=1
pkgdesc='General-purpose programming language and toolchain'
arch=('aarch64' 'x86_64')
url='https://ziglang.org/'
license=('MIT')
options=('!lto')
conflicts=(zig)
provides=("zig=${pkgver%%.r*}")
depends=("clang>=20" icu libffi libxml2 "lld>=20" "llvm-libs>=20" ncurses xz zlib zstd)
makedepends=(cmake "llvm>=20")
checkdepends=(lib32-glibc)
source=("git+https://github.com/ziglang/zig.git#branch=master"
        "skip-localhost-test.patch")
sha256sums=('SKIP'
            'eeb5f0f72035c52bf558ffc77a171a3ddf93eac7d663ef0c82826007763717a8')

pkgver() {
  cd zig

  MAJ=$(grep "set(ZIG_VERSION_MAJOR" CMakeLists.txt | cut -d' ' -f2 | cut -d')' -f1)
  MIN=$(grep "set(ZIG_VERSION_MINOR" CMakeLists.txt | cut -d' ' -f2 | cut -d')' -f1)
  PAT=$(grep "set(ZIG_VERSION_PATCH" CMakeLists.txt | cut -d' ' -f2 | cut -d')' -f1)
  HASH=$(git describe --long --tags --abbrev=12 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g' | cut -d'.' -f4,5)
  echo "$MAJ.$MIN.$PAT.${HASH}"
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
  cmake --build build --parallel ${MAKEFLAGS//-j}
}

package() {
  cd zig

  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  DESTDIR=${pkgdir} cmake --install build
}
