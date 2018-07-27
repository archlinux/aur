pkgname=redox-binutils
pkgver=r89563.fca55db437
pkgrel=1
arch=(any)
license=(GPL)
source=(git+https://github.com/redox-os/binutils-gdb)
makedepends=('git')
md5sums=('SKIP')

prepare() {
  cd "$srcdir/binutils-gdb"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
}

build() {
  cd "$srcdir/binutils-gdb"

  ./configure \
	  --target=$_target \
	  --prefix=/usr \
	  --with-sysroot=/usr/$_target \
	  --disable-gdb \
          --disable-nls \
	  --disable-werror

  make
}

package() {
  cd "$srcdir/binutils-gdb"
  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir"/usr/share/info
}

pkgver() {
  cd "$srcdir/binutils-gdb"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
