# Maintainer: Maxime Arthaud <maxime@arthaud.me>

pkgname=ikos-git
pkgver=3.0.r409.72c70c7
pkgrel=1
pkgdesc='Static analyzer for C and C++ developed by NASA'
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url='https://github.com/nasa-sw-vnv/ikos'
license=('custom:NOSA 1.3')
provides=('ikos')
depends=('gmp'
         'boost-libs'
         'python'
         'python-pygments'
         'sqlite'
         'intel-tbb'
         'llvm'
         'llvm-libs'
         'clang'
         'apron')
makedepends=('cmake'
             'boost')
source=("$pkgname::git://github.com/nasa-sw-vnv/ikos.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "%s.r%s.%s" \
    "$(git describe --tags --abbrev=0 | sed 's/^v//')" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  mkdir build
}

build() {
  cd "$srcdir/$pkgname/build"
  cmake \
    -DCMAKE_BUILD_TYPE="Release" \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DLLVM_CONFIG_EXECUTABLE="/usr/bin/llvm-config" \
    -DAPPEND_GIT_VERSION=ON \
    ..
  make
}

package() {
  cd "$srcdir/$pkgname/build"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/$pkgname/LICENSE.pdf" "$pkgdir/usr/share/licenses/ikos/LICENSE"
}

check() {
  cd "$srcdir/$pkgname/build"
  make check
}
