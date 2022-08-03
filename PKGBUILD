# Maintainer: truemedian <truemedian at gmail dot com>
pkgname=luvi-git
pkgver=2.14.0.r0.450ec11
pkgrel=1
pkgdesc="A project in-between luv and luvit"
arch=(any)
url="https://github.com/luvit/luvi"
license=('Apache')
depends=('pcre' 'libuv')
makedepends=()
optdepends=()
provides=(luvi)
conflicts=(luvi)
source=("git+$url.git"
        "fix-build-script.patch")
sha256sums=('SKIP'
            '4c9ed62c337f6bbc612a9c6c0ffdb2d1e619afd55ab5f79882a56a268fa8c2be')

pkgver() {
  cd "$srcdir/luvi"
  git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd "$srcdir/luvi"

  patch -i ../fix-build-script.patch

  git submodule init
  git config --remove-section submodule.deps/lua-zlib || true
  git config --remove-section submodule.deps/zlib || true
  git config --remove-section submodule.deps/pcre || true
  git submodule update

  cd "$srcdir/luvi/deps/luv"

  git submodule init
  git config --remove-section submodule.libuv || true
  git config --remove-section submodule.lua || true
  git submodule update

  cd "$srcdir/luvi/deps/lua-openssl"

  git submodule update --init
}

build() {
  cd "$srcdir/luvi"

  CMAKE_FLAGS="-DWITH_SHARED_LIBUV=ON" make regular-shared
  make
}

package() {
  cd "$srcdir/luvi"

  mkdir -p "$pkgdir/usr/bin"
  LUVI_BINDIR="$pkgdir/usr/bin" make install
}
