# Maintainer: Pablo Palazon <ppalazon@phyxor.com>
# Contributor: Jordan Rudess <jrudess@gmail.com>

_pkgname=slang
pkgname=$_pkgname-verilog
pkgver=11.0
pkgrel=1
pkgdesc="SystemVerilog Language Services"
arch=('x86_64')
url="https://github.com/MikePopoloski/slang"
license=('MIT')
depends=('fmt' 'mimalloc' 'glibc' 'libstdc++' 'libgcc')
makedepends=('cmake' 'gcc')
checkdepends=('catch2')
provides=('slang-verilog')
conflicts=('slang-verilog-git')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/MikePopoloski/slang/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('50676d5a9adbefb97d266a4b174e6b0513901afd5ac57a6cdfea0a61149c3704')

prepare() {
  cd "$_pkgname-$pkgver"
  # fmt >= 10 moved fmt::format() from core.h to format.h
  sed -i 's|#include <fmt/core.h>|#include <fmt/format.h>|g' \
    include/slang/util/CommandLine.h \
    source/analysis/AbstractFlowAnalysis.cpp \
    source/numeric/Time.cpp \
    source/numeric/SVInt.cpp \
    source/driver/SourceLoader.cpp \
    source/util/TimeTrace.cpp \
    source/util/CommandLine.cpp \
    source/util/Util.cpp \
    source/parsing/Lexer.cpp \
    source/ast/Compilation.cpp \
    source/ast/statements/ConditionalStatements.cpp

  # fmt 12 deprecated implicit string_view conversion in format_string
  sed -i 's|fmt::string_view(fmt)|fmt.get()|g' \
    include/slang/text/FormatBuffer.h
}

build() {
  local cmake_options=(
		-B build
    -S $_pkgname-$pkgver
    -W no-author 
    -D CMAKE_CXX_COMPILER=g++ 
    -D CMAKE_BUILD_TYPE=None 
    -D CMAKE_INSTALL_PREFIX=/usr 
		-D CMAKE_INSTALL_LIBDIR=lib 
    -D BUILD_SHARED_LIBS=ON 
    -D SLANG_USE_MIMALLOC=ON 
    -D FETCHCONTENT_FULLY_DISCONNECTED=ON
		-D CMAKE_CXX_SCAN_FOR_MODULES=OFF
		# -D SLANG_USE_SYSTEM_FMT=ON
		# -D SLANG_USE_SYSTEM_BOOST=ON
		-D SLANG_USE_MIMALLOC=ON
		-D SLANG_INCLUDE_TOOLS=ON
		-D SLANG_INCLUDE_TESTS=ON
		-D SLANG_INCLUDE_INSTALL=ON
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

check() {
  local excluded_tests=""
  local ctest_flags=(
    --test-dir build
    --output-on-failure
    --parallel $(nproc)
    --exclude-regex "$excluded_tests"
  )
  ctest "${ctest_flags[@]}"
}

package() {
  DESTDIR="$pkgdir" cmake --install build

	install -Dm644 "$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
