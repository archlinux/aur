# Maintainer: Felix Schindler <aur at felixschindler dot net>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=compiler-rt8
_pkgname=compiler-rt
pkgver=8.0.1
pkgrel=1
pkgdesc="Compiler runtime libraries for clang (8.x)"
arch=('x86_64')
url="https://compiler-rt.llvm.org/"
license=('custom:University of Illinois/NCSA Open Source License')
depends=('gcc8-libs')
makedepends=('gcc8' 'llvm8' 'cmake' 'ninja' 'python')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('staticlibs')
source=(https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver/$_pkgname-$pkgver.src.tar.xz
        0001-Fix-sanitizer-common-build-with-glibc-2.31.patch)
sha256sums=('11828fb4823387d820c6715b25f6b2405e60837d12a7469e7a8882911c721837'
            '78ba7227c75f62909ce2f93d9609655f0427e12025c9ace666be60aa9c70bc8d')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver.src"

  patch -Np1 -i ../0001-Fix-sanitizer-common-build-with-glibc-2.31.patch

  mkdir build
}

build() {
  cd "$srcdir/$_pkgname-$pkgver.src/build"

  export CC=cc-8
  export CXX=c++-8 

  cmake .. -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  ninja
}

package() {
  cd "$srcdir/$_pkgname-$pkgver.src/build"

  DESTDIR="$pkgdir" ninja install
  install -Dm644 ../LICENSE.TXT "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

  mkdir -p "$pkgdir"/usr/lib/clang/$pkgver/{lib,share}
  mv "$pkgdir"/usr/lib/{linux,clang/$pkgver/lib/}
  mv "$pkgdir"/usr/{share/*.txt,lib/clang/$pkgver/share/}
}

# vim:set ts=2 sw=2 et:
