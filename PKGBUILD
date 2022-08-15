# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=shader-slang
pkgver=0.24.12
_commit_glm=0d973b4
_commit_glslang=42398c9
_commit_imgui=fd2a90e
_commit_lz4=d443718
_commit_miniz=a426483
_commit_slang_binaries=ee043c6
_commit_spirv_headers=36c0c15
_commit_spirv_tools=60761de
_commit_tinyobjloader=d541711
pkgrel=1
pkgdesc='Shading language that makes it easier to build and maintain large shader codebases in a modular and extensible fashion'
url='https://github.com/shader-slang/slang'
arch=('x86_64')
license=('MIT')
source=("$url/archive/refs/tags/v$pkgver.tar.gz"
        "git+https://github.com/shader-slang/glslang#commit=$_commit_glslang"
        "git+https://github.com/syoyo/tinyobjloader#commit=$_commit_tinyobjloader"
        "git+https://github.com/g-truc/glm#commit=$_commit_glm"
        "git+https://github.com/ocornut/imgui#commit=$_commit_imgui"
        "git+https://github.com/shader-slang/slang-binaries#commit=$_commit_slang_binaries"
        "spirv-tools::git+https://github.com/shader-slang/SPIRV-Tools#commit=$_commit_spirv_tools"
        "spirv-headers::git+https://github.com/KhronosGroup/SPIRV-Headers#commit=$_commit_spirv_headers"
        "git+https://github.com/richgel999/miniz#commit=$_commit_miniz"
        "git+https://github.com/lz4/lz4#commit=$_commit_lz4"
        )
sha1sums=('4a07dc97a2fefba1fd9ad2cd487886926db33380'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP')
makedepends=(premake)
depends=(glslang)

prepare() {
  cd slang-$pkgver
  for f in glslang tinyobjloader glm imgui slang-binaries spirv-tools spirv-headers miniz lz4
  do
    rmdir external/$f
    ln -s "$srcdir/$f" external/$f
  done

  # Allow building the project on a newer system than the upstream devs use
  sed /FatalWarnings/d -i premake5.lua
}

build() {
  cd slang-$pkgver
  msg2 "Generating makefiles"
  premake5 gmake --deps=true --arch=x64
  msg2 "Building shader-slang"
  make config=release_x64
}

check() {
  cd slang-$pkgver
  bin/linux-x64/release/slang-test
}

package() {
  cd slang-$pkgver

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
