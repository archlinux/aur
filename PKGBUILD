pkgname=wak-git
pkgver=24.10.r24.ge8302cd
pkgrel=1
pkgdesc="wak -- an awk implementation for toybox and standalone"
arch=('any')
url="https://github.com/raygard/wak"
license=('0BSD')
depends=()
makedepends=('git' 'clang' 'make')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

build() {
  cd "$srcdir/wak"

  BASE_CFLAGS="-O3 -march=native -mtune=native \
          -falign-functions=32 -falign-loops=32 \
          -fno-math-errno -fno-trapping-math \
          -fno-semantic-interposition \
          -fomit-frame-pointer -fno-plt \
          -pipe -flto -Wall -Wno-unused \
          -fstrict-aliasing -fno-rtti -fno-exceptions \
          -fmerge-all-constants -ffunction-sections \
          -fdata-sections -fvisibility=hidden"

  BASE_CXXFLAGS="$BASE_CFLAGS"
  BASE_LDFLAGS="-Wl,--icf=safe -Wl,--gc-sections -Wl,-O3 -flto -fno-plt"

  # Clang-only flags
  CLANG_EXTRA_CFLAGS="-fstrict-vtable-pointers -fno-asynchronous-unwind-tables"
  CLANG_EXTRA_CXXFLAGS="$CLANG_EXTRA_CFLAGS"
  CLANG_EXTRA_LDFLAGS="-fuse-ld=lld"

  # Detect compiler
  if command -v clang >/dev/null 2>&1; then
      export CC=clang
      export CXX=clang++
      export CFLAGS="$BASE_CFLAGS $CLANG_EXTRA_CFLAGS"
      export CXXFLAGS="$BASE_CXXFLAGS $CLANG_EXTRA_CXXFLAGS"
      export LDFLAGS="$BASE_LDFLAGS $CLANG_EXTRA_LDFLAGS"
  else
      export CC=gcc
      export CXX=g++
      export CFLAGS="$BASE_CFLAGS"
      export CXXFLAGS="$BASE_CXXFLAGS"
      export LDFLAGS="$BASE_LDFLAGS"
  fi

  ./configure
  make -j$(nproc)
}

package() {
  cd "$srcdir/wak"

  # Install binary
  install -Dm755 wak "$pkgdir/usr/bin/wak"

  # Install manpage
  install -Dm644 wak.man "$pkgdir/usr/share/man/man1/wak.1"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
