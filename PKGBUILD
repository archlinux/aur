# Maintainer: Matt Harrison <matt@harrison.us.com>

# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=zig0.16
pkgver=0.16.0
pkgrel=1
pkgdesc='Zig 0.16 compiler and toolchain'
arch=('x86_64' 'aarch64')
url='https://ziglang.org/'
license=('MIT')
depends=('clang21' 'glibc' 'libstdc++' 'lld21' 'llvm21-libs')
makedepends=('cmake' 'llvm21' 'minisign')
conflicts=('zig0.16-bin')
options=('!debug' '!lto')
_archive="zig-${pkgver}.tar.xz"
source=("https://ziglang.org/download/${pkgver}/${_archive}"
        "https://ziglang.org/download/${pkgver}/${_archive}.minisig"
        'zig-0.16-elf-pc64.patch::https://codeberg.org/ziglang/zig/commit/9df02121d0d87c17173f79d55692bed9cb65722c.patch')
noextract=("${_archive}")
sha256sums=('43186959edc87d5c7a1be7b7d2a25efffd22ce5807c7af99067f86f99641bfdf'
            '97ebc1e4b5e22e68073e56e75270d8f38011637ec7b4375d125b93e4c109f02e'
            'cc513105cd250a107fcdefa6fed1147040f3cac4d377d545617840bd830da8d3')

prepare() {
  cd "${srcdir}"
  local zig_key='RWSGOq2NVecA2UPNdBUZykf1CCb147pkmdtYxgb3Ti+JO/wCYvhbAb/U'
  minisign -Vm "${_archive}" -P "${zig_key}"
  bsdtar -xf "${_archive}"

  cd "zig-${pkgver}"
  # Backport the ELF relocation fix used by Arch's Zig 0.16.0 package.
  patch -Np1 -i "${srcdir}/zig-0.16-elf-pc64.patch"
}

build() {
  cd "${srcdir}/zig-${pkgver}"
  export ZIG_GLOBAL_CACHE_DIR="${srcdir}/zig-cache"

  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX="/opt/${pkgname}" \
    -DZIG_PIE=ON \
    -DZIG_SHARED_LLVM=ON \
    -DZIG_USE_LLVM_CONFIG=ON \
    -DZIG_TARGET_TRIPLE=native-linux.6.6-gnu.2.40 \
    -DZIG_TARGET_MCPU=baseline \
    -DZIG_VERSION="${pkgver}"
  cmake --build build
}

check() {
  cd "${srcdir}/zig-${pkgver}"
  export ZIG_GLOBAL_CACHE_DIR="${srcdir}/zig-cache"

  local zig=build/stage3/bin/zig
  [[ "$("${zig}" version)" == "${pkgver}" ]] || return 1
  cat > build/smoke.zig <<'EOF'
const std = @import("std");

test "the compiler can use the standard library" {
    try std.testing.expectEqual(@as(usize, 3), "zig".len);
}
EOF
  "${zig}" test -fllvm build/smoke.zig
}

package() {
  cd "${srcdir}/zig-${pkgver}"
  export ZIG_GLOBAL_CACHE_DIR="${srcdir}/zig-cache"

  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -d "${pkgdir}/usr/bin" "${pkgdir}/usr/lib"
  ln -s "../../opt/${pkgname}/bin/zig" "${pkgdir}/usr/bin/zig-${pkgver%.*}"
  ln -s "../../opt/${pkgname}/lib/zig" "${pkgdir}/usr/lib/${pkgname}"
}
