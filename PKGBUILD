# Maintainer: Chris Zhang <develop [at] zcy [dot] moe>

pkgname=shader-slang-git
pkgver=2024.1.6+10.gc0482ec12d
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
makedepends=(premake git)
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
  chmod +x external/slang-binaries/premake/premake-5.0.0-alpha16/bin/linux-64/premake5
  msg2 "Generating makefiles"
  external/slang-binaries/premake/premake-5.0.0-alpha16/bin/linux-64/premake5 gmake2 --deps=true --arch=x64
  msg2 "Building shader-slang"
  make config=release_x64
}

check() {
  cd slang
  bin/linux-x64/release/slang-test
}

package() {
  cd slang

  for bin in slangc slangd
  do
    install -Dm755 "bin/linux-x64/release/$bin" "$pkgdir/opt/shader-slang/bin/$bin"
  done

  for lib in libslang{,-glslang,-llvm}.so libgfx.so
  do
    install -Dm755 "bin/linux-x64/release/$lib" "$pkgdir/opt/shader-slang/bin/$lib"
  done

  for header in *.h prelude/*.h
  do
    install -Dm644 "$header" "$pkgdir/opt/shader-slang/$header"
  done

  find docs examples -type f -exec install -Dm644 "{}" "$pkgdir/opt/shader-slang/{}" \;
  install -Dm644 LICENSE "$pkgdir/opt/shader-slang/LICENSE"
  msg2 "You may manually add /opt/shader-slang/bin to your PATH."
}
