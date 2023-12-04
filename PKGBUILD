# Maintainer: Eric Engestrom <aur@engestrom.ch>

pkgname=fex-emu
pkgver=2312
pkgrel=1
pkgdesc='Fast usermode x86 and x86-64 emulator for Arm64'
url=https://fex-emu.com
arch=(aarch64)
license=(MIT)
makedepends=(git cmake ninja clang llvm python-setuptools)
depends=(sdl2 libepoxy squashfs-tools squashfuse erofs-utils)
source=("git+https://github.com/FEX-Emu/FEX#tag=FEX-$pkgver"
        "git+https://github.com/catchorg/Catch2"
        "git+https://github.com/KhronosGroup/Vulkan-Headers"
        "git+https://github.com/Sonicadvance1/cpp-optparse"
        "git+https://github.com/FEX-Emu/drm-headers"
        "git+https://github.com/FEX-Emu/fex-gcc-target-tests-bins"
        "git+https://github.com/FEX-Emu/fex-gvisor-tests-bins"
        "git+https://github.com/FEX-Emu/fex-posixtest-bins"
        "git+https://github.com/fmtlib/fmt"
        "git+https://github.com/Sonicadvance1/imgui"
        "git+https://github.com/FEX-Emu/jemalloc"
        "git+https://github.com/Sonicadvance1/json-maker"
        "git+https://github.com/FEX-Emu/robin-map"
        "git+https://github.com/Sonicadvance1/tiny-json"
        "git+https://github.com/FEX-Emu/vixl"
        "git+https://github.com/FEX-Emu/xbyak"
        "git+https://github.com/FEX-Emu/xxhash"
        )
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd FEX
  git submodule init
  for f in \
    Catch2 \
    Vulkan-Headers \
    drm-headers \
    fex-gcc-target-tests-bins \
    fex-gvisor-tests-bins \
    fex-posixtest-bins \
    fmt \
    imgui \
    jemalloc \
    json-maker \
    robin-map \
    tiny-json \
    vixl \
    xbyak \
    xxhash \
    ;
  do
    git config submodule."External/$f".url "$srcdir/$f"
  done

  git config submodule."External/jemalloc_glibc".url "$srcdir/jemalloc"

  for f in \
    cpp-optparse \
    ;
  do
    git config submodule."Source/Common/$f".url "$srcdir/$f"
  done

  git -c protocol.file.allow=always submodule update
}

build() {
  FEX_OPTIONS=()
  FEX_OPTIONS+=(-D ENABLE_LTO=True)
  FEX_OPTIONS+=(-D BUILD_TESTS=False)

  if command -V ld.mold &>/dev/null
  then
    FEX_OPTIONS+=(-D ENABLE_MOLD=True)
  elif command -V ld.lld &>/dev/null
  then
    FEX_OPTIONS+=(-D ENABLE_LLD=True)
  fi

  CC=clang \
  CXX=clang++ \
  cmake \
    -S FEX -B build -G Ninja \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_BUILD_TYPE=Release \
    -D FMT_INSTALL=False \
    "${FEX_OPTIONS[@]}"
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install

  install -Dm644 "$srcdir"/FEX/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
