# Maintainer: Aikawa Yataro <aikawayataro at protonmail dot com>
# Contributor: Evangelos Foutras <foutrelis@archlinux.org>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>

# This package is based on extra/lldb

pkgname=lldb-zig-git
pkgver=r525112.d95039d
pkgrel=2
pkgdesc="Next generation, high-performance debugger (jacobly0 Zig patch)"
arch=('x86_64')
url="https://lldb.llvm.org/"
license=('Apache-2.0 WITH LLVM-exception')
depends=('gcc-libs' 'zlib' 'xz' 'libedit' 'ncurses'
         'libxml2' 'python')
makedepends=('cmake' 'ninja' 'swig')
source=('jacobly0-llvm-project::git+https://github.com/jacobly0/llvm-project.git#branch=lldb-zig')
sha256sums=('SKIP')

pkgver() {
  cd jacobly0-llvm-project
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  mkdir jacobly0-llvm-project/build -p
}

build() {
  cd jacobly0-llvm-project/build

  # Build only minimal debug info to reduce size
  CFLAGS=${CFLAGS/-g /-g1 }
  CXXFLAGS=${CXXFLAGS/-g /-g1 }

  local cmake_args=(
    -G Ninja
    -DLLVM_ENABLE_PROJECTS="clang;lldb"
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=/usr/lib/lldb-zig
    -DCLANG_LINK_CLANG_DYLIB=ON
    -DLLVM_LINK_LLVM_DYLIB=ON
  )
  cmake "${cmake_args[@]}" ../llvm
  ninja lldb lldb-server
}

package() {
  cd jacobly0-llvm-project/build

  DESTDIR="$pkgdir" ninja install
  install -d "$pkgdir/usr/bin"
  ln -sf /usr/lib/lldb-zig/bin/lldb "$pkgdir/usr/bin/lldb-zig"
  ln -sf /usr/lib/lldb-zig/bin/lldb-server "$pkgdir/usr/bin/lldb-server-zig"

  install -Dm644 ../LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Compile Python scripts
  python -m compileall -d /usr/lib "$pkgdir/usr/lib"
  python -O -m compileall -d /usr/lib "$pkgdir/usr/lib"
  python -OO -m compileall -d /usr/lib "$pkgdir/usr/lib"
}

# vim:set ts=2 sw=2 et:
