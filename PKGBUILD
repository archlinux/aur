# Maintainer: truemedian <truemedian at gmail dot com>
pkgname=luvi-git
pkgver=2.15.0.r0.32b274b
pkgrel=1
pkgdesc="A project in-between luv and luvit"
arch=(x86_64 i686 aarch64 armv7h)
url="https://github.com/luvit/luvi"
license=('Apache-2.0')
depends=('glibc' 'pcre2' 'libluv' 'luajit' 'libuv' 'openssl')
makedepends=('cmake')
provides=(luvi)
conflicts=(luvi)
source=("git+$url.git"
  "no-recursive-fetch.patch"
  "fix-shared-lua-openssl.patch")
sha256sums=('SKIP'
  '691353d6ba19b3ec623b94a8f51ff0a9d6171340a0d868153bfdef340068cee6'
  '83ff75797e02aa7e612625575367f29ef38044ff734832bfb820d17d7088953c')

pkgver() {
  cd "$srcdir/luvi"
  git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd "$srcdir/luvi"

  patch -i ../no-recursive-fetch.patch
  patch -i ../fix-shared-lua-openssl.patch -p 1

  git submodule init
  git config --remove-section submodule.deps/luv || true
  git config --remove-section submodule.deps/zlib || true
  git config --remove-section submodule.deps/lua-zlib || true
  git config --remove-section submodule.deps/pcre2 || true
  git submodule update

  # no longer necessary, libluv is provided as a shared library
  # cd "$srcdir/luvi/deps/luv"

  # git submodule init
  # git config --remove-section submodule.libuv || true
  # git config --remove-section submodule.lua || true
  # git submodule update

  cd "$srcdir/luvi/deps/lua-openssl"

  git submodule update --init
}

check() {
  cd "$srcdir/luvi"

  make test
}

build() {
  cd "$srcdir/luvi"

  make regular \
    WITH_SHARED_LIBLUV=ON \
    WITH_SHARED_OPENSSL=ON \
    WITH_SHARED_PCRE2=ON
  make
}

package() {
  cd "$srcdir/luvi"

  mkdir -p "$pkgdir/usr/bin"
  make install PREFIX="$pkgdir/usr"
}
