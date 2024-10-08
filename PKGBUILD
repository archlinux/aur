# Maintainer: Chris Zhang <develop [at] zcy [dot] moe>

pkgname=shader-slang-git
pkgver=2024.13+18.g509409ef11
pkgrel=1
pkgdesc='Shading language that makes it easier to build and maintain large shader codebases in a modular and extensible fashion.'
url='https://github.com/shader-slang/slang'
arch=('x86_64')
license=('MIT')
source=("git+$url"
        "git+https://github.com/shader-slang/glslang"
        "git+https://github.com/syoyo/tinyobjloader"
        "git+https://github.com/g-truc/glm"
        "git+https://github.com/ocornut/imgui"
        "git+https://github.com/shader-slang/slang-binaries"
        # "spirv-tools::git+https://github.com/shader-slang/SPIRV-Tools"
        "spirv-headers::git+https://github.com/KhronosGroup/SPIRV-Headers"
        "git+https://github.com/richgel999/miniz"
        "git+https://github.com/lz4/lz4"
        "git+https://github.com/martinus/unordered_dense"
        "vulkan-headers::git+https://github.com/KhronosGroup/Vulkan-Headers")
sha1sums=('SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          # 'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP')
makedepends=(git)
depends=(glslang)
conflicts=(shader-slang shader-slang-bin)
provides=(shader-slang)

prepare() {
  cd slang
  git submodule init
  for external_lib in glslang tinyobjloader glm imgui slang-binaries spirv-headers miniz lz4 unordered_dense vulkan-headers # spirv-tools
  do
    git config submodule."external/$external_lib".url "$srcdir/$external_lib"
  done
  git -c protocol.file.allow=always submodule update
}

pkgver() {
  git -C slang describe --tags --abbrev=10 | sed 's/^v//; s/-/+/; s/-/./'
}

build() {
  cd slang

  msg2 "Configuring project"
  cmake --preset default
  msg2 "Building shader-slang"
  cmake --build --preset release
}

check() {
  cd slang
#   build/Release/bin/slang-test
}

package() {
  cd slang

  for bin in slangc slangd
  do
    install -Dm755 "build/Release/bin/$bin" "$pkgdir/opt/shader-slang/bin/$bin"
  done

  for lib in libslang{,-glslang,-llvm}.so libgfx.so
  do
    install -Dm755 "build/Release/lib/$lib" "$pkgdir/opt/shader-slang/lib/$lib"
  done

  for header in include/*.h
  do
    install -Dm644 "$header" "$pkgdir/opt/shader-slang/include/$header"
  done

  for header in prelude/*.h
  do
    install -Dm644 "$header" "$pkgdir/opt/shader-slang/include/prelude/$header"
  done

  find docs examples -type f -exec install -Dm644 "{}" "$pkgdir/opt/shader-slang/{}" \;
  install -Dm644 LICENSE "$pkgdir/opt/shader-slang/LICENSE"
  msg2 "You may manually add /opt/shader-slang/bin to your PATH."
}
