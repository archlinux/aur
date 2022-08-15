# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=shader-slang-git
pkgver=0.24.12+2.g786f48d323
pkgrel=1
pkgdesc='Shading language that makes it easier to build and maintain large shader codebases in a modular and extensible fashion'
url='https://github.com/shader-slang/slang'
arch=('x86_64')
license=('MIT')
source=("git+$url"
        "git+https://github.com/shader-slang/glslang"
        "git+https://github.com/syoyo/tinyobjloader"
        "git+https://github.com/g-truc/glm"
        "git+https://github.com/ocornut/imgui"
        "git+https://github.com/shader-slang/slang-binaries"
        "spirv-tools::git+https://github.com/shader-slang/SPIRV-Tools"
        "spirv-headers::git+https://github.com/KhronosGroup/SPIRV-Headers"
        "git+https://github.com/richgel999/miniz"
        "git+https://github.com/lz4/lz4"
        )
sha1sums=('SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
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
  for external_lib in glslang tinyobjloader glm imgui slang-binaries spirv-tools spirv-headers miniz lz4
  do
    git config submodule."external/$external_lib".url "$srcdir/$external_lib"
  done
  git submodule update
}

pkgver() {
  git -C slang describe --tags --abbrev=10 | sed 's/^v//; s/-/+/; s/-/./'
}

build() {
  cd slang
  msg2 "Generating makefiles"
  premake5 gmake --deps=true --arch=x64
  msg2 "Building shader-slang"
  make config=release_x64
}

check() {
  cd slang
  bin/linux-x64/release/slang-test
}

package() {
  cd slang

  for bin in slangc
  do
    install -Dm755 "bin/linux-x64/release/$bin" "$pkgdir/usr/bin/$bin"
  done

  for lib in libslang{,-glslang,-llvm}.so libgfx.so
  do
    install -Dm755 "bin/linux-x64/release/$lib" "$pkgdir/usr/lib/$lib"
  done

  for header in *.h prelude/*.h
  do
    install -Dm644 "$header" "$pkgdir/usr/include/shader-slang/$header"
  done

  find docs examples -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/shader-slang/{}" \;
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
