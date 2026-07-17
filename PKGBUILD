# Maintainer: Laurent Carlier <lordheavym@gmail.com>

pkgname=libclc-patch-broken-flush-denormal
pkgver=22.1.8
pkgrel=2
pkgdesc="Library requirements of the OpenCL C programming language"
arch=('any')
conflicts=('libclc')
provides=('libclc')
url="https://libclc.llvm.org/"
license=('Apache-2.0 WITH LLVM-exception')
makedepends=('cmake' 'ninja' 'clang' 'llvm' 'python' 'spirv-llvm-translator')
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=(
    $_source_base/llvm-project-$pkgver.src.tar.xz{,.sig}
    https://github.com/llvm/llvm-project/commit/4ee4864ec296d9dc07f0919f18a0c03c19083b1b.diff
)
sha256sums=('922f1817a0df7b1489272d18134ee0087a8b068828f87ac63b9861b1a9965888'
            'SKIP'
            'ca4e4056d8e7d2f513343b5df8cfa3aca3516cf242a575567405f2866d66fa8f')
validpgpkeys=('474E22316ABF4785A88C6E8EA2C794A986419D8A'  # Tom Stellard <tstellar@redhat.com>
              'D574BD5D1D0E98895E3BF90044F2485E45D59042'  # Tobias Hieta <tobias@hieta.se>
              'FFB3368980F3E6BB5737145A316C56D064CACBA5'  # Douglas Yung <douglas.yung@sony.com>
              '71046D1E9C6656BDD61171873E83BABF4A4F9E85'  # Cullen Rhodes <cullen.rhodes@arm.com>
)

prepare() {
  cd llvm-project-$pkgver.src/libclc
  patch -p2 < "${srcdir}/"/4ee4864ec296d9dc07f0919f18a0c03c19083b1b.diff
  mkdir build
}

build() {
  cd llvm-project-$pkgver.src/libclc/build


  local cmake_args=(
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=/usr
  )

  cmake .. "${cmake_args[@]}"
  ninja
}

package() {
  cd llvm-project-$pkgver.src/libclc/build

  DESTDIR="$pkgdir" ninja install

  install -Dm644 "$srcdir/llvm-project-$pkgver.src/libclc/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
