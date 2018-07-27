pkgname=redox-newlib
pkgver=r17774.d5ac42a49
pkgrel=1
arch=(i686 x86_64)
license=(GPL)
source=("git+https://github.com/redox-os/newlib#branch=redox")
md5sums=('SKIP')
makedepends=('git' 'rustup' redox-binutils redox-gcc-freestanding)

prepare() {
  cd "$srcdir/newlib"

  rustup override set nightly-2018-04-27
  rustup component add rust-src

  rm -rf $srcdir/xargo
  cargo install --root $srcdir/xargo xargo

  rm -rf $srcdir/newlib-build
  mkdir $srcdir/newlib-build
}

build() {
  cd "$srcdir/newlib-build"
  $srcdir/newlib/configure --target=$_target --prefix=/usr --enable-newlib-iconv
  PATH=$srcdir/xargo/bin:$PATH make all
}

package() {
  cd "$srcdir/newlib-build"
  make DESTDIR="$pkgdir" install
}

pkgver() {
  cd "$srcdir/newlib"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
