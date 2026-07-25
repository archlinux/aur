# Maintainer: Chris Zhang <develop [at] zcy [dot] moe>

pkgname=shader-slang-git
pkgver=2026.14
pkgrel=1
pkgdesc='Shading language that makes it easier to build and maintain large shader codebases in a modular and extensible fashion.'
url='https://github.com/shader-slang/slang'
arch=('x86_64')
license=('MIT')
source=("git+$url")
sha256sums=('SKIP')
makedepends=(git)
depends=(glslang)
conflicts=(shader-slang shader-slang-bin)
provides=(shader-slang)
options=(!debug)

prepare() {
  cd slang
  git checkout "v$pkgver"
  git submodule update --init --recursive
}

build() {
  cd slang

  msg2 "Configuring project"
  cmake --preset default
  msg2 "Building shader-slang"
  cmake --build --preset release
}

package() {
  cd "slang/build/slang-$pkgver-linux-x86_64"

  for bin in slangc slangd slangi slang.slang gfx.slang
  do
    install -Dm755 "bin/$bin" "$pkgdir/opt/shader-slang/bin/$bin"
  done

  for lib in libgfx.so "libgfx.so.0.$pkgver" libslang.so libslang-compiler.so "libslang-compiler.so.0.$pkgver" "libslang-glsl-module-$pkgver.so" "libslang-glslang-$pkgver.so" libslang-llvm.so libslang-rt.so "libslang-rt.so.0.$pkgver"
  do
    install -Dm755 "lib/$lib" "$pkgdir/opt/shader-slang/lib/$lib"
  done

  cd include
  for header in *.h
  do
    install -Dm644 "$header" "$pkgdir/opt/shader-slang/include/$header"
  done
  cd ..

  cd ../..
  find docs examples -type f -exec install -Dm644 "{}" "$pkgdir/opt/shader-slang/{}" \;
  install -Dm644 LICENSE "$pkgdir/opt/shader-slang/LICENSE"

  msg2 "You may manually add /opt/shader-slang/bin to your PATH."
}
