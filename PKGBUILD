# Maintainer: Eric Engestrom <aur@engestrom.ch>

pkgname=fex-emu-git
pkgver=2208+11.ga2f4f494a9
pkgrel=1
pkgdesc='Fast usermode x86 and x86-64 emulator for Arm64'
url=https://fex-emu.org
arch=(aarch64 x86_64)
license=(MIT)
makedepends=(git cmake ninja clang nasm)
depends=(sdl2 libepoxy squashfs-tools squashfuse)
source=("git+https://github.com/FEX-Emu/FEX"
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
        "git+https://github.com/Tessil/robin-map"
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
            'SKIP'
            )
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%+*}")

prepare() {
  cd FEX
  git submodule init
  for f in \
    Catch2 \
    Vulkan-Headers \
    cpp-optparse \
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
  git submodule update
}

pkgver() {
  git -C FEX describe --tags --abbrev=10 | sed 's/^FEX-//; s/-/+/; s/-/./'
}

build() {
  FEX_OPTIONS=()
  FEX_OPTIONS+=(-D ENABLE_LTO=True)

  if command -V ld.mold &>/dev/null
  then
    FEX_OPTIONS+=(-D ENABLE_MOLD=True)
  elif command -V ld.lld &>/dev/null
  then
    FEX_OPTIONS+=(-D ENABLE_LLD=True)
  fi

  if [ $CARCH = x86_64 ]
  then
    FEX_OPTIONS+=(-D ENABLE_X86_HOST_DEBUG=True)
  fi

  CC=clang \
  CXX=clang++ \
  cmake \
    -S FEX -B build -G Ninja \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_BUILD_TYPE=Release \
    "${FEX_OPTIONS[@]}"
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install

  install -Dm644 "$srcdir"/FEX/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
