# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: BrinkerVII <brinkervii@gmail.com>

pkgname=luau
pkgver=0.609
pkgrel=1
pkgdesc="A fast, small, safe, gradually typed embeddable scripting language derived from Lua"
arch=(x86_64)
url="https://github.com/luau-lang/luau"
license=(MIT)
depends=(
  gcc-libs
  glibc
)
makedepends=(cmake)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
  "Luau.pc"
)
sha256sums=(
  '849dcf7288a3ecf2b07458e98a850e453d2d37b70f808e5e01b2c6e65e3b4c21'
  'f65bc28fd66aac60cc8c7a33c7e64bec7ed296a69628dce57d2dfa57ba7ebab4'
)

_archive="$pkgname-$pkgver"

build() {
  cd "$_archive"

  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev \
    -DLUAU_BUILD_TESTS=ON \
    -DCMAKE_CXX_FLAGS="-Wstringop-overread"
  cmake --build build
}

check() {
  cd "$_archive"

  ./build/Luau.Conformance
  ./build/Luau.UnitTest
}

package() {
  cd "$_archive"

  _executables=(
    luau
    luau-analyze
    luau-ast
    luau-bytecode
    luau-compile
    luau-reduce
  )
  for executable in "${_executables[@]}"; do
    install -Dm755 -t "$pkgdir/usr/bin" "build/$executable"
  done

  _libraries=(
    libLuau.Analysis.a
    libLuau.Ast.a
    libLuau.CodeGen.a
    libLuau.Compiler.a
    libLuau.Config.a
    libLuau.VM.a
    libisocline.a
  )
  for library in "${_libraries[@]}"; do
    install -Dm644 -t "$pkgdir/usr/lib/Luau" "build/$library"
  done

  _headers=(
    ./Analysis/include/Luau/*.h
    ./Ast/include/Luau/*.h
    ./CodeGen/include/*.h
    ./CodeGen/include/Luau/*.h
    ./Common/include/Luau/*.h
    ./Compiler/include/*.h
    ./Compiler/include/Luau/*.h
    ./Config/include/Luau/*.h
    ./VM/include/*.h
    ./extern/isocline/include/*.h
  )
  for header in "${_headers[@]}"; do
    install -Dm644 -t "$pkgdir/usr/include/Luau" "$header"
  done

  install -Dm644 "$srcdir/Luau.pc" "$pkgdir/usr/lib/pkgconfig/Luau.pc"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
  install -Dm644 extern/isocline/LICENSE "$pkgdir/usr/share/licenses/$pkgname/isocline-LICENSE.txt"
}
